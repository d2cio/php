#!/bin/bash

echo "Sourcing Apache env vars"
source /etc/apache2/envvars
echo "Apply $APACHE_RUN_USER:$APACHE_RUN_GROUP ownership to /var/www directory tree"
chown -R "$APACHE_RUN_USER:$APACHE_RUN_GROUP" /var/www

echo "Starting Apache"
exec apache2-foreground
