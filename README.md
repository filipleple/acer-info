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

PCH was introduced in Intel 5 Series. Intel 4 Series uses GMCH - split into 
MCH (memory controller hub) and GCH (graphics controller hub). It doesn't 
have much to do with GPIOs, so no luck going through its datasheet. The GPIOs
in this case are controlled by the ICH - Input Control Hub.

### ICH

GL40 comes with the ICH9M - base I/O Controller Hub. Datasheet saved and 
available in the repo. 

Coreboot comes with an autoport utility which officially supports only IvyLake
and SandyBridge architectures. There is, however, nothing unique about how they
set the GPIOs, and there are available utils based on it that can generate
`gpio.c` from `inteltool.log` for the GL40, such as Riku_V's 
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
