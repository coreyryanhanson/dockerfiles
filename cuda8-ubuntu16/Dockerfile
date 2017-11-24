FROM nvidia/cuda:8.0-devel-ubuntu16.04
LABEL maintainer "Corey Ryan Hanson"

RUN export DEBIAN_FRONTEND=noninteractive && apt-get update && apt-get install -y \
        libcurl4-openssl-dev libssl-dev libjansson-dev automake autotools-dev build-essential nano gcc-5 g++-5 && \
    rm -rf /var/lib/apt/lists/*

RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 1

ADD ccminer-linux.tar.gz /

RUN cd /ccminer-linux/ && chmod +x build.sh && chmod +x autogen.sh && chmod +x configure.sh
