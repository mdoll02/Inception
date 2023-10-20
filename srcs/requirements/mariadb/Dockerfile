FROM debian:buster

RUN apt-get update && apt-get upgrade -y &&  \
    apt-get install mariadb-server -y &&  \
    apt-get clean

RUN mkdir -p /var/run/mysqld
RUN chown -R mysql:mysql /var/run/mysqld

COPY ./tools/init.sh /
RUN rm -rf /etc/mysql/my.cnf
COPY ./conf/my.cnf /etc/

EXPOSE 3306

RUN chmod +x /init.sh

CMD ["/init.sh"]