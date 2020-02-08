#!/bin/sh

sed -i 's/MYSQL_HOST/'"$MYSQL_HOST"'/g' /etc/vpnservice-pam.conf
sed -i 's/MYSQL_USER/'"$MYSQL_USER"'/g' /etc/vpnservice-pam.conf
sed -i 's/MYSQL_PASSWORD/'"$MYSQL_PASSWORD"'/g' /etc/vpnservice-pam.conf
sed -i 's/MYSQL_DATABASE/'"$MYSQL_DATABASE"'/g' /etc/vpnservice-pam.conf

echo "Updated /etc/vpnservice-pam.conf"
