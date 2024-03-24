# Acer Extensa 5630 coreboot port research

    Intel GL40 - Cantiga (4 series)

## Intro

### coreboot stages

- bootblock
- verstage
- romstage
- postcar
- ramstage/smm 
- payload

### Porting steps

- GPIO configuration
- Debug output setup
- First image build and flash
- Prepare RAM initialization from romstage
- wip

## GPIO configuration 

### PCH

First step to porting coreboot is a proper GPIO configuration. It can be done
based on readily available PCH datasheets.

PCH was introduced in Intel 5 Series, as a replacement for both the southbridge
and northbridge. It meant that some of the functionality
of a GMCH was integrated into the CPU - the Graphics Controller Hub became the
integrated graphics contained within the cpu die, and the MCH's functionality
was divided between the CPU architecture and the new PCH chipset.

Intel 4 Series still uses the traditional northbridge and southbridge 
mainboard architecture. The northbridge - GMCH - doesn't have much to do with 
GPIOs, so no luck going through its datasheet. The GPIOs in this case are 
controlled by the southbridge, in this case ICH - Input Control Hub.

### ICH

GL40 comes with the ICH9M - base I/O Controller Hub southbridge. Datasheet 
saved and available in the repo. 

Coreboot comes with an autoport utility which officially supports only IvyLake
and SandyBridge architectures. There is, however, nothing unique about how 
those set the GPIOs, and there are available utils based on it that can 
generate `gpio.c` from `inteltool.log` for the GL40, such as Riku_V's 
[gpio-scripts](https://codeberg.org/Riku_V/gpio-scripts).

> Note that when using this utility for GL40, you will need to remove gpio set 
  3 from the output, as ICH9 does not have it.

The output of the script for GL40, as well as all useful logs generated via 
Dasharo Tools Suite, is available in this repo.

## Debug output setup

A debug log output is an essential tool in coreboot development, or any 
development for that matter. 

Best case scenario - you have a serial port available on your machine. Worse
case scenario is that there are serial headers somewhere on the mainboard.
Worst case scenario - the most tedious way to get logs is to enable writing
them to the SPI chip itself, which you will then have to read and extract.

GL40 is the worst case scenario (?)

## First build and flash

Generally, a proper GPIO configuration is the only prerequisite to building an
image that's safe to flash on an actual machine. With your debug output of 
choice, you can go ahead and build coreboot and test it on hardware - you
should at this point be able to get to **romstage**.

In most common cases, flashing boils down to locating the SPI flash chip 
containing the firmware and attaching a Pomona clip to it OR using the
dedicated SPI headers. Howewer, in this case it's not that simple.

The aforementioned method assumes that the chip is connected directly
to the southbridge via SPI. This particular mainboard however, is a much more
complex and troublesome design: 

* The SPI chip is connected via SPI to the 
    embedded controller
* The embedded controller is connected to the southbridge via LPC
* The EC effectively acts as the middleman, translating LPC Firmware Hub
    signals from the southbridge to SPI for the flash chip.

Connecting a programmer via a clip to the flash chip in all cases results in 
powering on the EC, which then tries to talk to the chip, interfering with
any SPI programmer operations.

One possible solution would be to desolder the flash chip and solder in a 
socket for quick access.






courtesy of nic3:

In terms of the coreboot port code, the FWH_SEL registers in the ICH9 (section 13.1.23, page 441 in the ICH9 datasheet) may need to be programmed in coreboot's bootblock so that the entire 2MiB is accessible, depending on how the EC is implements the LPC interface. Booting from LPC uses the Firmware Hub (FWH) cycle types of LPC (see page 21 of https://www.intel.com/content/dam/www/program/design/us/en/documents/low-pin-count-interface-specification.pdf). Originally, the FWH was a dedicated chip containing flash and some other features, but on your board the EC is likely emulating the FWH and translating FWH cycles to SPI messages to communicate with the flash. There is a 4 bit field called IDSEL which identifies which FWH chip the chipset is trying to communicate with (there can be multiple FWH chips on the bus). By default, the chipset is configured with ID 0 for the last 1MiB of address space, and ID 1 for the second last 1MiB of address space i.e. 2 chips each 1 MiB, but here you have 1 chip of 2MiB. It's possible the EC emulates 2 chips, or it could be just 1. Checking the value of those FWH_SEL registers should reveal how the EC implements that. They are in the LPC PCI config space, which can either be seen in the output of sudo lspci -xxx under device 00:1f.0. The addresses are in the ICH9 datasheet



----

## unsorted info
* Super I/O: Aspeed AST2400
