#!/usr/bin/env bash

if [[ ! -z ${XDEBUG_ENABLED} ]] && [[ ${#XDEBUG_ENABLED} -gt 0 ]] && [[ ${XDEBUG_ENABLED} != "false" ]] && [[ ${XDEBUG_ENABLED} != "0" ]]; then
  ln -sf /usr/local/etc/php/conf-available/xdebug.ini /usr/local/etc/php/conf.d/20-xdebug.ini
  docker-php-ext-enable xdebug
else
  if [[ $(find /usr/local/etc/php/conf.d | grep -c "xdebug.ini") -gt 0 ]]; then
    rm /usr/local/etc/php/conf.d/*-xdebug.ini
  fi
fi

sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf \
    && sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

echo ${TIMEZONE} > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata \
    && echo 'date.timezone=${TIMEZONE}' >> /usr/local/etc/php/php.ini

exec docker-php-entrypoint "$@"
