# VERSION 0.0.1
FROM rabbit52/ubuntu
MAINTAINER Tuzki Zhang<rabbitzhang52@gmail.com>

# install packages
RUN apt-get update && apt-get install -y php5-fpm php5-curl php5-mysqlnd php5-mcrypt php5-gd php5-dev

RUN sed -i "s/\/var\/run\/php5-fpm.sock/0.0.0.0:9000/" /etc/php5/fpm/pool.d/www.conf

RUN mkdir /var/htdocs
RUN chown -R www-data:www-data /var/htdocs

EXPOSE 9000

CMD php5-fpm -F