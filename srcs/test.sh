

#crear certificado
mkdir /etc/nginx/ssl
openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/nginx-selfsigned.pem -keyout /etc/ssl/certs/nginx-selfsigned.key -subj "/C=ES/ST=Madrid/L=Madrid/O=42Madrid/OU=juasanto/CN=default"

#crear sitio www
#mv /tmp/nginx.conf /etc/nginx/sites-available/default
#ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default
#rm -rf /etc/nginx/sites-enabled/default


#Arrancar MariaDB
service mysql start
#Instalacion y Configuracion PHP-MyAdmin
mysql < /var/www/html/phpmyadmin/sql/create_tables.sql -u root
mkdir /etc/phpmyadmin/upload -p
mkdir /etc/phpmyadmin/save
mkdir /etc/phpmyadmin/tmp
mkdir /var/www/html/phpmyadmin/tmp
chown www-data.www-data /var/www/html/phpmyadmin -R
chown www-data.www-data /etc/phpmyadmin -R
chmod 660  /etc/phpmyadmin -R
chmod 777 /var/www/html/phpmyadmin/tmp -R

#arrancar NGINX
service nginx start
#Arrancar PHP
/etc/init.d/php7.3-fpm start

#Tail para verificar
tail -f /var/log/nginx/access.log
