# syntax=docker/dockerfile:1
# Ubuntu is known for its popularity and user-friendly design.
# This Dockerfile offers a balance between stability, security, and modernity.
FROM ubuntu:22.04@sha256:77906da86b60585ce12215807090eb327e7386c8fafb5402369e421f44eff17e
ENV TERM=xterm

# Define the dependencies URL
ARG DEPENDENCIES_URL=https://github.com/bitcoin-tools/nodebuilder/raw/master/dependencies.txt

# Check the current system
RUN grep "VERSION\|ID" /etc/os-release

# Install system updates and dependencies
RUN apt-get -qq update \
  && DEBIAN_FRONTEND=noninteractive apt-get install --assume-yes --no-install-recommends \
  ca-certificates curl netcat 'sudo' \
  && curl --fail --silent --show-error --location "${DEPENDENCIES_URL}" \
  | DEBIAN_FRONTEND=noninteractive xargs apt-get -qq install --no-install-recommends \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# Download and execute the script
RUN /bin/bash -c "$(curl -fsSL https://github.com/bitcoin-tools/nodebuilder/raw/master/nodebuilder)"
