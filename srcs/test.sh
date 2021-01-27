

#crear certificado
mkdir /etc/nginx/ssl
openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/nginx-selfsigned.pem -keyout /etc/ssl/certs/nginx-selfsigned.key -subj "/C=ES/ST=Madrid/L=Madrid/O=42Madrid/OU=juasanto/CN=default"


#crear sitio www
#mv /tmp/nginx.conf /etc/nginx/sites-available/default
#ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default
#rm -rf /etc/nginx/sites-enabled/default

#arrancar NGINX
service nginx start
tail -f /var/log/nginx/access.log
