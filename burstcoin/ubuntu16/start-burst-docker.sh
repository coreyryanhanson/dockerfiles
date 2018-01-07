#! /bin/bash

(echo $docker_unprivileged_pass) | sudo -S service mysql start

#Work in progress alternate of using environment variables instead of --net=host flag when container is started.
#echo "# Hosts from which to allow http/json API requests, if enabled.
#nxt.allowedBotHosts=127.0.0.1; localhost; $host_machine_ip_address; [0:0:0:0:0:0:0:1];" >> /opt/burst-wallet/conf/nxt.properties

#Starts burst.
cd /opt/burst-wallet/
./burst.sh
/bin/bash
