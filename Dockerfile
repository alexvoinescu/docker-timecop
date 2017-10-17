FROM php:7.0

MAINTAINER Alexandru Voinescu "voinescu.alex@gmail.com"

RUN apt-get update && apt-get install -y \
        libmcrypt-dev \
        libicu-dev \
        libxslt-dev \
        zlib1g-dev \
        libmemcached-dev \
        libssl-dev \
        libmagickwand-dev \
        curl \
        git \
        wget \
    && apt-get autoremove -y \
    && apt-get clean all

RUN docker-php-ext-install mcrypt
RUN docker-php-ext-install intl
RUN docker-php-ext-install mbstring
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install mysqli
RUN docker-php-ext-install pcntl
RUN docker-php-ext-install xsl
RUN docker-php-ext-install zip
RUN docker-php-ext-install soap

RUN pecl install timecop-beta

RUN echo "date.timezone=UTC" > /usr/local/etc/php/conf.d/timezone.ini
RUN echo "memory_limit=512M" > /usr/local/etc/php/conf.d/memory.ini

RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer
