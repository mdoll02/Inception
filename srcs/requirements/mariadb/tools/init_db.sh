#!/bin/bash

mkdir -p /var/run/mysqld
chown -R mysql:mysql /var/lib/mysql /var/run/mysqld
chmod -R 777 /var/run/mysqld /var/lib/mysql

# Start the MariaDB service
service mysql start

# Create the database
echo "CREATE DATABASE IF NOT EXISTS $DB_NAME;" > init.sql

# Create the user and grant privileges
echo "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';" >> init.sql
echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';" >> init.sql
echo "FLUSH PRIVILEGES;" >> init.sql

mysql < init.sql

# Stop the MariaDB service
service mysql stop

# Start MariaDB without binding to all interfaces
mysqld
