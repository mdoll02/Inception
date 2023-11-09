#!/bin/bash

mkdir -p /var/run/mysqld
chown -R mysql:mysql /var/lib/mysql /var/run/mysqld
chmod -R 777 /var/run/mysqld /var/lib/mysql

service mysql start

echo "CREATE DATABASE IF NOT EXISTS $DB_NAME;" > init.sql

echo "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';" >> init.sql
echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';" >> init.sql
echo "FLUSH PRIVILEGES;" >> init.sql

mysql < init.sql

service mysql stop

mysqld
