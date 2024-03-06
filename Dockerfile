# syntax=docker/dockerfile:1
FROM ubuntu:22.04@sha256:77906da86b60585ce12215807090eb327e7386c8fafb5402369e421f44eff17e
ENV TERM=xterm

# Check the current system
RUN grep "VERSION\|ID" /etc/os-release

# Install system updates and dependencies
RUN apt-get -qq update \
  && DEBIAN_FRONTEND=noninteractive apt-get install --assume-yes --no-install-recommends \
  ca-certificates curl git netcat 'sudo' \
  && rm -rf /var/lib/apt/lists/*

# Execute the script
RUN update-ca-certificates \
  && git clone --single-branch --depth 1 https://github.com/bitcoin-tools/nodebuilder.git \
  && cd nodebuilder
COPY nodebuilder /opt/src/scripts/nodebuilder
RUN /bin/bash -c /opt/src/scripts/nodebuilder
