# syntax=docker/dockerfile:1
FROM ubuntu:22.04
ENV TERM=xterm

# Install dependencies
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install --assume-yes git netcat sudo

# Clone
RUN printf 'Cloning nodebuilder...\n'
RUN git clone https://github.com/bitcoin-tools/nodebuilder.git
RUN cd nodebuilder

# Execute
RUN printf 'Starting nodebuilder...\n'
COPY nodebuilder /opt/src/scripts/nodebuilder
RUN /bin/bash -c /opt/src/scripts/nodebuilder
