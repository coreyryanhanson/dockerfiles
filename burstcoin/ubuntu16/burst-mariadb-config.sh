#! /bin/bash

#Setup databases for Burst Wallet.
service mysql start
mysql -u root --password='' -h localhost <<EOF
  CREATE DATABASE brs_master;
  CREATE USER 'brs_user'@'localhost' IDENTIFIED BY '$docker_unprivileged_pass';
  GRANT ALL PRIVILEGES ON brs_master.* TO 'brs_user'@'localhost';
EOF
