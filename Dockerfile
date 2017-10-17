FROM php:7.0

MAINTAINER Alexandru Voinescu "voinescu.alex@gmail.com"

RUN apt-get update && apt-get install -y \
        unzip \
        wget \
    && apt-get autoremove -y \
    && apt-get clean all


RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install mysqli
RUN docker-php-ext-install pcntl

RUN wget https://github.com/hnw/php-timecop/archive/master.zip \
    && unzip master.zip \
    && mv php-timecop-master $(php-config --extension-dir) \
    && docker-php-ext-install php-timecop

RUN echo "memory_limit=512M" > /usr/local/etc/php/conf.d/memory.ini
