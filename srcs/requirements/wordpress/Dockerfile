FROM debian:buster

RUN apt-get update && apt-get upgrade -y

# Install wordpress requirements
RUN apt install php-fpm php-mysql -y
RUN apt install wget  -y

RUN apt-get clean

COPY ./conf/init.sh /
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

RUN chmod +x /init.sh

CMD [ "/init.sh" ]