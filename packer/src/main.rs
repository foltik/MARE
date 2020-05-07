use byteorder::{NativeEndian, ReadBytesExt, WriteBytesExt};
use iced_x86::{
    BlockEncoder, BlockEncoderOptions, Code as C, Decoder, DecoderOptions, Formatter,
    Instruction as I, InstructionBlock, IntelFormatter, Register as R,
};
use std::borrow::Cow;
use std::fs;
use std::io::Cursor;
use std::path::Path;

type Dwarf<'a> = gimli::Dwarf<Cow<'a, [u8]>>;

fn read_elf(path: &str) -> elf::File {
    elf::File::open_path(Path::new(path)).unwrap()
}

fn read_dwarf(elf: &elf::File) -> Dwarf {
    Dwarf::load(
        |id| -> Result<Cow<[u8]>, gimli::Error> {
            Ok(match elf.get_section(id.name()) {
                Some(section) => Cow::Borrowed(&section.data),
                None => Cow::Borrowed(&[][..]),
            })
        },
        |_| Ok(Cow::Borrowed(&[][..])),
    )
    .unwrap()
}

#[derive(Debug)]
struct Sub {
    name: String,
    start: usize,
    end: usize,
    len: usize,
}

fn read_subroutines(dwarf: &Dwarf) -> Vec<Sub> {
    let dwarf = dwarf.borrow(|section| gimli::EndianSlice::new(&*section, gimli::NativeEndian));
    let str = |offset| {
        dwarf
            .string(offset)
            .unwrap()
            .to_string()
            .unwrap()
            .to_owned()
    };

    let mut subs = Vec::new();

    let mut iter = dwarf.units();
    while let Some(header) = iter.next().unwrap() {
        let unit = dwarf.unit(header).unwrap();

        // Iterate over the Debugging Information Entries in the unit
        let mut entries = unit.entries();
        while let Some((_, entry)) = entries.next_dfs().unwrap() {
            match entry.tag() {
                gimli::DW_TAG_subprogram => {
                    let mut name = None;
                    let mut start = None;
                    let mut len = None;

                    // Iterate over the attributes in the DIE
                    let mut attrs = entry.attrs();
                    while let Some(attr) = attrs.next().unwrap() {
                        match attr.name() {
                            gimli::DW_AT_name => {
                                name = match attr.value() {
                                    gimli::AttributeValue::DebugStrRef(offset) => Some(str(offset)),
                                    _ => None,
                                }
                            }
                            gimli::DW_AT_low_pc => {
                                start = match attr.value() {
                                    gimli::AttributeValue::Addr(addr) => Some(addr as usize),
                                    _ => None,
                                }
                            }
                            gimli::DW_AT_high_pc => {
                                len = match attr.value() {
                                    gimli::AttributeValue::Udata(len) => Some(len as usize),
                                    _ => None,
                                }
                            }
                            _ => {}
                        };
                    }

                    subs.push(Sub {
                        name: name.unwrap(),
                        start: start.unwrap(),
                        end: start.unwrap() + len.unwrap(),
                        len: len.unwrap(),
                    })
                }
                _ => {}
            }
        }
    }

    subs
}

fn decode_subroutine(sub: &Sub, bytes: &[u8]) -> Vec<I> {
    let bytes = &bytes[sub.start..sub.end];
    let mut decoder = Decoder::new(64, bytes, DecoderOptions::NONE);
    decoder.set_ip(sub.start as u64);
    decoder.into_iter().collect()
}

fn i_bytes<'a>(i: &I, bytes: &'a [u8]) -> &'a [u8] {
    let (start, end) = (i.ip() as usize, i.ip() as usize + i.len());
    &bytes[start..end]
}

fn format_instruction(i: &I, start: usize, bytes: &[u8]) -> String {
    let mut formatter = IntelFormatter::new();
    let mut out = String::new();

    out.push_str(&format!("{:08x} <+{:04x}> ", i.ip(), i.ip() as usize - start));
    let bytes = i_bytes(i, bytes);
    for b in bytes {
        out.push_str(&format!("{:02x} ", b));
    }

    if i.len() < 12 {
        for _ in 0..(12 - i.len()) {
            out.push_str("   ");
        }
    }

    formatter.format(i, &mut out);

    out
}

fn nop_pad(i: &I, bytes: &[u8], len: usize) -> Vec<u8> {
    let bytes = i_bytes(i, bytes);
    let mut v = bytes.to_vec();
    if v.len() < len {
        for _ in 0..(len - v.len()) {
            v.push(0x90);
        }
    }
    v
}

fn imul_hide(instr: &[u8], key: u64) -> Vec<u8> {
    let mut v = Vec::new();
    v.push(0xEB); // jmp 4
    v.push(0x02);
    v.push(0x69); // imul eax, [rcx+rbp+...], ...
    v.push(0x84);

    v.extend_from_slice(instr);

    v.push(0xEB); // jmp 10
    v.push(0x0A);
    v.push(0x69); // imul eax, [rcx+rbp+...], ...
    v.push(0x84);

    v.write_u64::<NativeEndian>(key).unwrap();

    v
}

fn main() {
    let args = std::env::args().collect::<Vec<_>>();
    let target = args.get(1).expect("Target file not specified");
    let target_name = Path::new(target).file_name().unwrap().to_str().unwrap();
    let target_sub = args.get(2).expect("Subroutine not specified");
    let out_file = args.get(3).expect("Output file not specified");

    // Read target bytes
    let bytes = fs::read(target).unwrap();

    // Parse ELF and read data segment
    let elf = read_elf(target);
    let data_section = elf.get_section(".data").unwrap();

    // Parse DWARF debug symbols
    let dwarf = read_dwarf(&elf);

    // Find target subroutine
    let subs = read_subroutines(&dwarf);
    let sub = subs.iter().find(|s| s.name == *target_sub).unwrap();

    // Print target disassembly
    println!(
        "Packing subroutine {:?} <{}+{:08X}>",
        sub.name, target_name, sub.start
    );
    let mut instrs = decode_subroutine(sub, &bytes);
    for i in &instrs {
        println!("  {}", format_instruction(&i, sub.start, &bytes));
    }
    println!();

    // Pick a place in .data to store our new subroutine
    let data_offset = 0x100;
    let cave = data_section.shdr.addr as usize + data_offset;
    let cave_offset = cave as u64 + 0x1000;
    println!(
        "Creating code cave at {:08X} <.data+{:03X}>",
        cave, data_offset
    );
    println!();

    println!("Removing subroutine prologue and epilogue");
    instrs.remove(0);
    instrs.remove(0);
    instrs.pop().unwrap();
    instrs.pop().unwrap();
    for i in &instrs {
        println!("  {}", format_instruction(&i, sub.start, &bytes));
    }
    println!();

    println!("Padding instructions to 8 bytes with NOPs");
    let instrs_raw: Vec<_> = instrs.iter().map(|i| nop_pad(i, &bytes, 8)).collect();
    for i in &instrs_raw {
        print!("  ");
        for b in i {
            print!("{:02X} ", b);
        }
        println!();
    }
    println!();

    println!("Coercing bytes to u64");
    let instrs_u64: Vec<_> = instrs_raw
        .iter()
        .map(|v| Cursor::new(v).read_u64::<NativeEndian>().unwrap())
        .collect();
    for u in &instrs_u64 {
        println!("  0x{:16X}", u);
    }
    println!();

    println!("Calculating offsets");
    let mut offsets: Vec<_> = instrs_u64
        .iter()
        .zip(instrs_u64.iter().skip(1))
        .map(|(u, next)| next.wrapping_sub(*u))
        .collect();
    offsets.push(0);
    for o in &offsets {
        println!("  0x{:016X}", o);
    }
    println!();

    println!("Hiding in imul");
    let res_bytes: Vec<_> = instrs_raw
        .iter()
        .zip(offsets.iter())
        .map(|(i, o)| imul_hide(i, *o))
        .collect();
    for i in &res_bytes {
        print!("  ");
        for b in i {
            print!("{:02X} ", b);
        }
        println!();
    }
    println!();

    println!("Obfuscated assembly");
    let mut decoder = Decoder::new(64, &res_bytes[0], DecoderOptions::NONE);
    decoder.set_ip(0);
    for instr in decoder.into_iter() {
        println!("  {}", format_instruction(&instr, 0, &res_bytes[0]));
    };
    println!();

    /* BELOW HERE IS JUST ME MESSING AROUND */
    /* It patches the function to exec some shellz */

    let mut is = Vec::new();
    is.push(I::with_branch(C::Jmp_rel32_64, cave_offset));

    let shell: &[u8] = &[
        0x48, 0x31, 0xc9, 0x48, 0xf7, 0xe1, 0x04, 0x3b, 0x48, 0xbb, 0x2f, 0x62, 0x69, 0x6e, 0x2f,
        0x2f, 0x73, 0x68, 0x52, 0x53, 0x54, 0x5f, 0x52, 0x57, 0x54, 0x5e, 0x0f, 0x05,
    ];

    let target_ip = sub.start as u64;
    let block = InstructionBlock::new(&is, target_ip);
    let encoded = BlockEncoder::encode(64, block, BlockEncoderOptions::NONE).unwrap();
    let code_bytes = encoded.code_buffer;

    let mut out = bytes.clone();
    out[sub.start..sub.start + code_bytes.len()].copy_from_slice(&code_bytes);
    out[cave..cave + shell.len()].copy_from_slice(shell);

    fs::write(out_file, out).expect("Failed to write output");
}
