# Bitcoin Core Node Builder

Create a secure Bitcoin Core node with ease.

NOTE: This code is still under development and not yet ready. Test at your own risk.

## Table of Contents

- [Prerequisites](#prerequisites)
- [How to Run Node Builder](#how-to-run-node-builder)
- [What Does This Script Do?](#what-does-this-script-do)
- [Which Files Does This Script Touch?](#which-files-does-this-script-touch)
- [YouTube Playlist](#youtube-playlist)
- [Acknowledgements](#acknowledgements)
- [License](#license)

## Prerequisites

1. An active internet connection
2. A fresh install of any modern Linux distribution based on Debian like [Ubuntu Desktop LTS](https://ubuntu.com/tutorials/install-ubuntu-desktop)
3. curl, which you can install with `sudo apt install -y curl`

This script **does not** support macOS, 32-bit operating systems, or Arm-based hardware.

## How to Run Node Builder

Open the Terminal and run the following command:
```
/bin/bash -c "$(curl -fsSL https://github.com/bitcoin-tools/nodebuilder/raw/master/nodebuilder)"
```

NOTE: This code is still under development and not yet ready. Test at your own risk.

## What Does This Script Do?

The script performs the following actions:
1. Install system updates, reboot if necessary, then install dependencies.
2. Download, validate, and extract Bitcoin Core.
3. Set a prune for Bitcoin Core based on the disk free space.
4. Create shortcuts for Bitcoin Core on the desktop and on the "Show Applications" list.
5. Start Bitcoin Core.
6. Prevent the system from sleeping, suspending, and hibernating.
7. While the initial block download proceeds, display relevant info such as the percent synced, blocks left to sync, current chain tip date, and the free disk space remaining.
8. After the initial block download completes, tell the user that the script has finished and end the script.

## Which Files Does This Script Touch?

Before launching Bitcoin Core, this script modifies the following files:
- Any files related to installing system updates and dependencies
- The downloaded Bitcoin Core tarball and validation files:
  - `/tmp/*/bitcoin-*-x86_64-linux-gnu.tar.gz`
  - `/tmp/*/SHA256SUMS`
  - `/tmp/*/SHA256SUMS.asc`
  - `/tmp/*/guix.sigs/`
- The validated Bitcoin Core tarball and PGP keys:
  - `~/Downloads/bitcoin-*-x86_64-linux-gnu.tar.gz`
  - `~/Downloads/guix.sigs/`
- The Bitcoin Core tarball extract directory:
  - `~/bitcoin/`
- The Bitcoin Core configuration file:
  - `~/.bitcoin/bitcoin.conf`
- A shortcut on the desktop and Show Applications menu:
  - `~/Desktop/bitcoin_core.desktop`
  - `~/.local/share/applications/bitcoin_core.desktop`

## YouTube Playlist

Follow the changes to this repository on [our YouTube playlist](https://youtube.com/playlist?list=PL3dr_BSAPOFSaozbtQ1wZM2enpdJIY_5T).

## Acknowledgements

Inspiration for this project came from these Open Source projects:
- [Bitcoin Core](https://github.com/bitcoin/bitcoin/graphs/contributors)
- [Yeti Wallet](https://github.com/JWWeatherman/yeticold/graphs/contributors)
- [Bails](https://github.com/BenWestgate/Bails) and [yeti.Bash](https://github.com/BenWestgate/yeti.Bash) by [Ben Westgate](https://github.com/BenWestgate)
- [install-full-node.sh](https://bitnodes.io/install-full-node.sh) by [Addy Yeow](https://github.com/ayeowch/)
- [Parmanode](https://github.com/armantheparman/parmanode) by [ArmanTheParman](https://github.com/armantheparman)

And from these guides:
- [Running A Full Node](https://bitcoin.org/en/full-node) by [Bitcoin.org contributors](https://bitcoin.org)
- [Bitcoin & Lightning Server](https://youtube.com/watch?v=_Hrnls92TxQ) by [402 Payment Required](https://youtube.com/@402PaymentRequired)
- [Running Bitcoin & Lightning Nodes](https://stopanddecrypt.medium.com/running-bitcoin-lightning-nodes-over-the-tor-network-2021-edition-489180297d5) by [StopAndDecrypt](https://stopanddecrypt.medium.com/)

## License

This project is licensed under the terms of [the MIT No Attribution license](./LICENSE).
