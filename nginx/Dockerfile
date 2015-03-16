# VERSION 0.0.1
FROM rabbit52/ubuntu
MAINTAINER Tuzki Zhang<rabbitzhang52@gmail.com>

# install packages
RUN apt-get install -y nginx
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

RUN mkdir /var/htdocs
RUN chown -R www-data:www-data /var/htdocs
# define volumes
VOLUME ["/etc/nginx/sites-available", "/etc/nginx/sites-enabled", "/var/log/nginx", "/var/htdocs"]

# access ports
EXPOSE 80 443

CMD nginx