FROM php:5.6-fpm

ENV PHP_EXTRA_CONFIGURE_ARGS --enable-fpm --with-fpm-user=root --with-fpm-group=root

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin && ln -s /usr/local/bin/composer.phar /usr/local/bin/composer

ENV COMPOSER_NO_INTERACTION=1
ENV COMPOSER_ALLOW_SUPERUSER=1

RUN apt-get update && apt-get install -y git zip unzip zlib1g-dev gnupg libgmp-dev libgmp3-dev libmagickwand-dev \
  libldap2-dev libxslt-dev libpq-dev libxml2-dev libmcrypt-dev libbz2-dev freetds-dev libsnmp-dev \
  snmp firebird-dev libtidy-dev unixodbc-dev libwebp-dev libfreetype6-dev libgif-dev libpng-dev \
  libjpeg-dev libjpeg62-turbo-dev libzip-dev libicu-dev libc-client-dev libkrb5-dev libssl-dev \
  --no-install-recommends && rm -r /var/lib/apt/lists/*

COPY docker-php-pecl-install /usr/local/bin/docker-php-pecl-install

RUN ln -s /usr/include/x86_64-linux-gnu/gmp.h /usr/include/gmp.h && docker-php-ext-configure gmp --with-gmp=lib/x86_64-linux-gnu
RUN docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu
RUN docker-php-ext-configure pdo_dblib --with-libdir=lib/x86_64-linux-gnu
RUN docker-php-ext-configure pdo_odbc --with-pdo-odbc=unixodbc,/usr
RUN docker-php-ext-configure gd --with-webp-dir=/usr --with-png-dir=/usr --with-jpeg-dir=/usr --with-freetype-dir=/usr
RUN docker-php-ext-configure zip --with-libzip --with-libdir=lib/x86_64-linux-gnu
RUN docker-php-ext-configure imap --with-imap-ssl --with-kerberos
RUN docker-php-ext-install gmp ldap xsl mysql pgsql soap pdo_mysql gettext pcntl mcrypt bz2 mysqli opcache pdo_dblib snmp dba interbase tidy pdo_odbc gd zip exif sockets pdo_pgsql intl xmlrpc imap pdo_firebird bcmath calendar

RUN chmod a+x /usr/local/bin/docker-php-pecl-install && rm -rf /var/www/html
RUN docker-php-pecl-install imagick mongodb trader

CMD ["php-fpm","-R"]
