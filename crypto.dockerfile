FROM php:7.2-apache

WORKDIR /var/www/html

COPY . .

RUN apt update && apt upgrade -y
RUN apt install -y libmcrypt-dev
RUN pecl install mcrypt-1.0.1 
RUN docker-php-ext-enable mcrypt
RUN docker-php-ext-install mysqli pdo pdo_mysql
RUN echo "extension=mysqli.so" >> /usr/local/etc/php/php.ini-development
RUN echo "extension=mysqli.so" >> /usr/local/etc/php/php.ini-production
RUN cp /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini
