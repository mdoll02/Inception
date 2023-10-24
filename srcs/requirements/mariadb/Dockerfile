FROM debian:buster

RUN apt-get update && apt-get upgrade -y &&  \
    apt-get install mariadb-server mariadb-client -y &&  \
    apt-get clean

RUN	mkdir -p /var/lib/mysql /var/run/mysqld; \
        chown -R mysql:mysql /var/lib/mysql /var/run/mysqld; \
        chmod +x /var/run/mysqld;

COPY ./tools/init_db.sh /
COPY ./conf/my.cnf /etc/mysql/my.cnf

EXPOSE 3306

RUN chmod +x /init_db.sh

CMD ["/init_db.sh"] 