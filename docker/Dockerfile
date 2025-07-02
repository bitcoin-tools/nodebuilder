# syntax=docker/dockerfile:1
# Ubuntu is known for its popularity and user-friendly design.
# This Dockerfile offers a balance between stability, security, and modernity.
FROM ubuntu:latest@sha256:440dcf6a5640b2ae5c77724e68787a906afb8ddee98bf86db94eea8528c2c076

# Set the terminal type to Xterm.
ENV TERM=xterm

# Define the default version of nodebuilder or pass in a different version (eg master) as an argument.
ARG NODEBUILDER_VERSION=v1.10.0

# Define the nodebuilder URL.
ARG NODEBUILDER_URL=https://github.com/bitcoin-tools/nodebuilder/raw/${NODEBUILDER_VERSION}/nodebuilder

# Check the current environment.
RUN uname -a \
  && cat /etc/os-release \
  && df -h \
  && grep Mem /proc/meminfo \
  && date -u

# Install system updates and dependencies.
RUN apt-get -qq update \
  && DEBIAN_FRONTEND=noninteractive apt-get install --assume-yes --no-install-recommends \
  ca-certificates curl 'sudo' \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# Download and execute the script.
RUN /bin/sh -c "$(curl -fsSL ${NODEBUILDER_URL} )"
