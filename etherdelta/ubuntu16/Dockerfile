FROM coreyhanson/lamp-base as git
LABEL maintainer "Corey Ryan Hanson"

#Git install for stage 1 of image.
RUN export DEBIAN_FRONTEND=noninteractive && apt-get update && apt-get install --no-install-recommends -y \
        git \
	ca-certificates && \
    rm -rf /var/lib/apt/lists/*

#Clones EtherDelta website repository.
RUN git clone https://github.com/etherdelta/etherdelta.github.io.git

#Begins stage 2 of image.
FROM coreyhanson/lamp-base

#imports EtherDelta pages.
COPY --from=git /etherdelta.github.io/ /var/www/etherdelta.github.io/

#Copies the startup script
COPY start-etherdelta.sh start-etherdelta.sh

#Git install for stage 1 of image.
RUN sed 's/var\/www\/html/var\/www\/etherdelta.github.io/' < /etc/apache2/sites-available/000-default.conf > /etc/apache2/sites-available/etherdelta.github.io.conf && \
    sed -i.bak '/DirectoryIndex ind/ c\
        \\tDirectoryIndex index_com.html\
        ' /etc/apache2/mods-available/dir.conf && \
    chmod +x start-etherdelta.sh && \
    a2ensite etherdelta.github.io.conf && \
    a2dissite 000-default.conf

CMD ./start-etherdelta.sh
