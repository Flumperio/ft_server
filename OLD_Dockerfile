FROM debian:buster
WORKDIR /tmp
ENV WORDPRESS_DB_PASSWORD="01a02b03c04d"
ENV WORDPRESS_ADMIN_USER="juasanto"
ENV WORDPRESS_ADMIN_PASSWORD="01a02b03c04d"
ENV WORDPRESS_ADMIN_EMAIL="juasanto@student.42madrid.com"
ENV WORDPRESS_URL="localhost"

ENV DEBIAN_FRONTEND="noninteractive"
ENV TLS_HOSTNAME="$(echo ${WORDPRESS_URL} | cut -d'/' -f3)"
ENV NGINX_CONF_DIR="/etc/nginx"
ENV CERT_DIR="/etc/letsencrypt/live/${TLS_HOSTNAME}"
# -q quiet install.
RUN apt-get -q update
RUN apt-get -q upgrade

#install wget
RUN apt install wget -y

#install NGignX, openSSL
RUN apt-get -q -y install nginx openssl
#RUN apt-key add nginx_signing.key

#install Maria-DB server - MySQL con liencia GPL
RUN apt install mariadb-server -yq

#install PHP y PHP_MyAdmin
RUN apt install php-fpm php-mysqli -yq
#Install Extra PHP Extension for WordPress
RUN apt-get install php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip -yq
RUN wget -P /tmp https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz

#install WordPress
RUN wget -P /tmp https://wordpress.org/latest.tar.gz
COPY ./srcs/wordpress.sh /tmp

RUN chmod 775 /tmp/wordpress.sh
RUN /tmp/wordpress.sh

COPY ./srcs/nginx.conf /etc/nginx/conf.d/nginx.conf
COPY ./srcs/nginx.conf /etc/nginx/conf.d/default.conf

#https://www.nginx.com/blog/automating-installation-wordpress-with-nginx-unit-on-ubuntu/
