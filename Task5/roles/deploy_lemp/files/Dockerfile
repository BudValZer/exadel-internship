
FROM php:7.2-fpm

RUN apt-get update && \
    apt-get install -y git zip && \
    curl --silent --show-error https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer && \
    docker-php-ext-install mysqli && docker-php-ext-enable mysqli