# syntax=docker/dockerfile:1
FROM ubuntu:22.04
ENV TERM=xterm

# Install system updates and dependencies
RUN apt-get -qq update \
  && DEBIAN_FRONTEND=noninteractive apt-get -qq install --assume-yes --no-install-recommends \
  ca-certificates curl netcat 'sudo' \
  && rm -rf /var/lib/apt/lists/*

# Execute the script
RUN update-ca-certificates \
  && git clone --single-branch --depth 1 https://github.com/bitcoin-tools/nodebuilder.git \
  && cd nodebuilder
COPY nodebuilder /opt/src/scripts/nodebuilder
RUN ["/bin/bash", "-c", "/opt/src/scripts/nodebuilder"]
