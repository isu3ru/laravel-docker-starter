FROM php:8.2.3-apache
WORKDIR /var/www/html

# Mod Rewrite
RUN a2enmod rewrite

RUN apt update -y && apt install -y libicu-dev unzip zip

# composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN docker-php-ext-install gettext intl pdo_mysql
