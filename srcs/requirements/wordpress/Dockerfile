FROM debian:buster

RUN apt-get update && apt-get upgrade -y

# Install wordpress requirements
RUN apt install -y \
php-fpm \
php-mysql \
php \
php-cgi \
php-mysql \
php-fpm \
php-pdo \
php-gd php-cli \
php-mbstring

RUN apt install wget  -y

RUN apt-get clean

RUN rm -rf /etc/php/7.3/fpm/pool.d/www.conf

COPY ./init.sh /
COPY ./www.conf /etc/php/7.3/fpm/pool.d/

RUN chmod +x /init.sh

EXPOSE 9000

CMD [ "/init.sh" ]