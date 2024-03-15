/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20211217 (64-bit version)
 * Copyright (c) 2000 - 2021 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of ./ssdt5.dat, Sat Feb 10 15:09:27 2024
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000223 (547)
 *     Revision         0x01
 *     Checksum         0x7F
 *     OEM ID           "PmRef"
 *     OEM Table ID     "Cpu0Ist"
 *     OEM Revision     0x00003000 (12288)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20050624 (537200164)
 */
DefinitionBlock ("", "SSDT", 1, "PmRef", "Cpu0Ist", 0x00003000)
{
    External (_PR_.CPU0, ProcessorObj)
    External (CFGD, IntObj)
    External (NPSS, IntObj)
    External (PDC0, IntObj)

    Scope (\_PR.CPU0)
    {
        Name (_PPC, Zero)  // _PPC: Performance Present Capabilities
        Method (_PCT, 0, NotSerialized)  // _PCT: Performance Control
        {
            If (((CFGD & One) && (PDC0 & One)))
            {
                Return (Package (0x02)
                {
                    ResourceTemplate ()
                    {
                        Register (FFixedHW, 
                            0x00,               // Bit Width
                            0x00,               // Bit Offset
                            0x0000000000000000, // Address
                            ,)
                    }, 

                    ResourceTemplate ()
                    {
                        Register (FFixedHW, 
                            0x00,               // Bit Width
                            0x00,               // Bit Offset
                            0x0000000000000000, // Address
                            ,)
                    }
                })
            }

            Return (Package (0x02)
            {
                ResourceTemplate ()
                {
                    Register (SystemIO, 
                        0x10,               // Bit Width
                        0x00,               // Bit Offset
                        0x0000000000000480, // Address
                        ,)
                }, 

                ResourceTemplate ()
                {
                    Register (SystemIO, 
                        0x08,               // Bit Width
                        0x00,               // Bit Offset
                        0x00000000000000B3, // Address
                        ,)
                }
            })
        }

        Method (XPSS, 0, NotSerialized)
        {
            If ((PDC0 & One))
            {
                Return (NPSS) /* External reference */
            }

            Return (SPSS) /* \_PR_.CPU0.SPSS */
        }

        Name (SPSS, Package (0x03)
        {
            Package (0x06)
            {
                0x00000898, 
                0x000088B8, 
                0x0000006E, 
                0x0000000A, 
                0x00000083, 
                0x00000000
            }, 

            Package (0x06)
            {
                0x00000640, 
                0x00007148, 
                0x0000006E, 
                0x0000000A, 
                0x00000183, 
                0x00000001
            }, 

            Package (0x06)
            {
                0x000004B0, 
                0x000061A8, 
                0x0000006E, 
                0x0000000A, 
                0x00000283, 
                0x00000002
            }
        })
        Name (_PSS, Package (0x03)  // _PSS: Performance Supported States
        {
            Package (0x06)
            {
                0x00000898, 
                0x000088B8, 
                0x0000000A, 
                0x0000000A, 
                0x00000B2A, 
                0x00000B2A
            }, 

            Package (0x06)
            {
                0x00000640, 
                0x00007148, 
                0x0000000A, 
                0x0000000A, 
                0x0000081C, 
                0x0000081C
            }, 

            Package (0x06)
            {
                0x000004B0, 
                0x000061A8, 
                0x0000000A, 
                0x0000000A, 
                0x00000612, 
                0x00000612
            }
        })
        Method (_PSD, 0, NotSerialized)  // _PSD: Power State Dependencies
        {
            If ((CFGD & 0x01000000))
            {
                If ((CFGD & 0x00800000))
                {
                    If ((PDC0 & 0x0800))
                    {
                        Return (Package (0x01)
                        {
                            Package (0x05)
                            {
                                0x05, 
                                Zero, 
                                Zero, 
                                0xFE, 
                                0x04
                            }
                        })
                    }

                    Return (Package (0x01)
                    {
                        Package (0x05)
                        {
                            0x05, 
                            Zero, 
                            Zero, 
                            0xFC, 
                            0x04
                        }
                    })
                }
                Else
                {
                    If ((PDC0 & 0x0800))
                    {
                        Return (Package (0x01)
                        {
                            Package (0x05)
                            {
                                0x05, 
                                Zero, 
                                Zero, 
                                0xFE, 
                                0x02
                            }
                        })
                    }

                    Return (Package (0x01)
                    {
                        Package (0x05)
                        {
                            0x05, 
                            Zero, 
                            Zero, 
                            0xFC, 
                            0x02
                        }
                    })
                }
            }

            Return (Package (0x01)
            {
                Package (0x05)
                {
                    0x05, 
                    Zero, 
                    Zero, 
                    0xFC, 
                    One
                }
            })
        }
    }
}

