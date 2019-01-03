FROM php:5.6-apache

ENV TIMEZONE Europe/Warsaw
ENV XDEBUG_ENABLED 0
ENV APACHE_DOCUMENT_ROOT /var/www/html

COPY entrypoint.sh /entrypoint.sh
COPY errors.ini /usr/local/etc/php/conf.d/errors.ini
COPY xdebug.ini /usr/local/etc/php/conf-available/xdebug.ini

RUN a2enmod rewrite \
    && apt-get update \
    && apt-get install -y --no-install-recommends curl git libxml2-dev zlib1g-dev libicu-dev g++ libpng-dev libjpeg-dev \
    && usermod -u 1000 www-data \
    && docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
    && docker-php-ext-install xml mbstring pdo_mysql gd zip mysqli exif \
    && pecl install xdebug-2.5.5

ENTRYPOINT ["/entrypoint.sh"]

VOLUME /var/www/html

CMD ["apache2-foreground"]
