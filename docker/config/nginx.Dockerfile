FROM nginx

ADD ./docker/config/nginx-conf.d /etc/nginx/conf.d/

WORKDIR /var/www/html
