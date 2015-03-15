#!/bin/sh
docker run -d\
    -p 8888:80\
    -v $(pwd)/etc/nginx/sites-available:/etc/nginx/sites-available\
    -v $(pwd)/etc/nginx/sites-enabled:/etc/nginx/sites-enabled\
    -v $(pwd)/var/htdocs:/var/htdocs\
    -v $(pwd)/var/log/nginx:/var/log/nginx\
    docker_ubuntu
