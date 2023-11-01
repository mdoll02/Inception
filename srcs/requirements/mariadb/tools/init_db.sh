#!/bin/bash

# Initialize the MariaDB server
mysql_install_db --user=mysql --ldata=/var/lib/mysql || { echo "MariaDB initialization failed"; exit 1; }

# Start the MariaDB service
service mysql start || { echo "MariaDB service start failed"; exit 1; }

# Create a temporary SQL file to set the root password
cat <<EOF > /tmp/sqlfile.sql
UPDATE mysql.user SET Password=PASSWORD('$ROOT_PASSWORD') WHERE User='root';
FLUSH PRIVILEGES;
EOF

# Run SQL file to set the root password
mysql < /tmp/sqlfile.sql || { echo "Root password change failed"; exit 1; }

# Remove the temporary SQL file
rm -f /tmp/sqlfile.sql

# Create the database
echo "CREATE DATABASE IF NOT EXISTS $DB_NAME;" | mysql -u root || { echo "Database creation failed"; exit 1; }

# Create the user and grant privileges
echo "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';" | mysql -u root || { echo "User creation failed"; exit 1; }
echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';" | mysql -u root || { echo "Privilege grant failed"; exit 1; }
echo "FLUSH PRIVILEGES;" | mysql -u root || { echo "Flush privileges failed"; exit 1; }

# Stop the MariaDB service
service mysql stop || { echo "MariaDB service stop failed"; exit 1; }

# Start MariaDB without binding to all interfaces
mysqld
