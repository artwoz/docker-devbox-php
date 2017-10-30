FROM php:7.1-apache

MAINTAINER Artur Woźniczak <artur@wozniczak.pl>

ARG user_id
ARG group_id
ARG dev_host_ip

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get update && apt-get install -y \
    git \
    zip \
    unzip \
    nodejs \
    ruby \
    ruby-dev

RUN gem update --system \
    && gem install sass \
    && npm install --global gulp-cli

COPY ./dev-local.conf /etc/apache2/sites-enabled/
COPY ./xdebug.ini /usr/local/etc/php/conf.d/
COPY ./php.ini /usr/local/etc/php/

RUN docker-php-ext-install pdo_mysql \
    && docker-php-ext-install json \
    && pecl install xdebug \
    && echo "xdebug.remote_host=$dev_host_ip" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "zend_extension="$(find / -name xdebug.so) >> /usr/local/etc/php/conf.d/xdebug.ini \
    && docker-php-ext-enable xdebug \
    && a2enmod vhost_alias \
    && a2enmod rewrite \
    && /etc/init.d/apache2 restart

RUN curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony \
    && chmod a+x /usr/local/bin/symfony \
    && curl -LsS https://getcomposer.org/composer.phar -o /usr/local/bin/composer \
    && chmod a+x /usr/local/bin/composer \
    && curl -LsS https://phar.phpunit.de/phpunit.phar -o /usr/local/bin/phpunit \
    && chmod a+x /usr/local/bin/phpunit

RUN usermod -u "$user_id" www-data \
    && groupmod -g "$group_id" www-data \
    && usermod -d /var/www/html www-data