FROM nvidia/cuda:8.0-devel-ubuntu16.04
LABEL maintainer "Corey Ryan Hanson"

#This line is where the required dependencies are downloaded.
RUN export DEBIAN_FRONTEND=noninteractive && apt-get update && apt-get install -y \
        libcurl4-openssl-dev libssl-dev libjansson-dev automake autotools-dev build-essential nano gcc-5 g++-5 && \
    rm -rf /var/lib/apt/lists/*

#This line sets the ccminer compatible version of gcc as the default to build.
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 1

#This is where docker adds in the file you just downloaded and imports it as a volume in the new docker image. Make sure this line matches the file name of your download.
ADD ccminer-linux.tar.gz /

#This line will allow you to execute the scripts to build ccminer.
RUN cd /ccminer-linux/ && chmod +x build.sh && chmod +x autogen.sh && chmod +x configure.sh
