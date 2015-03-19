#!/bin/sh
docker run -d\
    -v $PWD/var/log:/var/log\
    -v $PWD/../nginx/var/htdocs:/var/htdocs\
    --name php-fpm\
    php-fpm