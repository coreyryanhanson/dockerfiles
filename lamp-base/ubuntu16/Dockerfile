FROM ubuntu:16.04
LABEL maintainer "Corey Ryan Hanson"

#Installs LAMP. MYSQL root password=wizardhorse
RUN echo "mariadb-server mysql-server/root_password password wizardhorse" | debconf-set-selections && \
    echo "mariadb-server mysql-server/root_password_again password wizardhorse" | debconf-set-selections && \
    export DEBIAN_FRONTEND=noninteractive && apt-get update && apt-get install --no-install-recommends -y \
        apache2 \
        mariadb-server \
        php7.0 \
        libapache2-mod-php7.0 \
        php7.0-mysql \
        php7.0-curl \
        php7.0-json \
        php7.0-cgi && \
    rm -rf /var/lib/apt/lists/* && \
    echo PURGE | debconf-communicate mariadb-server
