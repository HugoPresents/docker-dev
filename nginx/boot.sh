#!/bin/sh
docker run -d\
    -p 8888:80\
    -v $PWD/etc/nginx/sites-available:/etc/nginx/sites-available\
    -v $PWD/etc/nginx/sites-enabled:/etc/nginx/sites-enabled\
    -v $PWD/var/htdocs:/var/htdocs\
    -v $PWD/var/log/nginx:/var/log/nginx\
    --name="nginx"\
    nginx