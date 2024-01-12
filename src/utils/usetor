#!/bin/bash
#
# Use Tor with Bitcoin Core.

# THIS SCRIPT IS NOT READY YET
# DO NOT TRUST THIS CODE YET
# IT'S A DRAFT AND NOT TESTED

sudo apt update
sudo apt install -y tor

service tor status

sudo adduser "$USER" debian-tor

#SOCKSPort 9050
#Log notice stdout
ControlPort 9051
CookieAuthentication 1
CookieAuthFileGroupReadable 1
#HiddenServiceDir /var/lib/tor/??
#HiddenServicePort 8080 127.0.0.1:8080

sudo su -c "echo -e \"ControlPort 9051\nCookieAuthentication 1\nCookieAuthFileGroupReadable 1\n\" >> /etc/tor/torrc"
systemctl restart tor

# Set the Bitcoin Core configuration file
cat << EOF > "$HOME"/.bitcoin/bitcoin.conf
server=1
listen=1

proxy=127.0.0.1:9050
bind=127.0.0.1

onlynet=onion
dnsseed=0
dns=0

addnode=ayrzo6udycv2xcc3hzk4vpncak25wlqye232poncrimi3wjneqpsfayd.onion
addnode=kup3542d3wsjl6lppaetbnoxflppfmr6cacc5t5k54ugjrcs6qi2lpqd.onion
addnode=vwiq62bttuibd7qlkmbsegddvohv6sqtuogybvot2a67vgqehlcinxad.onion
addnode=guapoztsea3fnovtv2mhknl2adasjgbrbukyzvjm6dmetjatctwg3gid.onion
EOF
# The addnode= addresses above were randomly pickc from bitnodes.io
# Only used for testing purposes, these addresses are not endorsed.
# https://bitnodes.io/nodes/-8333/
# https://bitnodes.io/nodes/?q=Tor%20network%20(TOR)
