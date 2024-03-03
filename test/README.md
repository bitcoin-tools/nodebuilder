# Test Procedures

This page outlines the procedures to test changes to the `nodebuilder` repository.

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

After opening a pull request, GitHub Actions will begin running [a series of automated checks](https://github.com/bitcoin-tools/nodebuilder/actions/workflows/bash_validation_ci.yaml). After merging, the same CI checks will be run on the commit to `master`.

You can view the status of these CI tests on GitHub.com under the `Checks` tab of your PR or under the `Actions` tab of the repo. If any of these checks fail, review the relevant logs, research the error, and/or and manually reproduce it on your local environment.

All CI checks on the master branch should be passing.

1. [`ShellCheck`](https://shellcheck.net/) check the bash shell scripts, including:
  - typical beginner's syntax issues that cause a shell to give cryptic error messages
  - typical intermediate level semantic problems that cause a shell to behave strangely and counter-intuitively.
  - subtle caveats, corner cases and pitfalls that may cause an advanced user's otherwise working script to fail under future circumstances.

2. [`actionlint`](https://github.com/rhysd/actionlint) checks the GitHub Actions `.yaml` workflow file. We like it for a variety of reasons, such as that it also enforces `ShellCheck` during `run:`

3. [`dockerfilelint`](https://github.com/replicatedhq/dockerfilelint) checks analyzes the `Dockerfile`s for common traps and mistakes. We use it to enforce best practices.

4. [`shfmt`](https://github.com/mvdan/sh) formats shell programs. `shfmt`'s default shell formatting was chosen to be consistent, common, and predictable. We use it to enforce standardization.

5. [`markdown-link-check`](https://github.com/tcort/markdown-link-check) extracts links from markdown texts and checks whether each link is alive (200 OK) or dead.

6. [`PySpelling`](https://facelessuser.github.io/pyspelling/) which will check for typos in the markdown files. If you see any false-positives during the CI check, add the words to [our whitelist](../data/pyspelling.wordlist.txt)

After passing those six checks, GitHub Actions will then:
- run `nodebuilder` on Ubuntu 22 (latest)
- run `nodebuilder` on Ubuntu 20
- run `nodebuilder` on macOS 14 (arm64)
- run `nodebuilder` on macOS 13 (x86_64)
- run `nodebuilder` on macOS 12 (x86_64)
- run `nodebuilder` in a Fedora Docker container
- run `nodebuilder` in a Manjaro Docker container
- run `nodebuilder` in an Ubuntu Docker container

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
[ -d "${HOME}"/nodebuilder/ ] && rm -rf "${HOME}"/nodebuilder/
git clone https://github.com/bitcoin-tools/nodebuilder.git -b "${test_branch_name}"
"${HOME}"/nodebuilder/nodebuilder
```

