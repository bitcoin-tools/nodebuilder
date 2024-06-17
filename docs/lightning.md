# Manually Add Lightning to Nodebuilder

These docs are a beginner-friendly version of the [installation documentation from Core Lightning](https://github.com/ElementsProject/lightning/blob/master/doc/getting-started/getting-started/installation.md). If you are technical, please read and follow those docs instead.

At this time, your Linux distribution must use the `apt` Package manager.

## Hardware Recommendations

Data integrity is critical for lightning nodes.

If your channel states become corrupted, you can lose money.

To avoid losing money, your lightning hardware setup should include:
- A battery backup on your internet modem, router, cable signal amplifiers, etc. to ensure your Wi-Fi stays on if your power drops
- A primary laptop (with a working battery) plugged into a UPS (uninterruptable power supply)
- ECC RAM (error correcting code memory), ideally 32 GB or more
- RAID-1 mirroring set up between a NVMe drive and a SATA drive, but ideally 2TB or more
  - Each drive needs a 1TB of capacity to sync the chain unpruned
- Channel backups to local network storage every 5 minutes
- Encrypted channel backups to the cloud every hour
- A backup laptop to recover your lightning node if/when your primary laptop dies.

## apt Package Manager (Ubuntu, Debian, etc.)

This procedure has been tested on Ubuntu 24.

### Install Tor and Configure Your Machine
