FROM debian:stable-slim

RUN apt-get update && apt-get upgrade -y &&  \
    apt-get install mariadb-server -y &&  \
    apt-get clean

COPY ./tools/init.sh /
COPY ./tools/dbinit.sql /
COPY ./conf/50-server.cnf /etc/mysql/my.cnf

EXPOSE 3306

RUN chmod +x /init.sh
RUN chmod +x /dbinit.sql

RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld

CMD ["/init.sh"]