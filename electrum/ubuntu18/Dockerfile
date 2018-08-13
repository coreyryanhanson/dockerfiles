FROM nvidia/opengl:1.0-glvnd-runtime-ubuntu18.04 as compile
LABEL maintainer "Corey Ryan Hanson"

#Installs git and downloads from repository.
RUN export DEBIAN_FRONTEND=noninteractive && apt-get update && apt-get install --no-install-recommends -y \
        git \
        ca-certificates && \
    rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/bitcoin-core/secp256k1.git && \
    cd secp256k1 && \
    git checkout 1e6f1f5ad5e7f1e3ef79313ec02023902bf8175c

RUN git clone https://github.com/spesmilo/electrum.git && \
    cd electrum && \
    git checkout deee29228ea31e47bc6b24167b5139e42e72a11b

#Installs dependencies.
RUN export DEBIAN_FRONTEND=noninteractive && apt-get update && apt-get install -y \
        sudo \
	imagemagick \
        qt5-default \
	libtool \
	automake \
        autotools-dev \
        build-essential \
        gcc-5 \
        g++-5 \
        python3 \
	python3-pip \
        python3-setuptools \
        python3-pyqt5 \
	pyqt5-dev-tools \
	python3-requests \
	gettext \
	protobuf-compiler && \
    rm -rf /var/lib/apt/lists/*

#Imports the script to start building.
COPY /build-secp256k1.sh /build-secp256k1.sh

#This line will allow you to execute the scripts to build ccminer.
RUN cd /secp256k1/ && chmod +x autogen.sh /build-secp256k1.sh

RUN /build-secp256k1.sh
	

RUN	cd electrum && \
	for i in lock unlock confirmed status_lagging status_disconnected status_connected_proxy status_connected status_waiting preferences; do convert -background none icons/$i.svg icons/$i.png; done && \
	pyrcc5 icons.qrc -o electrum/gui/qt/icons_rc.py && \
	protoc --proto_path=electrum --python_out=electrum electrum/paymentrequest.proto && \
	./contrib/make_locale && \
	./contrib/make_packages

#Begins stage 2 of image.
FROM nvidia/opengl:1.0-glvnd-runtime-ubuntu18.04

#Copies and makes scripts executable.
COPY create-user.sh /
RUN chmod +x create-user.sh

####

#Downloads dependencies.
RUN export DEBIAN_FRONTEND=noninteractive && apt-get update && apt-get install -y \
	ca-certificates \
        qt5-default \
	libtool \
        python3 \
	python3-pip \
        python3-setuptools \
        python3-pyqt5  && \
    rm -rf /var/lib/apt/lists/*

#Imports Electrum repo from stage 1.
COPY --from=compile /secp256k1 /secp256k1
COPY --from=compile /electrum /electrum

RUN 	cd secp256k1 && \
	make install

RUN	cd electrum && \
	pip3 install .[fast]

#Creates unprivileged user.
ARG docker_root_pass=boogiewoogiewoogie
ARG docker_unprivileged_user=electrum
ARG docker_unprivileged_pass=itselectrum
RUN /create-user.sh && \
    rm /create-user.sh

USER $docker_unprivileged_user
WORKDIR /home/$docker_unprivileged_user

CMD /usr/local/bin/electrum

