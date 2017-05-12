#!/bin/sh

chown apache:apache -R /var/moodledata
exec /usr/sbin/httpd -D FOREGROUND
