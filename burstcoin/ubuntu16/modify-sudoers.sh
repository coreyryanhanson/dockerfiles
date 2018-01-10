#! /bin/bash

#Adds sudo privelages to start/stop the MariaDB service and set ownership of the database.
echo "
$docker_unprivileged_user ALL=/usr/sbin/service mysql start
$docker_unprivileged_user ALL=/usr/sbin/service mysql stop
$docker_unprivileged_user ALL=/usr/sbin/service mysql restart
$docker_unprivileged_user ALL=/bin/chown
" | sudo EDITOR='tee -a' visudo
