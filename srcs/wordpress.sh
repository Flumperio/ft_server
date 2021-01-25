ENV WORDPRESS_DB_PASSWORD="01a02b03c04d"
ENV WORDPRESS_ADMIN_USER="juasanto"
ENV WORDPRESS_ADMIN_PASSWORD="01a02b03c04d"
ENV WORDPRESS_ADMIN_EMAIL="juasanto@student.42madrid.com"
ENV WORDPRESS_URL="localhost"

ENV DEBIAN_FRONTEND="noninteractive"
ENV TLS_HOSTNAME="$(echo ${WORDPRESS_URL} | cut -d'/' -f3)"
ENV NGINX_CONF_DIR="/etc/nginx"
ENV CERT_DIR="/etc/letsencrypt/live/${TLS_HOSTNAME}"


tar -xvzf latest.tar.gz
mv wordpress/ /var/www/html/
chown -R www-data:www-data /var/www/html/wordpress/
chmod 755 -R /var/www/html/wordpress/

# Change the hostname to be the same as the WordPress hostname
if [ ! "$(hostname)" == "${TLS_HOSTNAME}" ]; then
  echo "▶ Changing hostname to ${TLS_HOSTNAME}"
  hostnamectl set-hostname "${TLS_HOSTNAME}"
fi
