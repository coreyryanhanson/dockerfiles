#! /bin/bash

#Script to disable MariaDB Root Plugin.
service mysql start && 
mysql -u root mysql <<EOF
update user set plugin='' where User='root';
flush privileges;
commit;
EOF
