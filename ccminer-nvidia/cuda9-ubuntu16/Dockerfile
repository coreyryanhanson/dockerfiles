FROM nvidia/cuda:9.0-devel-ubuntu16.04 as git_checkout
LABEL maintainer "Corey Ryan Hanson"

#Git install for stage 1 of image.
RUN export DEBIAN_FRONTEND=noninteractive && apt-get update && apt-get install -y \
        git && \
    rm -rf /var/lib/apt/lists/*

#Clones ccminer repository. Edit out git checkout to try a later version.
RUN git clone https://github.com/tpruvot/ccminer.git && cd ccminer && git checkout d0a6cb78d3602a913481ace3e012ecfe91ca08b7

#Begins stage 2 of image.
FROM nvidia/cuda:9.0-devel-ubuntu16.04

#This line is where the required dependencies are downloaded.
RUN export DEBIAN_FRONTEND=noninteractive && apt-get update && apt-get install -y \
        libcurl4-openssl-dev libssl-dev libjansson-dev automake autotools-dev build-essential nano gcc-5 g++-5 && \
    rm -rf /var/lib/apt/lists/*

#This line sets the ccminer compatible version of gcc as the default to build.
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 1

#Import ccminer repo from stage 1.
COPY --from=git_checkout /ccminer /ccminer

#This line will allow you to execute the scripts to build ccminer.
RUN cd /ccminer/ && chmod +x build.sh && chmod +x autogen.sh && chmod +x configure.sh
