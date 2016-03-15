# VERSION 0.0.1
FROM rabbit52/ubuntu
MAINTAINER Tuzki Zhang<rabbitzhang52@gmail.com>

# install packages
RUN apt-get update && \
apt-get upgrade -y && \
apt-get install -y software-properties-common && \
apt-add-repository -y ppa:nginx/stable && \
apt-get update && \
apt-get install -y nginx nginx-extras && \
rm -rf /var/lib/apt/lists/*

RUN echo "daemon off;" >> /etc/nginx/nginx.conf && \
mkdir /etc/nginx/includes && \
mkdir /var/htdocs && \
chown -R www-data:www-data /var/htdocs

# access ports
EXPOSE 80 443

CMD nginx