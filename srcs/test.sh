

#crear certificado
echo -e "\e[35mCrear Certificado"
mkdir /etc/nginx/ssl
openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/nginx-selfsigned.pem -keyout /etc/ssl/certs/nginx-selfsigned.key -subj "/C=ES/ST=Madrid/L=Madrid/O=42Madrid/OU=juasanto/CN=default"
echo -e "Certificado \e[32mOK\e[39m"
#crear sitio www
#mv /tmp/nginx.conf /etc/nginx/sites-available/default
#ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default
#rm -rf /etc/nginx/sites-enabled/default


#Arrancar MariaDB
echo "\e[34mArrancar MariaDB"
service mysql start
echo "MariaDB \e[32mOK\e[39m"

#Instalacion y Configuracion PHP-MyAdmin
echo "\e[36mInstalacion y Configuracion PHP-MyAdmin"
mysql < /var/www/html/phpmyadmin/sql/create_tables.sql -u root
mkdir /etc/phpmyadmin/upload -p
mkdir /etc/phpmyadmin/save
mkdir /etc/phpmyadmin/tmp
mkdir /var/www/html/phpmyadmin/tmp
chown www-data.www-data /var/www/html/phpmyadmin -R
chown www-data.www-data /etc/phpmyadmin -R
chmod 660  /etc/phpmyadmin -R
chmod 777 /var/www/html/phpmyadmin/tmp -R
echo "Instalacion y Configuracion PHP-MyAdmin \e[32mOK\e[39m"

#arrancar NGINX
echo "\e[93mArrancar NginX"
service nginx start
echo "NginX \e[32mOK\e[39m"
#Arrancar PHP
echo "\e[94mArrancar PHP"
/etc/init.d/php7.3-fpm start
echo "PHP \e[32mOK\e[39m"

#Instalacion y configuracion de WordPress
mysql < /tmp/create_wp.sql -u root


#Tail para verificar
echo "\e[96mComando Tail para ver accesos"
tail -f /var/log/nginx/access.log
