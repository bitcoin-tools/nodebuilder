# Test Procedures

This page outlines the procedures to test `bitcoin-core-node-builder` scripts.

## Table of Contents
- [Automated Validation](#automated-validation)
  - [Details About the Validation Tools](#details-about-the-validation-tools)
  - [How to Use ShellCheck](#how-to-use-shellcheck)
  - [How to Use shfmt](#how-to-use-shfmt)
  - [How to Use markdown-link-check](#how-to-use-markdown-link-check)
- [Manual Testing](#manual-testing)
  - [Major Code Changes](#major-code-changes)
  - [Minor Code Changes](#minor-code-changes)

## Automated Validation

_**Before**_ opening a pull request, you must validate your changes against three third-party static analysis tools `ShellCheck`, `shfmt`, and `markdown-link-check`.

_**After**_ opening a pull request, GitHub Actions CI will [automatically run these tools](https://github.com/bitcoin-tools/nodebuilder/actions/workflows/bash_validation_ci.yaml) for you.

### Details About the Validation Tools

[`ShellCheck`](https://shellcheck.net/) gives warnings and suggestions for bash/sh shell scripts, including:
- typical beginner's syntax issues that cause a shell to give cryptic error messages
- typical intermediate level semantic problems that cause a shell to behave strangely and counter-intuitively.
- subtle caveats, corner cases and pitfalls that may cause an advanced user's otherwise working script to fail under future circumstances.

[`shfmt`](https://github.com/mvdan/sh) formats shell programs. `shfmt`'s default shell formatting was chosen to be consistent, common, and predictable.

[`markdown-link-check`](https://github.com/tcort/markdown-link-check) extracts links from markdown texts and checks whether each link is alive (200 OK) or dead.

You can add the three packages to your local environment with `sudo apt install -y shellcheck shfmt && npm install -g markdown-link-check`.

### How to Use ShellCheck

To validate changes against `shellcheck`, run the following command:
```bash
shellcheck ~/Documents/GitHub/bitcoin-core-node-builder/nodebuilder
```

Alternatively, [a VSCode extension to integrate ShellCheck](https://github.com/vscode-shellcheck/vscode-shellcheck) can simplify the process.

### How to Use shfmt

To validate changes against `shfmt`, run the following command:
```bash
shfmt -i 2 -sr -d ~/Documents/GitHub/bitcoin-core-node-builder/nodebuilder
```

### How to Use markdown-link-check

To validate changes against `markdown-link-check`, run the following command:
```bash
markdown-link-check ./README.md
```

## Manual Testing

During the review period, open pull requests should be manually tested to ensure:
1. The change actually fixes the issue
2. The change doesn't cause unintentional bugs

### Major Code Changes

For major changes to the code or for Bitcoin Core version upgrades, perform a full test on a fresh install of:
- Ubuntu Desktop LTS running on bare metal
- Debian 12 running on a Proxmox virtual machine

### Minor Code Changes

For minor changes, each pull request should be tested on Ubuntu Desktop.

Run the following command after updating the `test_branch_name`:
```bash
test_branch_name=""
cd "${HOME}"/
rm -rf "${HOME}"/{.bitcoin/,bitcoin/,bitcoin-*-linux-gnu.tar.gz}
[ -d "${HOME}"/bitcoin-core-node-builder/ ] && rm -rf "${HOME}"/bitcoin-core-node-builder/
git clone https://github.com/bitcoin-tools/nodebuilder.git -b "${test_branch_name}"
"${HOME}"/bitcoin-core-node-builder/nodebuilder
```

