# VERSION 0.0.1
FROM rabbit52/ubuntu
MAINTAINER Tuzki Zhang<rabbitzhang52@gmail.com>

# install packages
RUN apt-get update && apt-get upgrade -y && apt-get install -y nginx nginx-extras

RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# php config
COPY php /etc/nginx/php
COPY php_index /etc/nginx/php_index

# phalcon config
COPY phalcon /etc/nginx/phalcon

RUN mkdir /var/htdocs
RUN chown -R www-data:www-data /var/htdocs

# access ports
EXPOSE 80 443

CMD nginx