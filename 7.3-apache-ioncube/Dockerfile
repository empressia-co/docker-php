FROM registry.empressia.pl/docker/php:7.3-apache

RUN curl -O http://downloads3.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz \
    && tar xvfz ioncube_loaders_lin_x86-64.tar.gz \
    && mkdir -p /usr/local/ioncube \
    && cp ioncube/ioncube_loader_lin_7.1.so /usr/local/ioncube/ \
    && echo zend_extension = "/usr/local/ioncube/ioncube_loader_lin_7.1.so" > /usr/local/etc/php/conf.d/00-ioncube.ini \
    && rm ioncube_loaders_lin_x86-64.tar.gz && rm -rf ioncube_loaders_lin_x86-64
