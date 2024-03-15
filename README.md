# Bitcoin Core Node Builder

Create a secure Bitcoin Core node with ease.

Run the following command in Terminal:
```
/bin/bash -c "$(curl -fsSL https://github.com/bitcoin-tools/nodebuilder/raw/master/nodebuilder)"
```

## Table of Contents

- [Prerequisites](#prerequisites)
- [What Does This Script Do?](#what-does-this-script-do)
- [Which Files Does This Script Touch?](#which-files-does-this-script-touch)
- [Acknowledgements](#acknowledgements)
- [Contributing](#contributing)
- [License](#license)

## Prerequisites

1. An active internet connection (of course)
3. A POSIX-compatible operating system:
   - [macOS](https://apple.com/macos)
   - Linux
      - [Alpine](https://wiki.alpinelinux.org/wiki/Installation)
      - [Arch](https://wiki.archlinux.org/title/installation_guide) or any derivative like [Manjaro](https://wiki.manjaro.org/index.php/Installation_Guides)
      - [Debian](https://debian.org/releases/stable/installmanual) or any derivative like [Ubuntu](https://ubuntu.com/tutorials/install-ubuntu-desktop)
      - [Fedora](https://fedoraproject.org/workstation/download)
      - [SUSE](https://documentation.suse.com/sles/) or any derivative like [openSUSE Leap](https://get.opensuse.org/leap/)
   - Any other system that can run a Docker container
      - Use the [default Ubuntu Dockerfile](./Dockerfile)
      - Or one of the six [alternate Dockerfiles](./dockerfiles/)
6. `curl`, which is installed by default on macOS, or you can install with a package manager

This POSIX-compliant script installs several common runtime dependencies that aren't defined in POSIX.

## What Does This Script Do?

The script performs the following actions:
1. Update the system (including reboot, if required) and install [dependencies](./dependencies.txt).
2. Download, validate, and extract Bitcoin Core.
3. Set a prune for Bitcoin Core based on the disk free space.
4. Create shortcuts for Bitcoin Core on the desktop and the "Show Applications" list.
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
- The installed Bitcoin Core files:
  - binaries
     - `/usr/local/bin/{bitcoind,bitcoin-qt,bitcoin-cli,bitcoin-tx,bitcoin-util,bitcoin-wallet,test_bitcoin}`
  - headers
     - `/usr/local/include/bitcoinconsensus.h`
  - libraries
     - `/usr/local/lib/{libbitcoinconsensus.so,libbitcoinconsensus.so.0,libbitcoinconsensus.so.0.0.0}` (Linux)
     - `/usr/local/lib/{libbitcoinconsensus.0.dylib}` (macOS)
  - manpages
     - `/usr/local/man/man1/{bitcoind.1,bitcoin-qt.1,bitcoin-cli.1,bitcoin-tx.1,bitcoin-util.1,bitcoin-wallet.1}`
- The Bitcoin Core configuration file:
  - `~/.bitcoin/bitcoin.conf` (Linux)
  - `~/Library/Application Support/Bitcoin/bitcoin.conf` (macOS)
- A shortcut on the desktop and Show Applications menu:
  - `~/Desktop/bitcoin_core.desktop` (Linux)
  - `~/.local/share/applications/bitcoin_core.desktop` (Linux)

## Acknowledgements

Inspiration for this project came from these Open Source projects:
- [Bitcoin Core](https://github.com/bitcoin/bitcoin/graphs/contributors)
- [Yeti Wallet](https://github.com/JWWeatherman/yeticold/graphs/contributors)
- [Bails](https://github.com/BenWestgate/Bails) and [yeti.Bash](https://github.com/BenWestgate/yeti.Bash) by [Ben Westgate](https://github.com/BenWestgate)
- [install-full-node.sh](https://bitnodes.io/install-full-node.sh) by [Addy Yeow](https://github.com/ayeowch/)
- [Parmanode](https://github.com/armantheparman/parmanode) by [ArmanTheParman](https://github.com/armantheparman)
- And from countless online guides, such as [this one](https://bitcoin.org/en/full-node)

## Contributing

Please open an issue for any bug reports or feature requests. If you plan to submit a pull request, please first look over our [test procedures](test/README.md).

## License

This project is licensed under the terms of [the MIT No Attribution / MIT-0 license](./LICENSE).
