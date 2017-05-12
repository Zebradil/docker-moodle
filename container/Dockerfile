FROM alpine:edge

LABEL maintainer="German Lashevich <german.lashevich@gmail.com>" \
      org.label-schema.schema-version="1.0.0-rc.1" \
      org.label-schema.name="zebradil/docker-moodle" \
      org.label-schema.version="3.2-1" \
      org.label-schema.description="Lightweight Moodle container based on Alpine Linux" \
      org.label-schema.vcs-url="https://github.com/Zebradil/docker-moodle.git"

EXPOSE 80 443

VOLUME ["/var/moodledata"]

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
 && chown apache:apache -R /var/www/localhost/htdocs \
 && mkdir /run/apache2

RUN ln -sf /proc/self/fd/1 /var/log/apache2/access.log \
 && ln -sf /proc/self/fd/1 /var/log/apache2/error.log

COPY config-dist.php /var/www/localhost/htdocs/config.php
COPY run.sh /opt/apache2/run.sh

CMD ["/opt/apache2/run.sh"]
