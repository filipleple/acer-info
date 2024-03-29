/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20211217 (64-bit version)
 * Copyright (c) 2000 - 2021 Intel Corporation
 * 
 * Disassembly of ./boot.dat, Sat Feb 10 15:09:26 2024
 *
 * ACPI Data Table [BOOT]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue (in hex)
 */

[000h 0000   4]                    Signature : "BOOT"    [Simple Boot Flag Table]
[004h 0004   4]                 Table Length : 00000028
[008h 0008   1]                     Revision : 01
[009h 0009   1]                     Checksum : 84
[00Ah 0010   6]                       Oem ID : "PTLTD "
[010h 0016   8]                 Oem Table ID : "$SBFTBL$"
[018h 0024   4]                 Oem Revision : 06040000
[01Ch 0028   4]              Asl Compiler ID : " LTP"
[020h 0032   4]        Asl Compiler Revision : 00000001

[024h 0036   1]          Boot Register Index : 57
[025h 0037   3]                     Reserved : 000000

Raw Table Data: Length 40 (0x28)

    0000: 42 4F 4F 54 28 00 00 00 01 84 50 54 4C 54 44 20  // BOOT(.....PTLTD 
    0010: 24 53 42 46 54 42 4C 24 00 00 04 06 20 4C 54 50  // $SBFTBL$.... LTP
    0020: 01 00 00 00 57 00 00 00                          // ....W...
