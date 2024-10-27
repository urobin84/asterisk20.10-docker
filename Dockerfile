# Dockerfile
FROM ubuntu:latest

# Set environment variables for non-interactive installation
ENV DEBIAN_FRONTEND=noninteractive

# Install required packages, including libedit-dev
RUN apt-get update && \
    apt-get install -y wget build-essential libssl-dev libncurses5-dev libnewt-dev libxml2-dev \
                       libsqlite3-dev uuid-dev curl libedit-dev libjansson-dev

# Download and install Asterisk
WORKDIR /usr/src
RUN wget https://downloads.asterisk.org/pub/telephony/asterisk/asterisk-20.10.0.tar.gz && \
    tar xvf asterisk-20.10.0.tar.gz && \
    rm asterisk-20.10.0.tar.gz && \
    cd asterisk-20.10.0 && \
    ./configure && \
    make && \
    make install && \
    make samples && \
    make config

# Expose necessary ports
EXPOSE 5060/udp 5060/tcp 5061/tcp 10000-20000/udp

# Run Asterisk in the foreground
CMD ["asterisk", "-f"]
