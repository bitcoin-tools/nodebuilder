# syntax=docker/dockerfile:1
FROM ubuntu:22.04
ENV TERM=xterm

# Install dependencies
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install --assume-yes git libxcb-xinerama0 netcat sudo

# Execute the script
RUN git clone --single-branch --depth 1 https://github.com/bitcoin-tools/nodebuilder.git && cd nodebuilder
COPY nodebuilder /opt/src/scripts/nodebuilder
RUN /bin/bash -c /opt/src/scripts/nodebuilder
