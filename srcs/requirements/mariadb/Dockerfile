FROM debian:buster

RUN apt-get update -y && apt-get install mariadb-server -y

RUN mkdir -p /var/run/mysqld && chown -R mysql:mysql /var/lib/mysql && chmod 777 /var/run/mysqld

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY ./tools/init_db.sh /
RUN chmod +x /init_db.sh

EXPOSE 3306

CMD ["/init_db.sh"]