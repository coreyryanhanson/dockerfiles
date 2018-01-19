FROM ubuntu:16.04
LABEL maintainer "Corey Ryan Hanson"

#Installs LAMP while temporarily disabling the POLICY-RC.D Policy layer with sed.
RUN     sed -i.bak 's/exit 101/exit 0/' /usr/sbin/policy-rc.d && \
        export DEBIAN_FRONTEND=noninteractive && apt-get update && apt-get install -y --no-install-recommends \
        sudo \
        lsb-release \
        apt-transport-https \
        libx11-xcb1 \
        libgtk-3-0 \
        libasound2 \
        libcanberra-gtk-module \
        packagekit-gtk3-module \
        curl \
        ca-certificates && \
        rm -rf /var/lib/apt/lists/
RUN     curl https://s3-us-west-2.amazonaws.com/brave-apt/keys.asc | sudo apt-key add - && \
        echo "deb [arch=amd64] https://s3-us-west-2.amazonaws.com/brave-apt `lsb_release -sc` main" | sudo tee -a /etc/apt/sources.list.d/brave-`lsb_release -sc`.list && \
        export DEBIAN_FRONTEND=noninteractive && apt-get update && apt-get install -y --no-install-recommends \
        brave && \
        rm -rf /var/lib/apt/lists/*

COPY create-user.sh /
RUN chmod +x /create-user.sh

ARG docker_root_pass=null
ARG docker_unprivileged_user=null
ARG docker_unprivileged_pass=null
RUN /create-user.sh && \
    rm /create-user.sh

USER $docker_unprivileged_user
WORKDIR /home/$docker_unprivileged_user
