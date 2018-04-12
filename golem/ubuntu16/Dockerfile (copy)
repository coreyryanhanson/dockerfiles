FROM coreyhanson/docker-ubuntu:cuda9-rt as compile
LABEL maintainer "Corey Ryan Hanson"

#Installs dependencies.
RUN export DEBIAN_FRONTEND=noninteractive && apt-get update && apt-get install -y \
        sudo \
        ca-certificates \
        libx11-xcb1 \
        libdbus-1-3 \
        libxtst6 \
        libcanberra-gtk-module \
        packagekit-gtk3-module \
        python3 \
        wget && \
    rm -rf /var/lib/apt/lists/*

RUN wget https://raw.githubusercontent.com/golemfactory/golem/develop/Installer/Installer_Linux/install.sh && \
    chmod +x install.sh && \
    sed -i -e 's;service --status-all 2>&1 | grep -F;find /usr/local/bin -name;' \
        -e "s;apt-cache madison docker-ce 2>/dev/null | head -1 | awk '{print $3}');docker --version 2>/dev/null | awk -F'[, \t]*' '{print $3}');" \
    /install.sh

RUN /install.sh


ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8


#apt-cache madison docker-ce 2>/dev/null | head -1 | awk '{print $3}'
#docker_version="$(docker --version 2>/dev/null | awk -F'[, \t]*' '{print $3}')-0~ubuntu"
