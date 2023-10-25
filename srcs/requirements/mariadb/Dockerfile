FROM debian:buster

#Install necessary package

RUN apt-get update && apt-get upgrade && apt-get -y install mariadb-server mariadb-client && apt-get clean && rm -rf /var/lib/apt/lists/* \
# recreate and take ownership 
&& mkdir -p /var/run/mysqld \
&& chown -R mysql:mysql /var/run/mysqld \
# ensure that is writable regardless
&& chmod 777 /var/run/mysqld

EXPOSE 3306

COPY ./tools/init_db.sh /usr/local/bin/
COPY ./conf/wordpress.sql /usr/local/bin/

RUN chmod +x /usr/local/bin/init_db.sh

ENTRYPOINT ["init_db.sh"]

CMD ["mysqld", "--bind-address=0.0.0.0"]