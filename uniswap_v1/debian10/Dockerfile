FROM node:current-buster as gitdl
LABEL maintainer "Corey Ryan Hanson"

#Downloads the repository from github.
RUN export DEBIAN_FRONTEND=noninteractive && apt-get update && apt-get install -y \
        git \
        ca-certificates && \
  git clone https://github.com/Uniswap/uniswap-v1-interface.git && \
  cd uniswap-v1-interface && \
  git checkout 5c10a7f61d7c74606abc6eaf6cc9cf33e6964747 && \
  rm -rf /var/lib/apt/lists/*

#Begins stage 2 of image
FROM node:current-buster

ARG NB_USER="uniswap"
ARG NB_UID="25411"
ARG NB_GID="254"
ENV HOME=/home/$NB_USER

RUN export DEBIAN_FRONTEND=noninteractive && apt-get update && apt-get install -y \
        python3 \
        xsel \
        libudev-dev \
        ca-certificates && \
  rm -rf /var/lib/apt/lists/*

RUN rm -f /usr/bin/python && ln -s /usr/bin/python3 /usr/bin/python

USER $NB_UID
WORKDIR $HOME

COPY --from=gitdl /uniswap-v1-interface/ ${HOME}/uniswap-v1-interface/

RUN cd ${HOME}/uniswap-v1-interface/ && \
  yarn global add serve && \
  yarn

CMD cd uniswap-v1-interface && yarn start
