#!/bin/bash
#
# Offload the synced Bitcoin Core blocks and chainstate data.
set -e

## The Bitcoin Core blocks source directory, with no trailing slash
data_directory_source="${HOME}/.bitcoin"

## The blocks target/destination directory, with no trailing slash
## For our example, the drive is mounted at "/media/user1/DRIVE1"
## and the target/destination directory is "timechain/"
data_directory_target="/media/${USER}/DRIVE1/timechain"

# Name of the directory to extract into, without the trailing / (forward slash)
bitcoin_core_extract_dir="${HOME}/bitcoin"
bitcoin_core_binary_dir="${bitcoin_core_extract_dir}/bin"

## Set the source and target variables
blocks_source="${data_directory_source}/blocks"
blocks_target="${data_directory_target}/blocks"
chainstate_source="${data_directory_source}/chainstate"
chainstate_target="${data_directory_target}/chainstate"

## Tell Bitcoin Core to stop and wait for the process to end
clear
echo -n "Closing Bitcoin Core."
## Find bitcoin-qt's process ID
qt_pid=$(pidof bitcoin-qt)
## Send a stop command via RPC using bitcoin-cli
"$bitcoin_core_binary_dir"/bitcoin-cli stop 1>/dev/null
## Wait for bitcoin-qt to stop
## This step can take up to a couple minutes in certain cases with slow hardware.
while [[ $(pidof bitcoin-qt) == "${qt_pid}" ]]; do echo -n "."; sleep 1; done
echo "closed."

## Search for all .dat files in the blocks directory and sort by the fourth character
find "$blocks_source" -name '*.dat' -type f -printf '%f\n' | sort -k1.4 > tomove

## Find the highest numbered rev file
highest_blk_dat=$(tail -2 tomove | head -1)
highest_rev_dat=$(tail -1 tomove)
echo {"${highest_blk_dat}","${highest_rev_dat}"} # for testing and development purposes only

## Remove the highest-numbered blk*.dat file from tomove
grep -v "${highest_blk_dat}" tomove > tmpfile && mv tmpfile tomove
## Remove the highest-numbered rev*.dat file from tomove
grep -v "${highest_rev_dat}" tomove > tmpfile && mv tmpfile tomove

echo -n "Moving $(wc -l < tomove) block files."
## Iterate through each line of tomove
while read -r file; do
  ## Move the blk*.dat and rev*.dat files
  rsync -ptgouq --partial --remove-source-files "$blocks_source"/"$file" "$blocks_target"/"$file"
  ## Create symbolic link from target to data dir
  ln -s "$blocks_target"/"$file" "$blocks_source"/"$file"
  ## Create a new line after rev files are copied
  echo -n "."
done <tomove
echo " moved."
## Remove the list of files to move
rm tomove

## Copy the highest-numbered blk*.dat and rev*.dat
## We will leave the original copy, rather than move.
echo -n "Copying 2 block files... "
rsync -ptgouq --partial "${blocks_source}/${highest_blk_dat}" "${blocks_target}/"
rsync -ptgouq --partial "${blocks_source}/${highest_rev_dat}" "${blocks_target}/"
echo "copied."

## Copy the blocks/index/ directory
## Delete old blocks index files left in the target directory
echo -n "Copying the blocks index... "
rsync -auq --partial --delete "${blocks_source}/index/" "${blocks_target}/index/"
echo "copied."

## Copy the chainstate/ directory
## Delete old chainstate files left in the target directory
echo -n "Copying the unspent outputs... "
rsync -auq --partial --delete "${chainstate_source}/" "${chainstate_target}/"
echo "copied."

echo "Finished transferring the blocks and UTXO data."

## Launch and disown bitcoin-qt
echo "Launching Bitcoin Core."
"$bitcoin_core_binary_dir"/bitcoin-qt 2>/dev/null & disown
