FROM coreyhanson/ccminer-nvidia:cuda9-src as compile
LABEL maintainer "Corey Ryan Hanson"

#Builds ccminer.
RUN /build-ccminer.sh

#Begins stage 2 of image.
FROM nvidia/cuda:9.0-runtime-ubuntu16.04

#Copies built executable and script to define the nonroot user.
COPY --from=compile /ccminer/ccminer /usr/local/bin/
COPY create-user.sh /

#This line is where the required dependencies are downloaded.
RUN export DEBIAN_FRONTEND=noninteractive && apt-get update && apt-get install --no-install-recommends -y \
        libcurl3 \
      	libjansson4 \
        libgomp1 && \
    chmod +x /create-user.sh && \
    rm -rf /var/lib/apt/lists/*

#Creates unprivileged user.
ARG docker_root_pass=fannieearl
ARG docker_unprivileged_user=ccminer
ARG docker_unprivileged_pass=zulway
RUN /create-user.sh && \
    rm /create-user.sh

USER $docker_unprivileged_user
WORKDIR /home/$docker_unprivileged_user
