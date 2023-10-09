FROM debian:stable-slim

RUN apt-get update && apt-get upgrade -y &&  \
    apt-get install mariadb-server -y &&  \
    apt-get clean

COPY ./tools/init.sh /

RUN chmod +x /init.sh

CMD ["/init.sh"]