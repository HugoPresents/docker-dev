#!/bin/sh
docker run -d\
    -v $PWD/var/lib/mysql:/var/lib/mysql\
    -v $PWD/var/log/mysql:/var/log/mysql\
    --name mysql\
    mysql