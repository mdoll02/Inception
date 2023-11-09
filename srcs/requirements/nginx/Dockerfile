FROM debian:buster

RUN apt-get update && apt-get upgrade -y &&  \
    apt-get install -y nginx openssl &&  \
    apt-get clean

COPY ./tools/init_ng.sh /
COPY ./conf/nginx.conf /etc/nginx/sites-available/inception
RUN ln -s /etc/nginx/sites-available/inception /etc/nginx/sites-enabled/inception
RUN rm -rf /etc/nginx/sites-enabled/default /etc/nginx/sites-available/default

RUN chmod +x /init_ng.sh

CMD ["/init_ng.sh"]