# VERSION 0.0.1
FROM rabbit52/ubuntu
MAINTAINER Tuzki Zhang<rabbitzhang52@gmail.com>

RUN apt-get update && \
apt-get upgrade -y && \
apt-get install -y software-properties-common && \
locale-gen en_US.UTF-8 && \
LC_ALL=en_US.UTF-8 add-apt-repository -y ppa:ondrej/php && \
apt-get update && \
apt-get dist-upgrade -y && \
apt-get install -y php7.0-common php7.0-fpm php7.0-cli php7.0-curl php7.0-mysql php7.0-mbstring php7.0-mcrypt php7.0-gd php7.0-opcache php7.0-pgsql && \
rm -rf /var/lib/apt/lists/*

# connfiguration
RUN sed -E -i "s/^listen\ =.+?$/listen = 0.0.0.0:9000/" /etc/php/7.0/fpm/pool.d/www.conf && \
sed -E -i "s/^pm\ =.+?$/pm = ondemand/" /etc/php/7.0/fpm/pool.d/www.conf && \
sed -E -i "s/^pm\.max_children\ =.+?$/pm\.max_children = 10/" /etc/php/7.0/fpm/pool.d/www.conf && \
sed -E -i "s/^;pm\.process_idle_timeout\ =.+?$/pm\.process_idle_timeout=10s/" /etc/php/7.0/fpm/pool.d/www.conf && \
sed -E -i "s/^post_max_size\ =.+?$/post_max_size = 100M/" /etc/php/7.0/fpm/php.ini && \
sed -E -i "s/^upload_max_filesize\ =.+?$/upload_max_filesize = 100M/" /etc/php/7.0/fpm/php.ini && \
sed -E -i "s/^max_execution_time\ =.+?$/max_execution_time = 3/" /etc/php/7.0/fpm/php.ini

# for development
RUN sed -E -i "s/^display_errors\ =.+?$/display_errors = On/" /etc/php/7.0/fpm/php.ini && \
sed -E -i "s/^error_reporting\ =.+?$/error_reporting = E_ALL/" /etc/php/7.0/fpm/php.ini

# project dir
RUN mkdir /run/php && \
mkdir /var/htdocs && \
chown -R www-data:www-data /var/htdocs

EXPOSE 9000

CMD php-fpm7.0 -F
