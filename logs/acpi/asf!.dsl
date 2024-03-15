/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20211217 (64-bit version)
 * Copyright (c) 2000 - 2021 Intel Corporation
 * 
 * Disassembly of ./asf!.dat, Sat Feb 10 15:09:26 2024
 *
 * ACPI Data Table [ASF!]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue (in hex)
 */

[000h 0000   4]                    Signature : "ASF!"    [Alert Standard Format Table]
[004h 0004   4]                 Table Length : 00000063
[008h 0008   1]                     Revision : 20
[009h 0009   1]                     Checksum : D5
[00Ah 0010   6]                       Oem ID : "OEMID "
[010h 0016   8]                 Oem Table ID : "OEMTBL  "
[018h 0024   4]                 Oem Revision : 06040000
[01Ch 0028   4]              Asl Compiler ID : "PTL "
[020h 0032   4]        Asl Compiler Revision : 00000001

[024h 0036   1]                Subtable Type : 00 [ASF Information]
[025h 0037   1]                     Reserved : 00
[026h 0038   2]                       Length : 0010
[028h 0040   1]          Minimum Reset Value : 3C
[029h 0041   1]     Minimum Polling Interval : 05
[02Ah 0042   2]                    System ID : 1234
[02Ch 0044   4]              Manufacturer ID : AABBCCDD
[030h 0048   1]                        Flags : 00
[031h 0049   3]                     Reserved : 000000

[034h 0052   1]                Subtable Type : 02 [ASF Remote Control]
[035h 0053   1]                     Reserved : 00
[036h 0054   2]                       Length : 0018
[038h 0056   1]                Control Count : 04
[039h 0057   1]          Control Data Length : 04
[03Ah 0058   2]                     Reserved : 0000

[03Ch 0060   1]                     Function : 02
[03Dh 0061   1]                      Address : 88
[03Eh 0062   1]                      Command : 00
[03Fh 0063   1]                        Value : 01

[040h 0064   1]                     Function : 01
[041h 0065   1]                      Address : 88
[042h 0066   1]                      Command : 00
[043h 0067   1]                        Value : 02

[044h 0068   1]                     Function : 00
[045h 0069   1]                      Address : 88
[046h 0070   1]                      Command : 00
[047h 0071   1]                        Value : 03

[048h 0072   1]                     Function : 03
[049h 0073   1]                      Address : 88
[04Ah 0074   1]                      Command : 00
[04Bh 0075   1]                        Value : 04

[04Ch 0076   1]                Subtable Type : 83 [ASF RMCP Boot Options]
[04Dh 0077   1]                     Reserved : 00
[04Eh 0078   2]                       Length : 0017
[050h 0080   7]                 Capabilities : 00 00 00 00 00 00 F0
[057h 0087   1]              Completion Code : 80
[058h 0088   4]                Enterprise ID : 00000000
[05Ch 0092   1]                      Command : 00
[05Dh 0093   2]                    Parameter : 0000
[05Fh 0095   2]                 Boot Options : 0000
[061h 0097   2]               Oem Parameters : 0000


Raw Table Data: Length 99 (0x63)

    0000: 41 53 46 21 63 00 00 00 20 D5 4F 45 4D 49 44 20  // ASF!c... .OEMID 
    0010: 4F 45 4D 54 42 4C 20 20 00 00 04 06 50 54 4C 20  // OEMTBL  ....PTL 
    0020: 01 00 00 00 00 00 10 00 3C 05 34 12 DD CC BB AA  // ........<.4.....
    0030: 00 00 00 00 02 00 18 00 04 04 00 00 02 88 00 01  // ................
    0040: 01 88 00 02 00 88 00 03 03 88 00 04 83 00 17 00  // ................
    0050: 00 00 00 00 00 00 F0 80 00 00 00 00 00 00 00 00  // ................
    0060: 00 00 00                                         // ...
