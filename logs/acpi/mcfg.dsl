/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20211217 (64-bit version)
 * Copyright (c) 2000 - 2021 Intel Corporation
 * 
 * Disassembly of ./mcfg.dat, Sat Feb 10 15:09:27 2024
 *
 * ACPI Data Table [MCFG]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue (in hex)
 */

[000h 0000   4]                    Signature : "MCFG"    [Memory Mapped Configuration Table]
[004h 0004   4]                 Table Length : 0000003C
[008h 0008   1]                     Revision : 01
[009h 0009   1]                     Checksum : 32
[00Ah 0010   6]                       Oem ID : "INTEL "
[010h 0016   8]                 Oem Table ID : "CRESTLNE"
[018h 0024   4]                 Oem Revision : 06040000
[01Ch 0028   4]              Asl Compiler ID : "LOHR"
[020h 0032   4]        Asl Compiler Revision : 0000005A

[024h 0036   8]                     Reserved : 0000000000000000

[02Ch 0044   8]                 Base Address : 00000000E0000000
[034h 0052   2]         Segment Group Number : 0000
[036h 0054   1]             Start Bus Number : 00
[037h 0055   1]               End Bus Number : FF
[038h 0056   4]                     Reserved : 00000000

Raw Table Data: Length 60 (0x3C)

    0000: 4D 43 46 47 3C 00 00 00 01 32 49 4E 54 45 4C 20  // MCFG<....2INTEL 
    0010: 43 52 45 53 54 4C 4E 45 00 00 04 06 4C 4F 48 52  // CRESTLNE....LOHR
    0020: 5A 00 00 00 00 00 00 00 00 00 00 00 00 00 00 E0  // Z...............
    0030: 00 00 00 00 00 00 00 FF 00 00 00 00              // ............
