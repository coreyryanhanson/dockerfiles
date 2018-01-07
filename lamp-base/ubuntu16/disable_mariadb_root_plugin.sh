#! /bin/bash

#Script to disable MariaDB Unix Socket.
service mysql start
mysql --user=root --host=localhost mysql<<EOF
UPDATE mysql.user SET plugin = 'mysql_native_password' WHERE user = 'root' AND plugin = 'unix_socket';
SET PASSWORD = password('wizardhorse');
FLUSH PRIVILEGES;
quit
EOF
service mysql stop
