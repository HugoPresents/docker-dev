#!/bin/sh
docker run -d -p 3306:6666\
    -v etc/nginx/sites-available:/etc/nginx/sites-available\
    -v etc/nginx/sites-enabled:/etc/nginx/sites-enabled\
    docker_ubuntu
