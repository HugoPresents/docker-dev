# VERSION 0.0.1
FROM alpine
MAINTAINER Hugo Zhang<rabbitzhang52@gmail.com>

# install packages
RUN addgroup -g 82 -S www-data \
    && adduser -u 82 -D -S -G www-data www-data \
    && apk add --no-cache php7 php7-fpm php7-pdo_mysql php7-mcrypt php7-phar php7-gd php7-curl php7-mysqlnd php7-xml php7-pdo_pgsql \
    php7-pgsql php7-mbstring php7-gettext php7-json php7-dom php7-iconv php7-openssl \
    php7-session && \
    sed -E -i "s/^;daemonize = yes$/daemonize = no/" /etc/php7/php-fpm.conf && \
    sed -E -i "s/^;error_log\ =.+?$/error_log = \/proc\/self\/fd\/2/" /etc/php7/php-fpm.conf && \
    sed -E -i "s/^user\ =\ nobody$/user = www-data/" /etc/php7/php-fpm.d/www.conf && \
    sed -E -i "s/^group\ =\ nobody$/group = www-data/" /etc/php7/php-fpm.d/www.conf && \
    sed -E -i "s/^listen\ =.+?$/listen = 0.0.0.0:9000/" /etc/php7/php-fpm.d/www.conf && \
    sed -E -i "s/^pm\ =.+?$/pm = ondemand/" /etc/php7/php-fpm.d/www.conf && \
    sed -E -i "s/^pm\.max_children\ =.+?$/pm\.max_children = 2/" /etc/php7/php-fpm.d/www.conf && \
    sed -E -i "s/^;pm\.process_idle_timeout\ =.+?$/pm\.process_idle_timeout=10s/" /etc/php7/php-fpm.d/www.conf && \
    sed -E -i "s/^;catch_workers_output\ =.+?$/catch_workers_output = yes/" /etc/php7/php-fpm.d/www.conf && \
    sed -E -i "s/^post_max_size\ =.+?$/post_max_size = 100M/" /etc/php7/php.ini && \
    sed -E -i "s/^upload_max_filesize\ =.+?$/upload_max_filesize = 100M/" /etc/php7/php.ini && \
    sed -E -i "s/^display_errors\ .+?$/display_errors = On/" /etc/php7/php.ini && \
    sed -E -i "s/^error_reporting\ .+?$/error_reporting = E_ALL/" /etc/php7/php.ini && \
    ln -s /usr/bin/php7 /usr/bin/php && \
    mkdir /var/htdocs

WORKDIR /var/htdocs

EXPOSE 9000

CMD ["php-fpm7"]