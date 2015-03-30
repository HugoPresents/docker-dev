#!/bin/sh
echo "start mysql..."
docker run -d\
    -p 3306:3306\
    -v $PWD/var/lib/mysql:/var/lib/mysql\
    -v $PWD/var/log/mysql:/var/log/mysql\
    --name mysql\
    mysql

echo "start php-fpm..."
docker run -d\
    -p 9000:9000\
    -v $PWD/var/log:/var/log\
    -v ~/htdocs:/var/htdocs\
    -v $PWD/usr/local/bin:/usr/local/bin\
    --name php-fpm\
    --link mysql:mysql\
    php-fpm

echo "start nginx..."
docker run -d\
    -p 80:80\
    -v $PWD/etc/nginx/conf.d:/etc/nginx/conf.d\
    -v $PWD/etc/nginx/includes:/etc/nginx/includes\
    -v $PWD/etc/nginx/sites-available:/etc/nginx/sites-available\
    -v $PWD/etc/nginx/sites-enabled:/etc/nginx/sites-enabled\
    -v ~/htdocs:/var/htdocs\
    -v $PWD/var/log/nginx:/var/log/nginx\
    --name nginx\
    nginx
