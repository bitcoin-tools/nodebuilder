#!/bin/bash
#
# Use I2P with Bitcoin Core.

# THIS SCRIPT IS NOT READY YET
# DO NOT TRUST THIS CODE YET
# IT'S A DRAFT AND NOT TESTED

SIMPLE INSTALLATION INSTRUCTIONS

sudo apt install i2pd
sudo systemctl start i2pd.service
echo -e "i2psam=127.0.0.1:7656\ndebug=i2p" >> "$HOME"/.bitcoin/bitcoin.conf


ERROR that I encountered after installing

user1@EPCMZXDK-ThinkPad:~$ systemctl status i2pd
× i2pd.service - I2P Router written in C++
     Loaded: loaded (/lib/systemd/system/i2pd.service; enabled; vendor preset: >
     Active: failed (Result: core-dump) since Tue 2023-01-10 07:25:15 EST; 3min>
       Docs: man:i2pd(1)
             https://i2pd.readthedocs.io/en/latest/
    Process: 3205 ExecStart=/usr/sbin/i2pd $DAEMON_OPTS (code=exited, status=0/>
   Main PID: 3206 (code=dumped, signal=SEGV)
        CPU: 182ms

Jan 10 07:25:11 EPCMZXDK-ThinkPad systemd[1]: Starting I2P Router written in C+...
Jan 10 07:25:11 EPCMZXDK-ThinkPad systemd[1]: Started I2P Router written in C++.
Jan 10 07:25:15 EPCMZXDK-ThinkPad systemd[1]: i2pd.service: Main process exited, code=dumped, status=11/SEGV
Jan 10 07:25:15 EPCMZXDK-ThinkPad systemd[1]: i2pd.service: Failed with result 'core-dump'.


BUILD INSTRUCTIONS

git clone https://github.com/PurpleI2P/i2pd.git
cd i2pd/build/
sudo apt install make cmake g++ gcc libboost-all-dev libssl-dev
cmake -DWITH_AESNI=OFF
make
#sudo make install
sudo ln -s /usr/local/bin/i2pd /usr/sbin/i2pd

sudo systemctl unmask i2pd.service
sudo systemctl start i2pd.service
sudo ln -s /usr/local/bin/i2pd /usr/sbin/i2pd


MACOS INSTRUCTIONS

brew install boost cmake gcc git miniupnpc openssl@3 tor torsocks
torsocks /usr/local/bin/git clone https://github.com/PurpleI2P/i2pd.git
cd i2pd/build/
export OPENSSL_ROOT_DIR="/opt/homebrew/opt/openssl@3"
#export OPENSSL_ROOT_DIR="/usr/local/opt/openssl@3"
cmake -L
make HOMEBREW=1 -j8

mkdir -p $HOME/dist/addressbook/
cp i2pd $HOME/dist
cp ../contrib/i2pd.conf $HOME/dist
cp ../contrib/tunnels.conf $HOME/dist
cp -R ../contrib/certificates/ $HOME/dist
touch $HOME/dist/addressbook/local.csv

cd $HOME/dist/
./i2pd --datadir .
