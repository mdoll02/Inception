FROM debian:buster

RUN apt-get update && apt-get upgrade -y

# Install wordpress requirements
RUN apt install php-fpm php-mysql -y
RUN apt install wget  -y

RUN apt-get clean

COPY ./tools/init.sh /
COPY ./conf/wp-config.php /

RUN chmod +x /init.sh

CMD [ "/init.sh" ]