FROM debian:buster

RUN apt-get update && apt-get upgrade -y &&  \
    apt-get install -y nginx openssl &&  \
    apt-get clean

COPY ./tools/init_ng.sh /
COPY ./conf/nginx.conf /etc/nginx/sites-available/default

RUN chmod +x /init_ng.sh

CMD ["/init_ng.sh"]