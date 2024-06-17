# Manually Add Lightning to Nodebuilder

These docs are a beginner-friendly version of the [installation documentation from Core Lightning](https://github.com/ElementsProject/lightning/blob/master/doc/getting-started/getting-started/installation.md). If you are technical, please read and follow those docs instead.

At this time, your Linux distribution must use the `apt` Package manager.

## Hardware and Data Considerations

Data integrity is critical for lightning nodes. If your channel states become corrupted, your money may become unrecoverable.

To avoid losing money, your lightning hardware setup should include:
- a battery backup on your internet modem, router, cable signal amplifiers, etc. to ensure your Wi-Fi stays on if your power drops
- a primary laptop (with a working battery) plugged into a UPS (uninterruptable power supply)
- ECC RAM (error correcting code memory), ideally 32 GB or more
- RAID-1 mirroring set up between an internal NVMe drive and an internal SATA drive, but ideally 2TB or more
  - See the [recommended laptop models](#recommended-laptop-models).
  - Each drive needs at least 1 TB of capacity to sync the chain unpruned, but ideally 2 TB or more.
- channel backups to local network storage every 5 minutes
- encrypted channel backups to the cloud every hour
- a backup laptop to recover your lightning node if (when) your primary laptop dies.
  - You can swap one or both of the primary laptop's drives in case of a failure.

### Recommended Laptop Models

Here's a laptops that support using both an internal NVMe drive and internal SATA drive:
- Thinkpad E490 (released late 2019 / early 2020)
  - 32 GB max ram, optional i7 upgraded processor

## Ubuntu Instructions

This procedure has been tested on Ubuntu 24.

### Configure RAID-1

You can either configure RAID in the UEFI (a.k.a. modern BIOS) or at the software level.

To configure RAID at the hardware level:
1. Boot into the system setup.
2. Look for a RAID option.
3. Set up a RAID-1

If you don't see a RAID option in the UEFI setup options, your system might not support RAID at the hardware level. Set it up at the software level instead.

To configure RAID at the software level:
1. Create a bootable USB drive with the latest LTS version of Ubuntu Server.
2. 


The Ubuntu Desktop installer doesn't
