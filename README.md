# Bitcoin Core Node Builder

Run a secure Bitcoin Core node with ease.

Copy-paste the following command into Terminal:

```sh
sh -c "$(curl -fsSL https://github.com/bitcoin-tools/nodebuilder/raw/v1.6.0/nodebuilder)"
```

[![Run Bitcoin Core](https://img.shields.io/badge/run-Bitcoin%20Core-orange.svg?logo=data:image/svg+xml;base64,PHN2ZyB2aWV3Qm94PSIwIDAgMjQgMjQiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PHBhdGggZD0iTTIzLjYzNiAxNC45MDJjLTEuNjAyIDYuNDMtOC4xMTQgMTAuMzQyLTE0LjU0MyA4Ljc0QzIuNjY2IDIyLjAzNy0xLjI0NiAxNS41MjUuMzU3IDkuMDk4IDEuOTYgMi42NjkgOC40Ny0xLjI0NCAxNC44OTcuMzU5YzYuNDMgMS42MDIgMTAuMzQxIDguMTE1IDguNzM5IDE0LjU0NCIgZmlsbD0iI2Y3OTMxYSIvPjxwYXRoIGQ9Ik0xNC42ODYgMTAuMjY3Yy0uMzcxIDEuNDg3LTIuNjYzLjczMS0zLjQwNi41NDZsLjY1NS0yLjYyOWMuNzQzLjE4NiAzLjEzOC41MzEgMi43NSAyLjA4M20tLjQwNiA0LjI0MmMtLjQwNyAxLjYzNS0zLjE2Ljc1LTQuMDUzLjUzbC43MjQtMi45Yy44OTMuMjI0IDMuNzU0LjY2NCAzLjMzIDIuMzdtMy4wMDgtNC4yMTljLjIzOC0xLjU5Ni0uOTc3LTIuNDU1LTIuNjQtMy4wMjdsLjU0LTIuMTYzLTEuMzE4LS4zMy0uNTI1IDIuMTA3YTU0LjI5MiA1NC4yOTIgMCAwIDAtMS4wNTQtLjI0OWwuNTMtMi4xMi0xLjMxNy0uMzI4LS41NCAyLjE2MmMtLjI4Ni0uMDY1LS41NjctLjEzLS44NC0uMTk4bC4wMDEtLjAwNy0xLjgxNi0uNDUzLS4zNSAxLjQwNnMuOTc3LjIyNC45NTYuMjM4Yy41MzMuMTMzLjYzLjQ4Ni42MTMuNzY2bC0uNjE1IDIuNDYzYy4wMzguMDEuMDg1LjAyNC4xMzcuMDQ1bC0uMTM4LS4wMzUtLjg2MiAzLjQ1MmMtLjA2NS4xNjEtLjIzLjQwNS0uNjA0LjMxMi4wMTQuMDItLjk1Ny0uMjM5LS45NTctLjIzOUw1LjgzNiAxNS42bDEuNzE0LjQyN2MuMzE4LjA4LjYzLjE2NC45MzguMjQybC0uNTQ1IDIuMTkgMS4zMTUuMzI4LjU0LTIuMTY0Yy4zNi4wOTcuNzA4LjE4NyAxLjA1LjI3MWwtLjUzOCAyLjE1NiAxLjMxNi4zMjguNTQ2LTIuMTgzYzIuMjQ1LjQyNCAzLjkzMy4yNTMgNC42NDMtMS43NzcuNTc0LTEuNjM1LS4wMjctMi41NzgtMS4yMDgtMy4xOTQuODYtLjE5OCAxLjUwOC0uNzY1IDEuNjgxLTEuOTM0IiBmaWxsPSIjZmZmIi8+PC9zdmc+)](https://bitcoincore.org)
[![Language: POSIX shell](https://img.shields.io/badge/language-POSIX%20shell-green.svg?logo=gnubash)](https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html)
[![License: MIT-0](https://img.shields.io/badge/license-MIT--0-yellow.svg?logo=data:image/svg+xml;base64,PCFET0NUWVBFIHN2ZyBQVUJMSUMgIi0vL1czQy8vRFREIFNWRyAxLjEvL0VOIiAiaHR0cDovL3d3dy53My5vcmcvR3JhcGhpY3MvU1ZHLzEuMS9EVEQvc3ZnMTEuZHRkIj4KPCEtLSBVcGxvYWRlZCB0bzogU1ZHIFJlcG8sIHd3dy5zdmdyZXBvLmNvbSwgVHJhbnNmb3JtZWQgYnk6IFNWRyBSZXBvIE1peGVyIFRvb2xzIC0tPgo8c3ZnIGZpbGw9IiNmZmZmZmYiIHdpZHRoPSI4MDBweCIgaGVpZ2h0PSI4MDBweCIgdmlld0JveD0iMCAwIDMyIDMyIiB2ZXJzaW9uPSIxLjEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+Cg08ZyBpZD0iU1ZHUmVwb19iZ0NhcnJpZXIiIHN0cm9rZS13aWR0aD0iMCIvPgoNPGcgaWQ9IlNWR1JlcG9fdHJhY2VyQ2FycmllciIgc3Ryb2tlLWxpbmVjYXA9InJvdW5kIiBzdHJva2UtbGluZWpvaW49InJvdW5kIi8+Cg08ZyBpZD0iU1ZHUmVwb19pY29uQ2FycmllciI+IDx0aXRsZT5qdXN0aWNlPC90aXRsZT4gPHBhdGggZD0iTTI0LjA2NCA2LjU4M2wtMy43NzMgOC4zNzVoLTEuMDk4bDQuMDI0LTguOTE2aC02LjIxM3YyMC43NzFjMS4yOCAwLjA0NyA3LjgxMyAyLjE2NyA3LjgxMyAyLjE2N3YxLjAyMGgtMTcuNTZ2LTEuMDg5YzAgMCA2LjY3OC0yLjA5OSA3LjY4NC0yLjA5OXYtMjAuNzdoLTYuMDE1bDQuMDI1IDguOTE2aC0xLjA5OGwtMy43NzMtOC4zNzUtMy43NzMgOC4zNzVoLTEuMDk4bDQuMDQ4LTguOTY2di0xLjAzNGg2Ljc1NGMwLTEuMzUzIDAuOTA3LTIuNDU4IDEuOTY1LTIuNDU4IDEuMTE5IDAgMS45NjUgMS4xNjggMS45NjUgMi40NThoNi44Nzh2MC44ODdsNC4xMTYgOS4xMTNoLTEuMDk4bC0zLjc3My04LjM3NXpNMTMuMDIwIDE1Ljk3OWMwIDIuNjkzLTEuODY4IDUuMjgyLTQuOTM5IDUuMjgyLTMuMDAyIDAtNC45MzktMi41ODktNC45MzktNS4yODItMC4wMDEgMC4wMDQgOS44NzggMC4wMDQgOS44NzggMHpNMTkuMjYyIDE1Ljk3OWMwIDAuMDA1IDkuODc5IDAuMDA1IDkuODc5IDAgMCAyLjY5My0xLjg2OCA1LjI4Mi00LjkzOSA1LjI4Mi0zLjAwMyAwLTQuOTQtMi41ODktNC45NC01LjI4MnoiLz4gPC9nPgoNPC9zdmc+)](https://opensource.org/licenses/MIT-0)

[![Supports: Docker](https://img.shields.io/badge/supports-Docker-blue.svg?logo=docker)](https://docs.docker.com/)
[![Supports: Linux distros](https://img.shields.io/badge/supports-Linux%20distros-blue.svg?logo=linux)](https://en.wikipedia.org/wiki/List_of_Linux_distributions)
[![Supports: macOS](https://img.shields.io/badge/supports-macOS-blue.svg?logo=apple)](https://support.apple.com/guide/mac-help/welcome/mac)

##### Health Checks

[![Validation CI](https://github.com/bitcoin-tools/nodebuilder/actions/workflows/validation.yaml/badge.svg?branch=master&event=push)](https://github.com/bitcoin-tools/nodebuilder/actions/workflows/validation.yaml)
[![Build and Push Docker Images](https://github.com/bitcoin-tools/nodebuilder/actions/workflows/push_release_images.yaml/badge.svg?event=release)](https://github.com/bitcoin-tools/nodebuilder/actions/workflows/push_release_images.yaml)

## Table of Contents

- [Usage](#usage)
  - [(Optional) Docker Container](#optional-docker-container)
  - [(Optional) Command-Line Arguments](#optional-command-line-arguments)
- [Prerequisites](#prerequisites)
- [What Does This Script Do?](#what-does-this-script-do)
  - [Which Parts of My System Does This Script Touch?](#which-parts-of-my-system-does-this-script-touch)
  - [How Do I Uninstall Everything?](#how-do-i-uninstall-everything)
- [Acknowledgements](#acknowledgements)
- [Contributing](#contributing)
- [License](#license)

## Usage

As mentioned above, start the script from the command line. Open Terminal and run:

```sh
sh -c "$(curl -fsSL https://github.com/bitcoin-tools/nodebuilder/raw/v1.6.0/nodebuilder)"
```

Or download the script to your local system, set permissions, and run it:

```sh
wget https://github.com/bitcoin-tools/nodebuilder/raw/v1.6.0/nodebuilder
chmod u+x nodebuilder
./nodebuilder
```

### (Optional) Docker Container

A nodebuilder Docker container can either run on Ubuntu (default) or on an alternative Linux distribution: Alpine, Amazon, Arch, Debian, Fedora, Manjaro, openSUSE, and Red Hat.

To the Ubuntu base image, clone the repository and build the default container.

```
git clone https://github.com/bitcoin-tools/nodebuilder
cd nodebuilder/docker/
docker build .
```

To use an [alternative base image](docker/), clone the repository and build a different container. For example, to run nodebuilder on Alpine Linux, run:

```
docker build -f Dockerfile_alpine .
```

### (Optional) Command-Line Arguments

`nodebuilder` supports optional arguments to override the default semi-automated settings:

| Short | Long Version | Description |
|:-----:|:-------------|:------------|
| `-b` | `--bitcoin-version` | Specify the Bitcoin version. Requires one argument, for example: `-b 27.1` |
| `-c` | `--compile` | Build Bitcoin from source. Requires no arguments. |
| `-h` | `--help` | Display the help message. _Overrides all other arguments._ |
| `-p` | `--prune` | Set a prune value in MiB. Requires one argument, for example: `-p 50000` |
| `-t` | `--test` | Run unit tests on functions. |
| `-u` | `--unattended` | Run in non-interactive mode. Requires no arguments. |

You can set multiple options. Here are two ways to compile Bitcoin 27.1 unattended with a 50000 MiB prune:

```sh
./nodebuilder -b 27.1 -c -p 50000 -u
./nodebuilder --bitcoin-version 27.1 --compile --prune 50000 --unattended
```

## Prerequisites

1. An active internet connection (of course)
2. A POSIX-compatible operating system
   - Linux - [Alpine](https://wiki.alpinelinux.org/wiki/Installation), [Arch](https://github.com/archlinux/archinstall) or any derivative like [Manjaro](https://wiki.manjaro.org/index.php/Installation_Guides), [Debian](https://debian.org/releases/stable/installmanual) or any derivative like [Ubuntu](https://ubuntu.com/tutorials/install-ubuntu-desktop#1-overview), [Fedora](https://fedoraproject.org/workstation/download), [SUSE](https://documentation.suse.com/sles/) or any derivative like [openSUSE Leap](https://get.opensuse.org/leap/)
   - [macOS](https://apple.com/macos)
   - Or, any system that can run [Docker](./docker/)
   - On Windows, either run nodebuilder in WSL (Windows Subsystem for Linux) or in a [Docker container](#optional-docker-container)
3. `curl`, which the script will attempt to automatically install or you can install with a package manager

This POSIX-compliant script installs a minimal number of [runtime dependencies](./resources/dependencies/) that aren't defined in POSIX.

## What Does This Script Do?

The script performs the following actions:
1. Update the system (including reboot, if required) and install [dependencies](./resources/dependencies/).
2. Either download, validate, and extract Bitcoin Core or build directly from the source code.
3. Set a prune for Bitcoin Core based on the disk free space.
4. Create shortcuts for Bitcoin Core on the desktop and the "Show Applications" list.
5. Start Bitcoin Core.
6. Prevent the system from sleeping, suspending, and hibernating.
7. Display relevant info while the initial block download proceeds, such as the percent synced, blocks left to sync, current chain tip date, and the free disk space remaining.
8. After the initial block download completes, tell the user that the script has finished and end the script.

### Which Parts of My System Does This Script Touch?

This script modifies the following in your file system:
- Any files related to installing system updates and [dependencies](./resources/dependencies/)
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
- Any files modified by Bitcoin Core, such as the blockchain, unspent transaction, and peer data.

### How Do I Uninstall Everything?

An automated solution is in the backlog. For now, here are a series of manual steps to follow:

- Uninstalling [runtime dependencies](./resources/dependencies/) can be be tricky. This script installs a minimal number of dependencies like curl, gzip, sudo, and tar as a defensive security posture. For advanced users, if you compiled Bitcoin from source by either using the `-c/--compile` optional argument or by running on Alpine Linux,  please also review the build dependencies that were installed.

- To remove the downloaded Bitcoin Core installation and verification files, open the Files or Finder application, go to Downloads, and remove any files starting with `bitcoin-`. Also remove the directory named `guix.sigs`.

  - Or do it in Terminal with `rm ~/Downloads/bitcoin-*.tar.gz && rm -r ~/Downloads/guix.sigs/`.

- To remove the installed executable binaries, headers, libraries, and manual pages, open the Files or Finder application, go to `/usr/local/bin`, and remove `bitcoind`, `bitcoin-cli`, `bitcoin-qt`, `bitcoin-util`, `bitcoin-wallet`, and `test_bitcoin`. Then go to `/usr/local/include` and remove `bitcoinconsensus.h`. Then go to `/usr/local/lib` and remove `libbitcoinconsensus.so`, `libbitcoinconsensus.so.0`, `libbitcoinconsensus.so.0.0.0` on Linux or `libbitcoinconsensus.0.dylib` on macOS. Then go to `/usr/local/man/man1` and remove `bitcoind.1`, `bitcoin-qt.1`, `bitcoin-cli.1`, `bitcoin-tx.1`, `bitcoin-util.1`, and `bitcoin-wallet.1`.

   - Or do it in Terminal with `rm /usr/local/bin/{bitcoind,bitcoin-cli,bitcoin-qt,bitcoin-tx,bitcoin-util,bitcoin-wallet,test_bitcoin} /usr/local/include/bitcoinconsensus.h /usr/local/lib/{libbitcoinconsensus.so,libbitcoinconsensus.so.0,libbitcoinconsensus.so.0.0.0} /usr/local/man/man1/{bitcoind.1,bitcoin-qt.1,bitcoin-cli.1,bitcoin-tx.1,bitcoin-util.1,bitcoin-wallet.1}` on Linux or `rm /usr/local/bin/{bitcoind,bitcoin-cli,bitcoin-qt,bitcoin-tx,bitcoin-util,bitcoin-wallet,test_bitcoin} /usr/local/include/bitcoinconsensus.h /usr/local/lib/libbitcoinconsensus.0.dylib /usr/local/man/man1/{bitcoind.1,bitcoin-qt.1,bitcoin-cli.1,bitcoin-tx.1,bitcoin-util.1,bitcoin-wallet.1}` on macOS. If the command fails, your user doesn't have proper privileges. Try adding `sudo` to the front of the command.

- To remove the shortcut files on Linux, go to the Desktop and remove the `bitcoin_core.desktop` file. Then go to `~/.local/share/applications` and remove `bitcoin_core.desktop`.

   - Or do it in Terminal with `rm ~/Desktop/bitcoin_core.desktop ~/.local/share/applications/bitcoin_core.desktop` on Linux.

- **If you want to keep your synced blocks and chainstate data**, open the Files or Finder application, go to the data directory at `~/.bitcoin` on Linux or `~/Library/Application Support/Bitcoin` on macOS, and either backup the `blocks` and `chainstate` directories to an external drive or move those directories somewhere else on your computer. (The next step will remove everything else from the Bitcoin Core data directory.)

   - Also open `bitcoin.conf` and make note of your prune value, in MiB (1024^2 bytes). Perhaps save that line (and only that line) to a text file wherever you copy/move the `blocks` and `chainstate` directories to. Any future Bitcoin Core nodes you run ***must have a prune setting less than or equal to this value***, or you'll have to re-sync the chain.

- To remove the data directory, open the Files or Finder application, go to the `~` on Linux or `~/Library/Application Support` on macOS, and delete the data directory named `.bitcoin` on Linux or `Bitcoin` on macOS. You need to enable the "Show Hidden Files" option in the Files or Finder settings.

  - Or do it in Terminal with `rm -r ~/.bitcoin/` on Linux or `rm -r ~/Library/Application\ Support/Bitcoin/` on macOS.
 
If you have any questions or ideas on how this section can be improved, please [open an issue](https://github.com/bitcoin-tools/nodebuilder/issues).

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

If you plan to submit a pull request, please first look over our automated and manual [test procedures](test/TEST.md).

## License

This project is licensed under the terms of [the MIT No Attribution / MIT-0 license](./LICENSE).
