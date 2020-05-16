0x0: 7F 45                                           jnle 0x47
0x2: 4C                                              dec esp
0x3: 46                                              inc esi
0x4: 02 01                                           add al, byte ptr [ecx]
0x6: 01 00                                           add dword ptr [eax], eax
0x8: 00 00                                           add byte ptr [eax], al
0xA: 00 00                                           add byte ptr [eax], al
0xC: 00 00                                           add byte ptr [eax], al
0xE: 00 00                                           add byte ptr [eax], al
0x10: 03 00                                           add eax, dword ptr [eax]
0x12: 3E 00 01                                        add byte ptr [ecx], al
0x15: 00 00                                           add byte ptr [eax], al
0x17: 00 40 10                                        add byte ptr [eax+0x10], al
0x1A: 00 00                                           add byte ptr [eax], al
0x1C: 00 00                                           add byte ptr [eax], al
0x1E: 00 00                                           add byte ptr [eax], al
0x20: 40                                              inc eax
0x21: 00 00                                           add byte ptr [eax], al
0x23: 00 00                                           add byte ptr [eax], al
0x25: 00 00                                           add byte ptr [eax], al
0x27: 00 C0                                           add al, al
0x29: 98                                              cwde 
0x2A: 04 00                                           add al, 0x0
0x2C: 00 00                                           add byte ptr [eax], al
0x2E: 00 00                                           add byte ptr [eax], al
0x30: 00 00                                           add byte ptr [eax], al
0x32: 00 00                                           add byte ptr [eax], al
0x34: 40                                              inc eax
0x35: 00 38                                           add byte ptr [eax], bh
0x37: 00 0B                                           add byte ptr [ebx], cl
0x39: 00 40 00                                        add byte ptr [eax], al
0x3C: 23 00                                           and eax, dword ptr [eax]
0x3E: 22 00                                           and al, byte ptr [eax]
0x40: 06                                              push es
0x41: 00 00                                           add byte ptr [eax], al
0x43: 00 04 00                                        add byte ptr [eax+eax*1], al
0x46: 00 00                                           add byte ptr [eax], al
0x47: 00 40 00                                        add byte ptr [eax], al
0x48: 40                                              inc eax
0x49: 00 00                                           add byte ptr [eax], al
0x4A: 00 00                                           add byte ptr [eax], al
0x4B: 00 00                                           add byte ptr [eax], al
0x4C: 00 00                                           add byte ptr [eax], al
0x4D: 00 00                                           add byte ptr [eax], al
0x4E: 00 00                                           add byte ptr [eax], al
0x4F: 00 40 00                                        add byte ptr [eax], al
0x50: 40                                              inc eax
0x51: 00 00                                           add byte ptr [eax], al
0x52: 00 00                                           add byte ptr [eax], al
0x53: 00 00                                           add byte ptr [eax], al
0x54: 00 00                                           add byte ptr [eax], al
0x55: 00 00                                           add byte ptr [eax], al
0x56: 00 00                                           add byte ptr [eax], al
0x57: 00 40 00                                        add byte ptr [eax], al
0x58: 40                                              inc eax
0x59: 00 00                                           add byte ptr [eax], al
0x5A: 00 00                                           add byte ptr [eax], al
0x5B: 00 00                                           add byte ptr [eax], al
0x5C: 00 00                                           add byte ptr [eax], al
0x5D: 00 00                                           add byte ptr [eax], al
0x5E: 00 00                                           add byte ptr [eax], al
0x5F: 00 68 02                                        add byte ptr [eax+0x2], ch
0x60: 68 02 00 00 00                                  push 0x2
0x62: 00 00                                           add byte ptr [eax], al
0x64: 00 00                                           add byte ptr [eax], al
0x65: 00 00                                           add byte ptr [eax], al
0x66: 00 00                                           add byte ptr [eax], al
0x67: 00 68 02                                        add byte ptr [eax+0x2], ch
0x68: 68 02 00 00 00                                  push 0x2
0x6A: 00 00                                           add byte ptr [eax], al
0x6C: 00 00                                           add byte ptr [eax], al
0x6D: 00 00                                           add byte ptr [eax], al
0x6E: 00 00                                           add byte ptr [eax], al
0x6F: 00 08                                           add byte ptr [eax], cl
0x70: 08 00                                           or byte ptr [eax], al
0x71: 00 00                                           add byte ptr [eax], al
0x72: 00 00                                           add byte ptr [eax], al
0x73: 00 00                                           add byte ptr [eax], al
0x74: 00 00                                           add byte ptr [eax], al
0x75: 00 00                                           add byte ptr [eax], al
0x76: 00 00                                           add byte ptr [eax], al
0x77: 00 03                                           add byte ptr [ebx], al
0x78: 03 00                                           add eax, dword ptr [eax]
0x79: 00 00                                           add byte ptr [eax], al
0x7A: 00 00                                           add byte ptr [eax], al
0x7B: 00 04 00                                        add byte ptr [eax+eax*1], al
0x7C: 04 00                                           add al, 0x0
0x7E: 00 00                                           add byte ptr [eax], al
0x80: A8 02                                           test al, 0x2
0x82: 00 00                                           add byte ptr [eax], al
0x84: 00 00                                           add byte ptr [eax], al
0x86: 00 00                                           add byte ptr [eax], al
0x88: A8 02                                           test al, 0x2
0x8A: 00 00                                           add byte ptr [eax], al
0x8C: 00 00                                           add byte ptr [eax], al
0x8E: 00 00                                           add byte ptr [eax], al
0x90: A8 02                                           test al, 0x2
0x92: 00 00                                           add byte ptr [eax], al
0x94: 00 00                                           add byte ptr [eax], al
0x96: 00 00                                           add byte ptr [eax], al
0x98: 1C 00                                           sbb al, 0x0
0x9A: 00 00                                           add byte ptr [eax], al
0x9C: 00 00                                           add byte ptr [eax], al
0x9E: 00 00                                           add byte ptr [eax], al
0xA0: 1C 00                                           sbb al, 0x0
0xA2: 00 00                                           add byte ptr [eax], al
0xA4: 00 00                                           add byte ptr [eax], al
0xA6: 00 00                                           add byte ptr [eax], al
0xA8: 01 00                                           add dword ptr [eax], eax
0xAA: 00 00                                           add byte ptr [eax], al
0xAC: 00 00                                           add byte ptr [eax], al
0xAE: 00 00                                           add byte ptr [eax], al
0xB0: 01 00                                           add dword ptr [eax], eax
0xB2: 00 00                                           add byte ptr [eax], al
0xB4: 04 00                                           add al, 0x0
0xB6: 00 00                                           add byte ptr [eax], al
0xB8: 00 00                                           add byte ptr [eax], al
0xBA: 00 00                                           add byte ptr [eax], al
0xBC: 00 00                                           add byte ptr [eax], al
0xBE: 00 00                                           add byte ptr [eax], al
0xC0: 00 00                                           add byte ptr [eax], al
0xC2: 00 00                                           add byte ptr [eax], al
0xC4: 00 00                                           add byte ptr [eax], al
0xC6: 00 00                                           add byte ptr [eax], al
0xC8: 00 00                                           add byte ptr [eax], al
0xCA: 00 00                                           add byte ptr [eax], al
0xCC: 00 00                                           add byte ptr [eax], al
0xCE: 00 00                                           add byte ptr [eax], al
0xD0: 60                                              pushad 
0xD1: 05 00 00 00 00                                  add eax, 0x0
0xD6: 00 00                                           add byte ptr [eax], al
0xD8: 60                                              pushad 
0xD9: 05 00 00 00 00                                  add eax, 0x0
0xDE: 00 00                                           add byte ptr [eax], al
0xE0: 00 10                                           add byte ptr [eax], dl
0xE2: 00 00                                           add byte ptr [eax], al
0xE4: 00 00                                           add byte ptr [eax], al
0xE6: 00 00                                           add byte ptr [eax], al
0xE8: 01 00                                           add dword ptr [eax], eax
0xEA: 00 00                                           add byte ptr [eax], al
0xEC: 05 00 00 00 00                                  add eax, 0x0
0xF1: 10 00                                           adc byte ptr [eax], al
0xF3: 00 00                                           add byte ptr [eax], al
0xF5: 00 00                                           add byte ptr [eax], al
0xF7: 00 00                                           add byte ptr [eax], al
0xF9: 10 00                                           adc byte ptr [eax], al
0xFB: 00 00                                           add byte ptr [eax], al
0xFD: 00 00                                           add byte ptr [eax], al
0xFF: 00 00                                           add byte ptr [eax], al
0x101: 10 00                                           adc byte ptr [eax], al
0x103: 00 00                                           add byte ptr [eax], al
0x105: 00 00                                           add byte ptr [eax], al
0x107: 00 35 02 00 00 00                               add byte ptr [0x2], dh
0x10D: 00 00                                           add byte ptr [eax], al
0x10F: 00 35 02 00 00 00                               add byte ptr [0x2], dh
0x115: 00 00                                           add byte ptr [eax], al
0x117: 00 00                                           add byte ptr [eax], al
0x119: 10 00                                           adc byte ptr [eax], al
0x11B: 00 00                                           add byte ptr [eax], al
0x11D: 00 00                                           add byte ptr [eax], al
0x11F: 00 01                                           add byte ptr [ecx], al
0x121: 00 00                                           add byte ptr [eax], al
0x123: 00 04 00                                        add byte ptr [eax+eax*1], al
0x126: 00 00                                           add byte ptr [eax], al
0x128: 00 20                                           add byte ptr [eax], ah
0x12A: 00 00                                           add byte ptr [eax], al
0x12C: 00 00                                           add byte ptr [eax], al
0x12E: 00 00                                           add byte ptr [eax], al
0x130: 00 20                                           add byte ptr [eax], ah
0x132: 00 00                                           add byte ptr [eax], al
0x134: 00 00                                           add byte ptr [eax], al
0x136: 00 00                                           add byte ptr [eax], al
0x138: 00 20                                           add byte ptr [eax], ah
0x13A: 00 00                                           add byte ptr [eax], al
0x13C: 00 00                                           add byte ptr [eax], al
0x13E: 00 00                                           add byte ptr [eax], al
0x140: 38 01                                           cmp byte ptr [ecx], al
0x142: 00 00                                           add byte ptr [eax], al
0x144: 00 00                                           add byte ptr [eax], al
0x146: 00 00                                           add byte ptr [eax], al
0x148: 38 01                                           cmp byte ptr [ecx], al
0x14A: 00 00                                           add byte ptr [eax], al
0x14C: 00 00                                           add byte ptr [eax], al
0x14E: 00 00                                           add byte ptr [eax], al
0x150: 00 10                                           add byte ptr [eax], dl
0x152: 00 00                                           add byte ptr [eax], al
0x154: 00 00                                           add byte ptr [eax], al
0x156: 00 00                                           add byte ptr [eax], al
0x158: 01 00                                           add dword ptr [eax], eax
0x15A: 00 00                                           add byte ptr [eax], al
0x15C: 06                                              push es
0x15D: 00 00                                           add byte ptr [eax], al
0x15F: 00 E8                                           add al, ch
0x161: 2D 00 00 00 00                                  sub eax, 0x0
0x166: 00 00                                           add byte ptr [eax], al
0x168: E8 3D 00 00 00                                  call 0x42
0x16D: 00 00                                           add byte ptr [eax], al
0x16F: 00 E8                                           add al, ch
0x171: 3D 00 00 00 00                                  cmp eax, 0x0
0x176: 00 00                                           add byte ptr [eax], al
0x178: 58                                              pop eax
0x179: 02 04 00                                        add al, byte ptr [eax+eax*1]
0x17C: 00 00                                           add byte ptr [eax], al
0x17E: 00 00                                           add byte ptr [eax], al
0x180: 60                                              pushad 
0x181: 02 04 00                                        add al, byte ptr [eax+eax*1]
0x184: 00 00                                           add byte ptr [eax], al
0x186: 00 00                                           add byte ptr [eax], al
0x188: 00 10                                           add byte ptr [eax], dl
0x18A: 00 00                                           add byte ptr [eax], al
0x18C: 00 00                                           add byte ptr [eax], al
0x18E: 00 00                                           add byte ptr [eax], al
0x190: 02 00                                           add al, byte ptr [eax]
0x192: 00 00                                           add byte ptr [eax], al
0x194: 06                                              push es
0x195: 00 00                                           add byte ptr [eax], al
0x197: 00 F8                                           add al, bh
0x199: 2D 00 00 00 00                                  sub eax, 0x0
0x19E: 00 00                                           add byte ptr [eax], al
0x1A0: F8                                              clc 
0x1A1: 3D 00 00 00 00                                  cmp eax, 0x0
0x1A6: 00 00                                           add byte ptr [eax], al
0x1A8: F8                                              clc 
0x1A9: 3D 00 00 00 00                                  cmp eax, 0x0
0x1AA: 00 00                                           add byte ptr [eax], al
0x1AC: 00 00                                           add byte ptr [eax], al
0x1AE: 00 00                                           add byte ptr [eax], al
0x1B0: E0 01                                           loopne 0x3
0x1B2: 00 00                                           add byte ptr [eax], al
0x1B3: 00 00                                           add byte ptr [eax], al
0x1B4: 00 00                                           add byte ptr [eax], al
0x1B5: 00 00                                           add byte ptr [eax], al
0x1B6: 00 00                                           add byte ptr [eax], al
0x1B7: 00 E0                                           add al, ah
0x1B8: E0 01                                           loopne 0x3
0x1B9: 01 00                                           add dword ptr [eax], eax
0x1BA: 00 00                                           add byte ptr [eax], al
0x1BB: 00 00                                           add byte ptr [eax], al
0x1BC: 00 00                                           add byte ptr [eax], al
0x1BD: 00 00                                           add byte ptr [eax], al
0x1BE: 00 00                                           add byte ptr [eax], al
0x1BF: 00 08                                           add byte ptr [eax], cl
0x1C0: 08 00                                           or byte ptr [eax], al
0x1C1: 00 00                                           add byte ptr [eax], al
0x1C2: 00 00                                           add byte ptr [eax], al
0x1C3: 00 00                                           add byte ptr [eax], al
0x1C4: 00 00                                           add byte ptr [eax], al
0x1C5: 00 00                                           add byte ptr [eax], al
0x1C6: 00 00                                           add byte ptr [eax], al
0x1C7: 00 04 00                                        add byte ptr [eax+eax*1], al
0x1C8: 04 00                                           add al, 0x0
0x1CA: 00 00                                           add byte ptr [eax], al
0x1CC: 04 00                                           add al, 0x0
0x1CE: 00 00                                           add byte ptr [eax], al
0x1D0: C4 02                                           les eax, ptr [edx]
0x1D2: 00 00                                           add byte ptr [eax], al
0x1D4: 00 00                                           add byte ptr [eax], al
0x1D6: 00 00                                           add byte ptr [eax], al
0x1D8: C4 02                                           les eax, ptr [edx]
0x1DA: 00 00                                           add byte ptr [eax], al
0x1DC: 00 00                                           add byte ptr [eax], al
0x1DE: 00 00                                           add byte ptr [eax], al
0x1E0: C4 02                                           les eax, ptr [edx]
0x1E2: 00 00                                           add byte ptr [eax], al
0x1E4: 00 00                                           add byte ptr [eax], al
0x1E6: 00 00                                           add byte ptr [eax], al
0x1E8: 44                                              inc esp
0x1E9: 00 00                                           add byte ptr [eax], al
0x1EB: 00 00                                           add byte ptr [eax], al
0x1ED: 00 00                                           add byte ptr [eax], al
0x1EF: 00 44 00 00                                     add byte ptr [eax+eax*1], al
0x1F3: 00 00                                           add byte ptr [eax], al
0x1F5: 00 00                                           add byte ptr [eax], al
0x1F7: 00 04 00                                        add byte ptr [eax+eax*1], al
0x1FA: 00 00                                           add byte ptr [eax], al
0x1FC: 00 00                                           add byte ptr [eax], al
0x1FE: 00 00                                           add byte ptr [eax], al
0x200: 50                                              push eax
0x201: E5 74                                           in eax, 0x74
0x203: 64 04 00                                        add al, 0x0
0x206: 00 00                                           add byte ptr [eax], al
0x208: 04 20                                           add al, 0x20
0x20A: 00 00                                           add byte ptr [eax], al
0x20C: 00 00                                           add byte ptr [eax], al
0x20E: 00 00                                           add byte ptr [eax], al
0x210: 04 20                                           add al, 0x20
0x212: 00 00                                           add byte ptr [eax], al
0x214: 00 00                                           add byte ptr [eax], al
0x216: 00 00                                           add byte ptr [eax], al
0x218: 04 20                                           add al, 0x20
0x21A: 00 00                                           add byte ptr [eax], al
0x21C: 00 00                                           add byte ptr [eax], al
0x21E: 00 00                                           add byte ptr [eax], al
0x220: 3C 00                                           cmp al, 0x0
0x222: 00 00                                           add byte ptr [eax], al
0x224: 00 00                                           add byte ptr [eax], al
0x226: 00 00                                           add byte ptr [eax], al
0x228: 3C 00                                           cmp al, 0x0
0x22A: 00 00                                           add byte ptr [eax], al
0x22C: 00 00                                           add byte ptr [eax], al
0x22E: 00 00                                           add byte ptr [eax], al
0x230: 04 00                                           add al, 0x0
0x232: 00 00                                           add byte ptr [eax], al
0x234: 00 00                                           add byte ptr [eax], al
0x236: 00 00                                           add byte ptr [eax], al
0x238: 51                                              push ecx
0x239: E5 74                                           in eax, 0x74
0x23B: 64 07                                           pop es
0x23D: 00 00                                           add byte ptr [eax], al
0x23F: 00 00                                           add byte ptr [eax], al
0x241: 00 00                                           add byte ptr [eax], al
0x243: 00 00                                           add byte ptr [eax], al
0x245: 00 00                                           add byte ptr [eax], al
0x247: 00 00                                           add byte ptr [eax], al
0x249: 00 00                                           add byte ptr [eax], al
0x24B: 00 00                                           add byte ptr [eax], al
0x24D: 00 00                                           add byte ptr [eax], al
0x24F: 00 00                                           add byte ptr [eax], al
0x251: 00 00                                           add byte ptr [eax], al
0x253: 00 00                                           add byte ptr [eax], al
0x255: 00 00                                           add byte ptr [eax], al
0x257: 00 00                                           add byte ptr [eax], al
0x259: 00 00                                           add byte ptr [eax], al
0x25B: 00 00                                           add byte ptr [eax], al
0x25D: 00 00                                           add byte ptr [eax], al
0x25F: 00 00                                           add byte ptr [eax], al
0x261: 00 00                                           add byte ptr [eax], al
0x263: 00 00                                           add byte ptr [eax], al
0x265: 00 00                                           add byte ptr [eax], al
0x267: 00 10                                           add byte ptr [eax], dl
0x269: 00 00                                           add byte ptr [eax], al
0x26B: 00 00                                           add byte ptr [eax], al
0x26D: 00 00                                           add byte ptr [eax], al
0x26F: 00 52 E5                                        add byte ptr [edx-0x1b], dl
0x272: 74 64                                           jz 0x66
0x274: 04 00                                           add al, 0x0
0x276: 00 00                                           add byte ptr [eax], al
0x278: E8 2D 00 00 00                                  call 0x32
0x27D: 00 00                                           add byte ptr [eax], al
0x27F: 00 E8                                           add al, ch
0x281: 3D 00 00 00 00                                  cmp eax, 0x0
0x286: 00 00                                           add byte ptr [eax], al
0x288: E8 3D 00 00 00                                  call 0x42
0x28D: 00 00                                           add byte ptr [eax], al
0x28F: 00 18                                           add byte ptr [eax], bl
0x291: 02 00                                           add al, byte ptr [eax]
0x293: 00 00                                           add byte ptr [eax], al
0x295: 00 00                                           add byte ptr [eax], al
0x297: 00 18                                           add byte ptr [eax], bl
0x299: 02 00                                           add al, byte ptr [eax]
0x29B: 00 00                                           add byte ptr [eax], al
0x29D: 00 00                                           add byte ptr [eax], al
0x29F: 00 01                                           add byte ptr [ecx], al
0x2A1: 00 00                                           add byte ptr [eax], al
0x2A3: 00 00                                           add byte ptr [eax], al
0x2A5: 00 00                                           add byte ptr [eax], al
0x2A7: 00 2F                                           add byte ptr [edi], ch
0x2A9: 6C                                              insb 
0x2AA: 69 62 36 34 2F 6C 64                            imul esp, dword ptr [edx+0x36], 0x646c2f34
0x2B1: 2D 6C 69 6E 75                                  sub eax, 0x756e696c
0x2B6: 78 2D                                           js 0x2f
0x2B8: 78 38                                           js 0x3a
0x2BA: 36 2D 36 34 2E 73                               sub eax, 0x732e3436
0x2C0: 6F                                              outsd 
0x2C1: 2E 32 00                                        xor al, byte ptr cs:[eax]
0x2C4: 04 00                                           add al, 0x0
0x2C6: 00 00                                           add byte ptr [eax], al
0x2C8: 14 00                                           adc al, 0x0
0x2CA: 00 00                                           add byte ptr [eax], al
0x2CC: 03 00                                           add eax, dword ptr [eax]
0x2CE: 00 00                                           add byte ptr [eax], al
0x2D0: 47                                              inc edi
0x2D1: 4E                                              dec esi
0x2D2: 55                                              push ebp
0x2D3: 00 92 74 CE 34 6D                               add byte ptr [edx+0x6d34ce74], dl
0x2D8: 6D                                              insd 
0x2D9: 16                                              push ss
0x2DA: 52                                              push edx
0x2DB: AD                                              lodsd dword ptr [esi]
0x2DC: 0B 65 BF                                        or esp, dword ptr [ebp-0x41]
0x2DF: B5 1F                                           mov ch, 0x1f
0x2E1: 9C                                              pushfd 
0x2E2: 24 10                                           and al, 0x10
0x2E4: 01 45 ED                                        add dword ptr [ebp-0x13], eax
0x2E5: 45                                              inc ebp
0x2E6: ED                                              in eax, dx
0x2E7: E6 04                                           out 0x4, al
0x2E9: 00 00                                           add byte ptr [eax], al
0x2EB: 00 10                                           add byte ptr [eax], dl
0x2ED: 00 00                                           add byte ptr [eax], al
0x2EF: 00 01                                           add byte ptr [ecx], al
0x2F1: 00 00                                           add byte ptr [eax], al
0x2F2: 00 00                                           add byte ptr [eax], al
0x2F3: 00 47 4E                                        add byte ptr [edi+0x4e], al
0x2F4: 47                                              inc edi
0x2F5: 4E                                              dec esi
0x2F6: 55                                              push ebp
0x2F7: 00 00                                           add byte ptr [eax], al
0x2F9: 00 00                                           add byte ptr [eax], al
0x2FB: 00 03                                           add byte ptr [ebx], al
0x2FD: 00 00                                           add byte ptr [eax], al
0x2FF: 00 02                                           add byte ptr [edx], al
0x301: 00 00                                           add byte ptr [eax], al
0x303: 00 00                                           add byte ptr [eax], al
0x305: 00 00                                           add byte ptr [eax], al
0x307: 00 01                                           add byte ptr [ecx], al
0x309: 00 00                                           add byte ptr [eax], al
0x30B: 00 01                                           add byte ptr [ecx], al
0x30D: 00 00                                           add byte ptr [eax], al
0x30F: 00 01                                           add byte ptr [ecx], al
0x311: 00 00                                           add byte ptr [eax], al
0x313: 00 00                                           add byte ptr [eax], al
0x315: 00 00                                           add byte ptr [eax], al
0x317: 00 00                                           add byte ptr [eax], al
0x319: 00 00                                           add byte ptr [eax], al
0x31B: 00 00                                           add byte ptr [eax], al
0x31D: 00 00                                           add byte ptr [eax], al
0x31F: 00 00                                           add byte ptr [eax], al
0x321: 00 00                                           add byte ptr [eax], al
0x323: 00 00                                           add byte ptr [eax], al
0x325: 00 00                                           add byte ptr [eax], al
0x327: 00 00                                           add byte ptr [eax], al
0x329: 00 00                                           add byte ptr [eax], al
0x32B: 00 00                                           add byte ptr [eax], al
0x32D: 00 00                                           add byte ptr [eax], al
0x32F: 00 00                                           add byte ptr [eax], al
0x331: 00 00                                           add byte ptr [eax], al
0x333: 00 00                                           add byte ptr [eax], al
0x335: 00 00                                           add byte ptr [eax], al
0x337: 00 00                                           add byte ptr [eax], al
0x339: 00 00                                           add byte ptr [eax], al
0x33B: 00 00                                           add byte ptr [eax], al
0x33D: 00 00                                           add byte ptr [eax], al
0x33F: 00 0B                                           add byte ptr [ebx], cl
0x341: 00 00                                           add byte ptr [eax], al
0x343: 00 12                                           add byte ptr [edx], dl
0x345: 00 00                                           add byte ptr [eax], al
0x347: 00 00                                           add byte ptr [eax], al
0x349: 00 00                                           add byte ptr [eax], al
0x34B: 00 00                                           add byte ptr [eax], al
0x34D: 00 00                                           add byte ptr [eax], al
0x34F: 00 00                                           add byte ptr [eax], al
0x351: 00 00                                           add byte ptr [eax], al
0x353: 00 00                                           add byte ptr [eax], al
0x355: 00 00                                           add byte ptr [eax], al
0x357: 00 40 00                                        add byte ptr [eax], al
0x35A: 00 00                                           add byte ptr [eax], al
0x35C: 20 00                                           and byte ptr [eax], al
0x35E: 00 00                                           add byte ptr [eax], al
0x360: 00 00                                           add byte ptr [eax], al
0x362: 00 00                                           add byte ptr [eax], al
0x364: 00 00                                           add byte ptr [eax], al
0x366: 00 00                                           add byte ptr [eax], al
0x368: 00 00                                           add byte ptr [eax], al
0x36A: 00 00                                           add byte ptr [eax], al
0x36C: 00 00                                           add byte ptr [eax], al
0x36E: 00 00                                           add byte ptr [eax], al
0x370: 22 00                                           and al, byte ptr [eax]
0x372: 00 00                                           add byte ptr [eax], al
0x374: 12 00                                           adc al, byte ptr [eax]
0x376: 00 00                                           add byte ptr [eax], al
0x378: 00 00                                           add byte ptr [eax], al
0x37A: 00 00                                           add byte ptr [eax], al
0x37C: 00 00                                           add byte ptr [eax], al
0x37E: 00 00                                           add byte ptr [eax], al
0x380: 00 00                                           add byte ptr [eax], al
0x382: 00 00                                           add byte ptr [eax], al
0x384: 00 00                                           add byte ptr [eax], al
0x386: 00 00                                           add byte ptr [eax], al
0x388: 5C                                              pop esp
0x389: 00 00                                           add byte ptr [eax], al
0x38B: 00 20                                           add byte ptr [eax], ah
0x38D: 00 00                                           add byte ptr [eax], al
0x38F: 00 00                                           add byte ptr [eax], al
0x391: 00 00                                           add byte ptr [eax], al
0x393: 00 00                                           add byte ptr [eax], al
0x395: 00 00                                           add byte ptr [eax], al
0x397: 00 00                                           add byte ptr [eax], al
0x399: 00 00                                           add byte ptr [eax], al
0x39B: 00 00                                           add byte ptr [eax], al
0x39D: 00 00                                           add byte ptr [eax], al
0x39F: 00 6B 00                                        add byte ptr [ebx], ch
0x3A2: 00 00                                           add byte ptr [eax], al
0x3A4: 20 00                                           and byte ptr [eax], al
0x3A6: 00 00                                           add byte ptr [eax], al
0x3A8: 00 00                                           add byte ptr [eax], al
0x3AA: 00 00                                           add byte ptr [eax], al
0x3AC: 00 00                                           add byte ptr [eax], al
0x3AE: 00 00                                           add byte ptr [eax], al
0x3B0: 00 00                                           add byte ptr [eax], al
0x3B2: 00 00                                           add byte ptr [eax], al
0x3B4: 00 00                                           add byte ptr [eax], al
0x3B6: 00 00                                           add byte ptr [eax], al
0x3B8: 13 00                                           adc eax, dword ptr [eax]
0x3BA: 00 00                                           add byte ptr [eax], al
0x3BC: 22 00                                           and al, byte ptr [eax]
0x3BE: 00 00                                           add byte ptr [eax], al
0x3C0: 00 00                                           add byte ptr [eax], al
0x3C2: 00 00                                           add byte ptr [eax], al
0x3C4: 00 00                                           add byte ptr [eax], al
0x3C6: 00 00                                           add byte ptr [eax], al
0x3C8: 00 00                                           add byte ptr [eax], al
0x3CA: 00 00                                           add byte ptr [eax], al
0x3CC: 00 00                                           add byte ptr [eax], al
0x3CE: 00 00                                           add byte ptr [eax], al
0x3D0: 00 6C 69 62                                     add byte ptr [ecx+ebp*2+0x62], ch
0x3D4: 63 2E                                           arpl word ptr [esi], bp
0x1040: F3 0F 1E FA                                     nop edx, edi
0x1044: 31 ED                                           xor ebp, ebp
0x1046: 49                                              dec ecx
0x1047: 89 D1                                           mov ecx, edx
0x1049: 5E                                              pop esi
0x104A: 48                                              dec eax
0x104B: 89 E2                                           mov edx, esp
0x104D: 48                                              dec eax
0x104E: 83 E4 F0                                        and esp, 0xfffffff0
0x1051: 50                                              push eax
0x1052: 54                                              push esp
0x1053: 4C                                              dec esp
0x1054: 8D 05 C6 01 00 00                               lea eax, ptr [0x1c6]
0x105A: 48                                              dec eax
0x105B: 8D 0D 4F 01 00 00                               lea ecx, ptr [0x14f]
0x1061: 48                                              dec eax
0x1062: 8D 3D 28 01 00 00                               lea edi, ptr [0x128]
0x1068: FF 15 72 2F 00 00                               call dword ptr [0x2f72]
0x106E: F4                                              hlt 
