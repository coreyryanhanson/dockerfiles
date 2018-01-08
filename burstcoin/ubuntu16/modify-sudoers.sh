#! /bin/bash

#Adds sudo privelages to start/stop the MariaDB service.
echo "
$docker_unprivileged_user ALL=/usr/sbin/service mysql start
$docker_unprivileged_user ALL=/usr/sbin/service mysql stop
$docker_unprivileged_user ALL=/usr/sbin/service mysql restart
" | sudo EDITOR='tee -a' visudo
