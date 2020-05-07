use byteorder::{NativeEndian, ReadBytesExt, WriteBytesExt};
use iced_x86::{
    BlockEncoder, BlockEncoderOptions, Code as C, Decoder, DecoderOptions, Formatter,
    Instruction as I, InstructionBlock, IntelFormatter, Register as R
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
    let mut decoder = Decoder::new(32, bytes, DecoderOptions::NONE);
    decoder.set_ip(sub.start as u64);
    decoder.into_iter().collect()
}

fn format_instruction(i: &I, start: usize, bytes: &[u8], rel: bool) -> String {
    let mut formatter = IntelFormatter::new();
    let mut out = String::new();

    out.push_str(&format!(
        "{:08x} <+{:04x}> ",
        i.ip(),
        i.ip() as usize - start
    ));

    let ofs = if rel { start } else { 0 };
    let (start, end) = (i.ip() as usize - ofs, i.ip() as usize + i.len() - ofs);
    let bytes = &bytes[start..end];
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
    let ins = decode_subroutine(sub, &bytes);
    let len = ins.len() - 4;
    for i in &ins {
        println!("  {}", format_instruction(&i, sub.start, &bytes, false));
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

    // Encode new instructions starting at RIP of the cave
    let mut ins_mod = Vec::new();
    // Skip prologue and epilogue
    for i in ins.iter().skip(2).take(len) {
        ins_mod.push(I::with_declare_byte(&[0xEB, 0x02]));
        ins_mod.push(I::with_declare_byte(&[0x69, 0x84]));
        ins_mod.push(*i);
        for _ in 0..(8 - i.len()) {
            ins_mod.push(I::with(C::Nopd));
        }
        ins_mod.push(I::with_declare_byte(&[0xEB, 0x0A]));
        ins_mod.push(I::with_declare_byte(&[0x69, 0x84]));
        ins_mod.push(I::with_declare_byte(&[0x90, 0x90, 0x90, 0x90, 0x90, 0x90, 0x90, 0x90])); // key
        ins_mod.push(I::with_reg(C::Push_r32, R::ECX));
        ins_mod.push(I::with_declare_byte(&[0x48, 0x8B, 0x0D, 0xF0, 0xFF, 0xFF, 0xFF]));
        ins_mod.push(I::with_declare_byte(&[0x48, 0x03, 0x0D, 0xDD, 0xFF, 0xFF, 0xFF]));
        ins_mod.push(I::with_declare_byte(&[0x48, 0x89, 0x0D, 0x05, 0x00, 0x00, 0x00]));
        ins_mod.push(I::with_reg(C::Pop_r32, R::ECX));
    }
    ins_mod.push(I::with_declare_byte(&[0xEB, 0x02]));
    ins_mod.push(I::with_declare_byte(&[0x69, 0x84]));
    ins_mod.push(I::with_branch(C::Jmp_rel32_32, (sub.end - 2) as u64));
    ins_mod.push(I::with_declare_byte(&[0x90, 0x90, 0x90]));

    let block = InstructionBlock::new(&ins_mod, cave_offset);
    let encoded = BlockEncoder::encode(32, block, BlockEncoderOptions::NONE).unwrap();
    let mut code = encoded.code_buffer.clone();

    println!("Patching offsets");
    for k in 0..len {
        // 47 = distance between starting jumps [0xEB, 0x02]
        // +4 = distance from [0xEB 0x02] to real instruction
        // +51 = 47 + 4 = distance from [0xEB 0x02] to next instruction

        let i = &code[47*k+4..47*k+4+8];
        let j = &code[47*k+51..47*k+51+8];

        let iu = Cursor::new(i).read_u64::<NativeEndian>().unwrap();
        let ju = Cursor::new(j).read_u64::<NativeEndian>().unwrap();

        // +16 = distance from starting jump [0xEB, 0x02] to encoded next instruction offset
        let o = &mut code[47*k+16..47*k+16+8];
        Cursor::new(o).write_u64::<NativeEndian>(ju.wrapping_sub(iu)).unwrap();

        println!("{}: {:016X} -> {:016X} (+{:016X})", k, iu, ju, ju.wrapping_sub(iu));
    }
    println!();

    println!("Packed assembly:");
    let mut decoder = Decoder::new(32, &code, DecoderOptions::NONE);
    decoder.set_ip(cave as u64);
    for i in decoder.iter() {
        //println!("{:?}", i);
        println!("  {}", format_instruction(&i, cave as usize, &code, true));
    }
    println!();

    let mut is = Vec::new();
    is.push(I::with_branch(C::Jmp_rel32_32, cave_offset));
    let target_ip = sub.start as u64;
    let block = InstructionBlock::new(&is, target_ip);
    let encoded = BlockEncoder::encode(32, block, BlockEncoderOptions::NONE).unwrap();
    let jump = encoded.code_buffer;

    let mut out = bytes.clone();

    out[sub.start+4..sub.start+4 + jump.len()].copy_from_slice(&jump);
    out[cave..cave + code.len()].copy_from_slice(&code);

    fs::write(out_file, out).expect("Failed to write output");
}
