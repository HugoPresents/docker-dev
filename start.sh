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
    -v $PWD/var/log:/var/log\
    -v /Users/tuzki/htdocs:/var/htdocs\
    --name php-fpm\
    --link mysql:mysql\
    php-fpm

echo "start nginx..."
docker run -d\
    -p 80:80\
    -v $PWD/etc/nginx/sites-available:/etc/nginx/sites-available\
    -v $PWD/etc/nginx/sites-enabled:/etc/nginx/sites-enabled\
    -v /Users/tuzki/htdocs:/var/htdocs\
    -v $PWD/var/log/nginx:/var/log/nginx\
    --name nginx\
    --link php-fpm:php-fpm\
    nginx
