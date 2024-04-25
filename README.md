# Bitcoin Core Node Builder

Create a secure Bitcoin Core node with ease.

Run the following command in Terminal:
```
/bin/bash -c "$(curl -fsSL https://github.com/bitcoin-tools/nodebuilder/raw/master/nodebuilder)"
```

## Table of Contents

- [Prerequisites](#prerequisites)
- [What Does This Script Do?](#what-does-this-script-do)
  - [Which Parts of My System Does This Script Touch?](#which-parts-of-my-system-does-this-script-touch)
  - [How Do I Uninstall Everything?](#how-do-i-uninstall-everything)
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
      - Use the [default Dockerfile](./Dockerfile)
      - Or an [alternate Dockerfile](./dockerfiles/)
6. `curl`, which is installed by default on macOS, or you can install with a package manager

This POSIX-compliant script installs several common runtime dependencies that aren't defined in POSIX.

## What Does This Script Do?

The script performs the following actions:
1. Update the system (including reboot, if required) and install [dependencies](./dependencies/).
2. Either download, validate, and extract Bitcoin Core or build directly from the source code.
3. Set a prune for Bitcoin Core based on the disk free space.
4. Create shortcuts for Bitcoin Core on the desktop and the "Show Applications" list.
5. Start Bitcoin Core.
6. Prevent the system from sleeping, suspending, and hibernating.
7. Display relevant info while the initial block download proceeds, such as the percent synced, blocks left to sync, current chain tip date, and the free disk space remaining.
8. After the initial block download completes, tell the user that the script has finished and end the script.

### Which Parts of My System Does This Script Touch?

This script modifies the following parts of your filesystem:
- Any files related to installing system updates and [dependencies](./dependencies/)
- The downloaded Bitcoin Core and validation files:
  - `<temporary_directory>/compile_bitcoin/`
  - `<temporary_directory>/bitcoin-<version>-<architecture>-linux-gnu.tar.gz`
  - `<temporary_directory>/SHA256SUMS`
  - `<temporary_directory>/SHA256SUMS.asc`
  - `<temporary_directory>/guix.sigs/`
- The validated Bitcoin Core tarball and PGP keys:
  - `~/Downloads/bitcoin-<version>-<architecture>-linux-gnu.tar.gz`
  - `~/Downloads/guix.sigs/`
- The installed Bitcoin Core executable binaries, headers, libraries, and manual pages, respectively, are installed into:
  - `/usr/local/bin/{bitcoind,bitcoin-cli,bitcoin-qt,bitcoin-tx,bitcoin-util,bitcoin-wallet,test_bitcoin}`
  - `/usr/local/include/bitcoinconsensus.h`
  - `/usr/local/lib/{libbitcoinconsensus.so,libbitcoinconsensus.so.0,libbitcoinconsensus.so.0.0.0}` on Linux
  - `/usr/local/lib/libbitcoinconsensus.0.dylib` on macOS
  - `/usr/local/man/man1/{bitcoind.1,bitcoin-qt.1,bitcoin-cli.1,bitcoin-tx.1,bitcoin-util.1,bitcoin-wallet.1}`
- An entry in the Show Applications menu and also on the desktop:
  - `~/Desktop/bitcoin_core.desktop` on Linux
  - `~/.local/share/applications/bitcoin_core.desktop` on Linux
- The Bitcoin Core configuration file:
  - `~/.bitcoin/bitcoin.conf` on Linux
  - `~/Library/Application Support/Bitcoin/bitcoin.conf` on macOS
- Any files modified by Bitcoin Core, such as the blockchain and UTXO data and information about known peers.

### How Do I Uninstall Everything?

An automated solution is in the backlog. For now, here are a series of manual steps to follow:

- Uninstalling [runtime dependencies](./dependencies/) can be be tricky. This script installs a minimal number of dependencies like curl, gzip, sudo, and tar as a defensive security posture. For advanced users, if you compiled Bitcoin from source by either using the `-c/--compile` optional argument or by running on Alpine Linux,  please also review the build dependencies that were installed.

- To remove the downloaded Bitcoin Core installation and verification files, open the Files or Finder application, go to Downloads, and remove any files starting with `bitcoin-`. Also remove the directory named `guix.sigs`.

  - Or do it in Terminal with `rm ~/Downloads/bitcoin-*.tar.gz && rm -r ~/Downloads/guix.sigs/`.

- To remove the installed executable binaries, headers, libraries, and manual pages, open the Files or Finder application, go to `/usr/local/bin`, and remove `bitcoind`, `bitcoin-cli`, `bitcoin-qt`, `bitcoin-util`, `bitcoin-wallet`, and `test_bitcoin`. Then go to `/usr/local/include` and remove `bitcoinconsensus.h`. Then go to `/usr/local/lib` and remove `libbitcoinconsensus.so`, `libbitcoinconsensus.so.0`, `libbitcoinconsensus.so.0.0.0` on Linux or `libbitcoinconsensus.0.dylib` on macOS. Then go to `/usr/local/man/man1` and remove `bitcoind.1`, `bitcoin-qt.1`, `bitcoin-cli.1`, `bitcoin-tx.1`, `bitcoin-util.1`, and `bitcoin-wallet.1`.

   - Or do it in Terminal with `rm /usr/local/bin/{bitcoind,bitcoin-cli,bitcoin-qt,bitcoin-tx,bitcoin-util,bitcoin-wallet,test_bitcoin} /usr/local/include/bitcoinconsensus.h /usr/local/lib/{libbitcoinconsensus.so,libbitcoinconsensus.so.0,libbitcoinconsensus.so.0.0.0} /usr/local/man/man1/{bitcoind.1,bitcoin-qt.1,bitcoin-cli.1,bitcoin-tx.1,bitcoin-util.1,bitcoin-wallet.1}` on Linux or `rm /usr/local/bin/{bitcoind,bitcoin-cli,bitcoin-qt,bitcoin-tx,bitcoin-util,bitcoin-wallet,test_bitcoin} /usr/local/include/bitcoinconsensus.h /usr/local/lib/libbitcoinconsensus.0.dylib /usr/local/man/man1/{bitcoind.1,bitcoin-qt.1,bitcoin-cli.1,bitcoin-tx.1,bitcoin-util.1,bitcoin-wallet.1}` on macOS. If the command fails, your user doesn't have proper privileges. Try adding `sudo` to the front of the command.

- To remove the shortcut files on Linux, go to the Desktop and remove the `bitcoin_core.desktop` file. Then go to `~/.local/share/applications` and remove `bitcoin_core.desktop`.

   - Or do it in Terminal with `rm ~/Desktop/bitcoin_core.desktop ~/.local/share/applications/bitcoin_core.desktop` on Linux.

- **If you want to keep your synced blocks and chainstate data**, open the Files or Finder application, go to the data directory at `~/.bitcoin` on Linux or `~/Library/Application Support/Bitcoin` on macOS, and either backup the `blocks` and `chainstate` directories to an external drive or . (The next step will remove everything else from the Bitcoin Core data directory.)

   - Also open `bitcoin.conf` and make note of your prune value, in MiB (1024^2 bytes). Any future Bitcoin Core nodes you run must have a prune setting less than or equal to this value, or you'll have to re-sync the chain.

- To remove the data directory, open the Files or Finder application, go to the `~` on Linux or `~/Library/Application Support` on macOS, and delete the data directory named `.bitcoin` on Linux or `Bitcoin` on macOS. You may need to enable the *Show Hidden Files* option in the Files or Finder settings.

- Or do it in Terminal with `rm -r ~/.bitcoin/` on Linux or `rm -r ~/Library/Applicatoin\ Support/Bitcoin/` on macOS.

## Acknowledgements

Inspiration for this project came from these Open Source projects:
- [Bitcoin Core](https://github.com/bitcoin/bitcoin/graphs/contributors)
- [Yeti Wallet](https://github.com/JWWeatherman/yeticold/graphs/contributors)
- [Bails](https://github.com/BenWestgate/Bails) and [yeti.Bash](https://github.com/BenWestgate/yeti.Bash) by [Ben Westgate](https://github.com/BenWestgate)
- [install-full-node.sh](https://bitnodes.io/install-full-node.sh) by [Addy Yeow](https://github.com/ayeowch/)
- [Parmanode](https://github.com/armantheparman/parmanode) by [ArmanTheParman](https://github.com/armantheparman)
- And from countless online guides, such as [this one](https://bitcoin.org/en/full-node)

## Contributing

Please open an issue for any bug reports or feature requests. You can see the list of open issues [here](https://github.com/bitcoin-tools/nodebuilder/issues).

If you plan to submit a pull request, please first look over our automated and manual [test procedures](test/README.md).

## License

This project is licensed under the terms of [the MIT No Attribution / MIT-0 license](./LICENSE).
