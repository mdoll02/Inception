FROM debian:buster

RUN apt-get update && apt-get upgrade -y &&  \
    apt-get install -y nginx openssl &&  \
    apt-get clean

COPY ./tools/init.sh /
COPY ./conf/nginx.conf /etc/nginx/sites-available/default

RUN chmod +x /init.sh

CMD ["/init.sh"]