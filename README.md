# Bitcoin Core Node Builder

Create a secure Bitcoin Core node with ease.

NOTE: This code is still under development and not yet ready. Test at your own risk.

## Table of Contents

- [Prerequisites](#prerequisites)
- [How to Run nodebuilder](#how-to-run-nodebuilder)
- [What Does This Script Do?](#what-does-this-script-do)
- [Which Files Does This Script Touch?](#which-files-does-this-script-touch)
- [YouTube Playlist](#youtube-playlist)
- [Acknowledgements](#acknowledgements)
- [License](#license)

## Prerequisites

1. An active internet connection (of course)
3. macOS (both newer Arm-based and older Intel-based systems) or any modern 64-bit Linux distribution **based on Debian**, such as [Ubuntu Desktop LTS](https://ubuntu.com/tutorials/install-ubuntu-desktop)
4. `bash`, which is probably already installed, or you can install on Linux with `sudo apt install -y bash`
5. `curl`, which is installed by default on macOS, or you can install on Linux with `sudo apt install -y curl`

(The script will automatically install additional [dependencies](./dependencies.txt).)

## How to Run nodebuilder

Open the Terminal and run the following command:
```
/bin/bash -c "$(curl -fsSL https://github.com/bitcoin-tools/nodebuilder/raw/master/nodebuilder)"
```

NOTE: This code is still under development and not yet ready. Test at your own risk.

## What Does This Script Do?

The script performs the following actions:
1. Update the system (including reboot, if required) and install [dependencies](./dependencies.txt).
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
- Any files added by Bitcoin Core, such as the `blocks/` and `chainstate/` directories
- The downloaded Bitcoin Core archive and validation files:
  - `/tmp/<mktemp_directory>/bitcoin-<version>-<architecture>-linux-gnu.tar.gz`
  - `/tmp/<mktemp_directory>/SHA256SUMS`
  - `/tmp/<mktemp_directory>/SHA256SUMS.asc`
  - `/tmp/<mktemp_directory>/guix.sigs/`
- The validated Bitcoin Core tarball and PGP keys:
  - `~/Downloads/bitcoin-<version>-<architecture>-linux-gnu.tar.gz`
  - `~/Downloads/guix.sigs/`
- The installed binaries and other relevant files:
  - `/usr/local/bin/{bitcoind,bitcoin-qt,bitcoin-cli,bitcoin-tx,bitcoin-util,bitcoin-wallet,test_bitcoin}`
  - `/usr/local/include/bitcoinconsensus.h`
  - `/usr/local/lib/{libbitcoinconsensus.so,libbitcoinconsensus.so.0,libbitcoinconsensus.so.0.0.0}` (Linux)
  - `/usr/local/lib/{libbitcoinconsensus.0.dylib}` (macOS)
  - `/usr/local/man/man1/{bitcoind.1,bitcoin-qt.1,bitcoin-cli.1,bitcoin-tx.1,bitcoin-util.1,bitcoin-wallet.1}`
- The Bitcoin Core configuration file:
  - `~/.bitcoin/bitcoin.conf` (Linux)
  - `~/Library/Application Support/Bitcoin/bitcoin.conf` (macOS)
- A shortcut on the desktop and Show Applications menu:
  - `~/Desktop/bitcoin_core.desktop` (Linux)
  - `~/.local/share/applications/bitcoin_core.desktop` (Linux)

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
