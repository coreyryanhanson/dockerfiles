FROM ubuntu:16.04
LABEL maintainer "Corey Ryan Hanson"

#Installs LAMP while temporarily disabling the POLICY-RC.D Policy layer with sed.
RUN     sed -i.bak 's/exit 101/exit 0/' /usr/sbin/policy-rc.d && \
        export DEBIAN_FRONTEND=noninteractive && apt-get update && apt-get install -y --no-install-recommends \
        apache2 \
        mariadb-server \
        php7.0 \
        libapache2-mod-php7.0 \
        php7.0-mysql \
        php7.0-curl \
        php7.0-json \
        php7.0-cgi && \
    sed -i.bak 's/exit 0/exit 101/' /usr/sbin/policy-rc.d && \
    rm -rf /var/lib/apt/lists/*

#Disables MariaDB Unix Socket reverting to the traditional username/password login to login to root. Password is not set here so be sure to add one if you use this image.
COPY disable_mariadb_root_plugin.sh /
RUN chmod +x disable_mariadb_root_plugin.sh
RUN ./disable_mariadb_root_plugin.sh
