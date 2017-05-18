#!/bin/sh

: "${MOODLE_DB_TYPE:?Lack of env variables}"
: "${MOODLE_DB_HOST:?Lack of env variables}"
: "${MOODLE_DB_NAME:?Lack of env variables}"
: "${MOODLE_DB_USER:?Lack of env variables}"
: "${MOODLE_DB_PASS?Lack of env variables}"
: "${MOODLE_URL:?Lack of env variables}"

chown apache:apache -R /var/moodledata
exec /usr/sbin/httpd -D FOREGROUND
