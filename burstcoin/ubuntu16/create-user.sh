#! /bin/bash

#Sets root password for docker container and create's a nonprivellaged user who can start MariaDB.

(echo 'wizardhorse'; echo 'wizardhorse') | passwd
useradd -ms /bin/bash burst
(echo 'yannicorn'; echo 'yannicorn') | passwd burst

echo '
burst ALL=/usr/sbin/service mysql start
burst ALL=/usr/sbin/service mysql stop
burst ALL=/usr/sbin/service mysql restart
' | sudo EDITOR='tee -a' visudo
