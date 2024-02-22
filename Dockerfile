# syntax=docker/dockerfile:1
FROM ubuntu:22.04
ENV TERM=xterm

# Install app dependencies
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get dist-upgrade -y
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y bc git libxcb-xinerama0 netcat sudo

# Set user with sudo permissions
#RUN useradd -m docker && echo "docker:docker" | chpasswd && adduser docker sudo
#RUN pip install flask==3.0.*

# Clone the repository
RUN git clone https://github.com/bitcoin-tools/nodebuilder.git
RUN cd nodebuilder

# 
RUN echo 'Starting nodebuilder'
COPY nodebuilder /opt/src/scripts/nodebuilder
RUN ["/bin/bash", "-c", "/opt/src/scripts/nodebuilder"]
