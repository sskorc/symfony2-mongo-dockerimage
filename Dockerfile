FROM php:5.6-apache

RUN apt-get update \
    && curl -sL https://deb.nodesource.com/setup | bash - \
    && apt-get install -y git libssl-dev zlib1g-dev libicu-dev g++ nodejs \
    && npm install -g grunt-cli \
    && pecl install mongo \
    && echo extension=mongo.so > /usr/local/etc/php/conf.d/mongo.ini \
    && pecl install xdebug \
    && echo zend_extension=xdebug.so > /usr/local/etc/php/conf.d/xdebug.ini \
    && pecl install apcu-beta \
    && echo extension=apcu.so > /usr/local/etc/php/conf.d/apcu.ini \
    && docker-php-ext-install zip mbstring intl

RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/bin/composer
