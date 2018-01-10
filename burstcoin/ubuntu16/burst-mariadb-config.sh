#! /bin/bash

#Setup databases for Burst Wallet.
service mysql start
mysql -u root --password='' -h localhost <<EOF
  CREATE DATABASE burstwallet;
  CREATE USER 'burstwallet'@'localhost' IDENTIFIED BY '$docker_unprivileged_pass';
  GRANT ALL PRIVILEGES ON burstwallet.* TO 'burstwallet'@'localhost';
EOF
