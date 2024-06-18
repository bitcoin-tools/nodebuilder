# Manually Add Lightning to Nodebuilder

These docs are a beginner-friendly version of the [installation documentation from Core Lightning](https://github.com/ElementsProject/lightning/blob/master/doc/getting-started/getting-started/installation.md). If you are technical, please read and follow those docs instead.

At this time, your Linux distribution must use the `apt` Package manager.

## Hardware and Data Considerations

Data integrity is critical for lightning nodes. If your channel states become corrupted, your money may become unrecoverable.

To avoid losing money, your lightning hardware setup should be resilient to power loss, hardware failure, and spontaneous bit flips.

### Power Loss

To protect against power loss, you should consider:

- a battery backup on your internet modem, router, cable signal amplifiers, etc. to ensure your WiFi stays on if your power drops
- a laptop (with a working battery) instead of a desktop computer or micro-computer like a Raspberry P
- a UPS (uninterruptible power supply) backup battery powering the laptop

### Hardware Failures

To protect against hardware failure, you should consider:

- RAID-1 mirroring set up between two internal drives
  - Ideally, the laptop would have both an internal NVMe drive and an internal SATA drive. See the [recommended laptop models](#recommended-laptop-models).
  - Each drive needs at least 1 TB of capacity to sync the chain without pruning, but ideally 2 TB or more.
- scheduled channel backups to local network storage every 5 minutes
- scheduled encrypted channel backups to the cloud every hour
- a spare laptop to recover your lightning node when your primary laptop dies.
  - You can use one or both of the primary laptop's storage drives in case of a failure.

### Bit Flips

Data faults are inevitable with computers. Spontaneous bit flips can come from hardware glitches or high-energy cosmic particles.

To protect against spontaneous bit flips, you should consider:

- a file system type that includes data integrity checks, such as ZFS or BTRFS
- ECC RAM (error correcting code memory), ideally 32 GB or more

### Recommended Laptop Models

Here's a laptops that support using both an internal NVMe drive and internal SATA drive:

- Thinkpad E490 (released late 2019 / early 2020)
  - 32 GB max ram, optional i7 upgraded processor

## Ubuntu Instructions

This procedure has been tested on Ubuntu 24.

### Configure RAID-1

You can either configure RAID in the UEFI (a.k.a. modern BIOS) or at the software level.

#### Configure Hardware-Level RAID

To configure RAID at the hardware level:

1. Boot into the system setup.
2. Look for a RAID option.
3. Set up a RAID-1

If you don't see a RAID option in the UEFI setup options, your system might not support RAID at the hardware level. Set it up at the software level instead.

#### Alternatively, Configure Software-Level RAID

To configure RAID at the software level:

1. Create a USB boot drive with the latest LTS version of Ubuntu Server. The Ubuntu Desktop installer doesn't support RAID configuration through the installer.
2. asdf

### Use Tor on Lightning

- Install Tor and verify the service is "active" and "enabled" with `systemctl status tor`.

- Make sure the following lines are in `/etc/tor/torrc`, without a `#` at the beginning of the line:

  ```text
  ExitPolicy reject *:* # no exits allowed
  ControlPort 9051
  CookieAuthentication 1
  CookieAuthFileGroupReadable 1
  ```

- Add the following lines to `~/.lightning/config`.

  ```text
  proxy=127.0.0.1:9050
  bind-addr=127.0.0.1:9735
  addr=statictor:127.0.0.1:9051
  always-use-proxy=true
  ```

- Make sure the user running Lightning is a member of the Tor group.
  - Check if the user is already a member of the tor group.

    ```sh
    groups "${LIGHTNINGUSER:-$USER}"
    ```

  - Add the user to the tor group, shut down Lightning and Bitcoin, and restart the computer.

    ```sh
    sudo usermod -a -G "$(stat -c '%G' /run/tor/control.authcookie)" "${LIGHTNINGUSER:-$USER}"
    [ -f "${HOME}/.lightning/lightningd-bitcoin.pid" ] && lightning-cli stop
    while [ -f "${HOME}/.lightning/lightningd-bitcoin.pid" ]; do sleep 1; done
    [ -f "${HOME}/.bitcoin/bitcoind.pid" ] && bitcoin-cli --rpcwait stop
    while [ -f "${HOME}/.bitcoin/bitcoind.pid" ]; do sleep 1; done
    reboot || sudo reboot
    ```
