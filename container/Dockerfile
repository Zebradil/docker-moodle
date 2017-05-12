FROM alpine:edge

LABEL maintainer="german.lashevich@gmail.com" \
      version="1.0" \
      description=""

EXPOSE 80 443

RUN apk update \
 && apk add --no-cache \
                       git \
                       apache2 \
                       apache2-ssl \
                       php7 \
                       php7-apache2 \
                       php7-iconv \
                       php7-mysqli \
                       php7-session \
                       php7-json \
                       php7-xml \
                       php7-curl \
                       php7-zip \
                       php7-zlib \
                       php7-gd \
                       php7-dom \
                       php7-xmlreader \
                       php7-mbstring \
                       php7-openssl \
                       php7-xmlrpc \
                       php7-soap \
                       php7-intl \
                       php7-opcache \
                       php7-ctype

RUN cd /tmp \
 && git clone -b MOODLE_32_STABLE git://git.moodle.org/moodle.git --depth=1 \
 && rm -rf /var/www/localhost/htdocs \
 && mv /tmp/moodle /var/www/localhost/htdocs \
 && mkdir /var/moodledata \
 && chown apache:apache -R /var/www/localhost/htdocs /var/moodledata \
 && mkdir /run/apache2

COPY config-dist.php /var/www/localhost/htdocs/config.php

VOLUME ["/var/moodledata"]

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
