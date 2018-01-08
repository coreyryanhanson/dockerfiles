#! /bin/bash

#Adds sudo privelages to start/stop the Apache service.
echo "
$docker_unprivileged_user ALL=/usr/sbin/service apache2 start
$docker_unprivileged_user ALL=/usr/sbin/service apache2 stop
$docker_unprivileged_user ALL=/usr/sbin/service apache2 restart
" | sudo EDITOR='tee -a' visudo
