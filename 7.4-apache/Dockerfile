FROM php:7.4-apache

ENV TIMEZONE Europe/Warsaw
ENV XDEBUG_ENABLED 0
ENV APACHE_DOCUMENT_ROOT /var/www/html

COPY entrypoint.sh /entrypoint.sh
COPY errors.ini /usr/local/etc/php/conf.d/errors.ini
COPY xdebug.ini /usr/local/etc/php/conf-available/xdebug.ini

RUN a2enmod rewrite \
    && apt-get update \
    && apt-get install -y --no-install-recommends curl git libxml2-dev zlib1g-dev libicu-dev g++ libpng-dev libjpeg-dev libzip-dev \
    && usermod -u 1000 www-data \
    && docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
    && docker-php-ext-install xml mbstring pdo_mysql gd mysqli exif zip \
    && pecl install xdebug-2.7.0beta1

ENTRYPOINT ["/entrypoint.sh"]

CMD ["apache2-foreground"]
