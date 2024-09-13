FROM php:8.1-apache

RUN apt-get update && apt-get install -y \
    wget \
    libgmp-dev \
    libc-client-dev \
    libkrb5-dev \
    libpng-dev \
    libjpeg-dev \
    libicu-dev \
    libonig-dev \
    libxml2-dev \
    openssl \
    libssl-dev \
    libfreetype6-dev 

RUN docker-php-ext-configure imap --with-kerberos --with-imap-ssl
RUN docker-php-ext-configure gd --with-freetype --with-jpeg
RUN docker-php-ext-install pdo pdo_mysql imap gd bcmath fileinfo gmp iconv intl mbstring xml

CMD ["apachectl", "-D","FOREGROUND"]


