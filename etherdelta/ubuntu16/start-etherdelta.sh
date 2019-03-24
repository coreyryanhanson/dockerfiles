#! /bin/bash

#Starts EtherDelta locally within the dockerfile.

(echo $docker_unprivileged_pass) | sudo -S service apache2 start
clear
ip=$(hostname -I)

echo "Connect to etherdelta locally through
this dockerfile by putting

$ip

in the address bar of your browser.

Keep this window open

"
bash
