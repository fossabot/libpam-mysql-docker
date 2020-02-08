#!/bin/bash

# Add to your k8s config. Otherwise this will run once on boot to check for connectivity.
# readinessProbe:
#   exec:
#     command:
#     - /etc/my_init.d/readinessProbe.sh
#   initialDelaySeconds: 120
#   periodSeconds: 20

if [ "$DEBUG" == "1" ]; then
  echo "DEBUG: host $MYSQL_HOST:3306 user $MYSQL_USER pass $MYSQL_PASSWORD db $MYSQL_DATABASE"
fi

# Test Authentication
username=$TEST_USERNAME
password=$TEST_PASSWORD

echo "action=test-auth user=$username status=started"

if [ "$DEBUG" == "1" ]; then
  echo "DEBUG: action=test-auth user=$username pass=$password status=started"
fi

user_id=$(mysql -h$MYSQL_HOST -P3306 -u$MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE -sN -e "select username from user where username = '$username' AND password = SHA1('$password') AND active=1")

echo "action=test-auth user=$username user_id=$user_id status=finished"

[ "$user_id" != '' ] && [ "$user_id" = "$username" ] && echo "user : $username" && echo 'authentication ok.' && exit 0 || echo 'authentication failed.'; exit 1
