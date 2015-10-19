automated build at [docker hub](https://registry.hub.docker.com/u/rabbit52/ubuntu/)

## feature

- replace with sohu repository
- change timezone to Asia/Chongqing
- install curl

for Chinese Developer

## images

`images` directory is some images based on this image like `nginx`, `php-fpm`

## usage
- executable under root directory are boot container which as name is, such as `redis`, `postgres`
- `make` command for build images
- `docker-compose up` start nginx, mysql and php-fpm
- empty directories are container depended volumes dir