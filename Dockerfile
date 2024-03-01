# syntax=docker/dockerfile:1
FROM ubuntu:22.04
ENV TERM=xterm

# Install system updates and dependencies
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install --assume-yes --no-install-recommends bc git libxcb-xinerama0 netcat 'sudo' && rm -rf /var/lib/apt/lists/*

# Execute the script
RUN git clone --single-branch --depth 1 https://github.com/bitcoin-tools/nodebuilder && cd nodebuilder
COPY nodebuilder /opt/src/scripts/nodebuilder
RUN ["/bin/bash", "-c", "/opt/src/scripts/nodebuilder"]
