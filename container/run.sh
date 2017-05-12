#!/bin/sh

chown apache:apache -R /var/moodledata
tail -F /var/log/apache2/* &
exec /usr/sbin/httpd -D FOREGROUND
