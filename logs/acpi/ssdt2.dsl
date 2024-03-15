/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20211217 (64-bit version)
 * Copyright (c) 2000 - 2021 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of ./ssdt2.dat, Sat Feb 10 15:09:27 2024
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x0000019D (413)
 *     Revision         0x01
 *     Checksum         0x9B
 *     OEM ID           "BrtRef"
 *     OEM Table ID     "DD01BRT"
 *     OEM Revision     0x00001000 (4096)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20050624 (537200164)
 */
DefinitionBlock ("", "SSDT", 1, "BrtRef", "DD01BRT", 0x00001000)
{
    External (_SB_.PCI0.GFX0.DD02, DeviceObj)
    External (_SB_.PCI0.LPCB.EC0_.ACST, IntObj)
    External (_SB_.PCI0.LPCB.EC0_.BNAC, FieldUnitObj)
    External (_SB_.PCI0.LPCB.EC0_.BNCM, FieldUnitObj)
    External (_SB_.PCI0.LPCB.EC0_.BNDC, FieldUnitObj)
    External (BCLP, PkgObj)
    External (MAXL, IntObj)

    Scope (\_SB.PCI0.GFX0.DD02)
    {
        Method (_BCL, 0, NotSerialized)  // _BCL: Brightness Control Levels
        {
            Return (\BCLP)
        }

        Method (_BCM, 1, NotSerialized)  // _BCM: Brightness Control Method
        {
            Local0 = 0x01
            Local1 = 0x02
            While (Local0)
            {
                If ((Arg0 == DerefOf (\BCLP [Local1])))
                {
                    Local0 = 0x00
                }
                Else
                {
                    Local1++
                    If ((\MAXL == Local1))
                    {
                        Local0 = 0x00
                    }
                }
            }

            Local1--
            Local1--
            If (\_SB.PCI0.LPCB.EC0.BNCM)
            {
                If (\_SB.PCI0.LPCB.EC0.ACST)
                {
                    \_SB.PCI0.LPCB.EC0.BNAC = Local1
                }
                Else
                {
                    \_SB.PCI0.LPCB.EC0.BNDC = Local1
                }
            }
            Else
            {
                \_SB.PCI0.LPCB.EC0.BNAC = Local1
            }
        }

        Method (_BQC, 0, NotSerialized)  // _BQC: Brightness Query Current
        {
            If (\_SB.PCI0.LPCB.EC0.BNCM)
            {
                If (\_SB.PCI0.LPCB.EC0.ACST)
                {
                    Local1 = \_SB.PCI0.LPCB.EC0.BNAC
                }
                Else
                {
                    Local1 = \_SB.PCI0.LPCB.EC0.BNDC
                }
            }
            Else
            {
                Local1 = \_SB.PCI0.LPCB.EC0.BNAC
            }

            Local1++
            Local1++
            Local0 = DerefOf (\BCLP [Local1])
            Return (Local0)
        }
    }
}

