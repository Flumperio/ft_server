chmod 775 /tmp/test.sh
service nginx start
tail -f /var/log/nginx/access.log
