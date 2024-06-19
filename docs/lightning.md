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

If you don't see a RAID option in the UEFI setup options, your system might not support RAID at the hardware level. Set it up at the software level instead.

#### Alternatively, Configure Software-Level RAID

The Ubuntu Desktop 24.04 LTS installer doesn't support RAID configuration through the installer, so use the Ubuntu Server installer.

To configure RAID on Ubuntu Server:

1. Create a USB boot drive with the latest LTS version of the Ubuntu Server installer.
2. Boot into the Ubuntu Server setup and proceed normally, such as choosing your language.
3. At the "Guided storage option" step, choose the "Custom storage layout" option to configure RAID.
4. Set up a software RAID-1 (`md`) configuration.
    1. Determine which two drives you will reformat and use for RAID-1. The best way is to check the Capacity.
    2. Ensure both drives show only free space. If either drive shows anything other than free space, reformat it.
    3. Select one of the two drives and choose "Use As Boot Device".
    4. Verify that a new mount point `/boot/efi` appears under FILE SYSTEM SUMMARY at the top.
    5. Verify that `partition 1 new, primary ESP, to be formatted as fat32, mounted at /boot/efi` appears under USED DEVICES at the bottom.
    6. Select the other of the two drives and choose "Add As Another Boot Device".
    7. Verify that `partition 1 new, backup ESP, to be formatted as fat32` appears under USED DEVICES at the bottom.
    8. For both drives, under the free space, choose Add GPT Partition, leave the size blank, select "Leave unformatted" for the format, and choose Create.
    9. Verify that `partition 2 new, unused` appears for both drives under AVAILABLE DEVICES in the middle.
    10. Create the `md0` RAID drive.
        - Select `Create software raid (md)`.
        - Leave the name as `md0` by default.
        - Leave the RAID Level as `1 (mirrored)` by default.
        - Select partition 2 from both drives.
        - Verify that the size at the bottom matches expectations, for example, "1.1818T" if using 2-terabyte drives.
        - Select Create.
    11. Verify that a new `md0 (new, unused)` device with only free space appears under AVAILABLE DEVICES in the middle.
    12. For the free space in the `md0` device, choose Add GPT Partition, leave the size blank, select "btrfs" for the format, leave the mount as `/` by default, and choose Create.
    13. Verify that a new mount point `/` mentioning "btrfs" and "software RAID 1" appears under FILE SYSTEM SUMMARY at the top.
    14. Select Done.
5. Continue with the Ubuntu Server setup process by setting your name, hostname, username, and password, and finish the installer.
6. When the installation is complete, reboot into Ubuntu Server, log in, and run `sudo apt install ubuntu-desktop`.
7. Ensure that the RAID-1 resync finishes. If you see a resync percentage when running `cat /proc/mdstat`, wait for the amount of time specified.
8. When the RAID-1 resync is complete, run `reboot` and wait for the Ubuntu Desktop screen to load.
9. Log into Ubuntu Desktop and install run System Updater to install security updates.

### Install Lightning

Compile and install Core Lightning.

```sh
sudo apt-get update
sudo NEEDRESTART_MODE=a apt-get install --assume-yes python3-pip python3-json5 python3-flask python3-gunicorn python3-venv libsecp256k1-dev jq autoconf automake build-essential git libtool libsqlite3-dev libffi-dev net-tools zlib1g-dev libsodium-dev gettext valgrind libpq-dev shellcheck cppcheck libsecp256k1-dev lowdown cargo rustfmt protobuf-compiler
pip3 install --upgrade pip
python3 -m venv myvenv
source myvenv/bin/activate
pip3 install flask-cors flask_restx pyln-client flask-socketio gevent gevent-websocket pyln-client websockets mako grpcio-tools
#pip3 install poetry
git clone -b v24.05 --depth 1 https://github.com/ElementsProject/lightning.git
cd lightning/
pip3 install -r plugins/clnrest/requirements.txt
./configure
make -j "$(nproc)"
sudo make install
deactivate
```

Check the installation using these commands and looking for the expected version:

```sh
lightningd --version
lightning-cli --version
```

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
