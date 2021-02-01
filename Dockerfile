FROM debian:buster
WORKDIR /tmp
EXPOSE 80
EXPOSE 443
ARG index_onoff

RUN apt-get -yq update
RUN apt-get -yq upgrade

#Install wget - instalacion paquetes via wwww
RUN apt-get install wget -yq

#install nginx
RUN apt-get install nginx -yq
COPY ./srcs/nginx_off.conf /tmp/nginx_off.conf
COPY ./srcs/nginx_on.conf /tmp/nginx_on.conf
RUN if [ "$index_onoff" = "1" ]; then cp /tmp/nginx_on.conf /etc/nginx/sites-available/default; else cp /tmp/nginx_off.conf /etc/nginx/sites-available/default; fi

#Install MariaDB - Version GPL de MySQL
RUN apt-get install mariadb-server mariadb-client -yq

#Install PHP
RUN apt-get install -yq php7.3-fpm php7.3-common php7.3-mysql php7.3-gmp php7.3-curl php7.3-intl php7.3-mbstring php7.3-xmlrpc php7.3-gd php7.3-xml php7.3-cli php7.3-zip php7.3-soap php7.3-imap

#Test PHP
COPY ./srcs/test.php /var/www/html/test.php
RUN chmod 755 -R /var/www/html
RUN chown www-data:www-data -R /var/www/html/

#Install PHP-MyAdmin
RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN tar -zxvf /tmp/phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN mv /tmp/phpMyAdmin-4.9.0.1-all-languages /var/www/html/phpmyadmin
COPY ./srcs/config.inc.php /var/www/html/phpmyadmin/config.inc.php
COPY ./srcs/create_tables.sql /var/www/html/phpmyadmin/sql/create_tables.sql

#Install WordPRess
RUN wget http://wordpress.org/latest.tar.gz
RUN tar -xvzf /tmp/latest.tar.gz
RUN mv /tmp/wordpress/ /var/www/html/wordpress
RUN chown -R www-data:www-data /var/www/html/wordpress/
RUN chmod 755 -R /var/www/html/wordpress/
COPY ./srcs/create_wp.sql /tmp/create_wp.sql

#test final
COPY ./srcs/test.sh /tmp/test.sh
RUN chmod 775 /tmp/test.sh
CMD /tmp/test.sh

