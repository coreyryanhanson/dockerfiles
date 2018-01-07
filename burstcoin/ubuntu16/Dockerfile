FROM coreyhanson/lamp-base as unzip
LABEL maintainer "Corey Ryan Hanson"

#Downloads the repository script and makes executable.
RUN export DEBIAN_FRONTEND=noninteractive && apt-get update && apt-get install -y \
        wget \
        unzip && \
  wget https://github.com/PoC-Consortium/burstcoin/releases/download/1.3.6cg/burstcoin-1.3.6cg.zip && \
	mkdir burst-wallet && \
	cd burst-wallet && \
	unzip /burstcoin-1.3.6cg.zip && \
  rm /burstcoin-1.3.6cg.zip && \
	chmod +x burst.sh

#Begins stage 2 of image.
FROM coreyhanson/lamp-base

#Installs Burst Wallet dependencies.
RUN export DEBIAN_FRONTEND=noninteractive && apt-get update && apt-get install -y \
        default-jre && \
    rm -rf /var/lib/apt/lists/*

#Copies setup scripts
COPY burst_maria_db_config.sh /
COPY create-user.sh /
RUN chmod +x /burst_maria_db_config.sh create-user.sh

#Configures MariaDB with database for Burst Wallet.
RUN /burst_maria_db_config.sh && \
    rm /burst_maria_db_config.sh

#Import burst repo from stage 1.
COPY --from=unzip /burst-wallet /opt/burst-wallet
COPY nxt.properties /opt/burst-wallet/conf/nxt.properties

#Changes to unprivelaged user
RUN /create-user.sh && \
    rm /create-user.sh
USER burst
WORKDIR /home/burst
