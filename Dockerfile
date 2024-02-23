# syntax=docker/dockerfile:1
FROM ubuntu:22.04
ENV TERM=xterm

# Install system updates and dependencies
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install --assume-yes git

# Execute the script
RUN git clone https://github.com/bitcoin-tools/nodebuilder.git
RUN cd nodebuilder
RUN echo 'Starting nodebuilder'
COPY nodebuilder /opt/src/scripts/nodebuilder
RUN ["/bin/bash", "-c", "/opt/src/scripts/nodebuilder"]
