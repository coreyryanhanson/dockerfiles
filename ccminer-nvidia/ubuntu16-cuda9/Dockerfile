FROM nvidia/cuda:9.0-devel-ubuntu16.04 as git_checkout
LABEL maintainer "Corey Ryan Hanson"

#Git install for stage 1 of image.
RUN export DEBIAN_FRONTEND=noninteractive && apt-get update && apt-get install --no-install-recommends -y \
    git \
	  ca-certificates && \
    rm -rf /var/lib/apt/lists/*

#Clones ccminer repository. Edit out git checkout to try a later version.
RUN git clone https://github.com/tpruvot/ccminer.git && cd ccminer && git checkout b54be470e14860a1da303d3eaf34598e1e16d9af

#Begins stage 2 of image.
FROM nvidia/cuda:9.0-devel-ubuntu16.04

#This line is where the required dependencies are downloaded.
RUN export DEBIAN_FRONTEND=noninteractive && apt-get update && apt-get install --no-install-recommends -y \
        libcurl4-openssl-dev \
        libssl-dev libjansson-dev \
        automake \
        autotools-dev \
        build-essential \
        gcc-5 \
        g++-5 && \
    rm -rf /var/lib/apt/lists/*

#This line sets the ccminer compatible version of gcc as the default to build.
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 1

#Import ccminer repo from stage 1.
COPY --from=git_checkout /ccminer /ccminer

#Imports the script to start building.
COPY /install-ccminer.sh /install-ccminer.sh

#This line will allow you to execute the scripts to build ccminer.
RUN cd /ccminer/ && chmod +x build.sh autogen.sh configure.sh /install-ccminer.sh
