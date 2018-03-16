FROM php:7.2-apache

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin

ENV COMPOSER_HOME /tmp/.composer
ENV WP_CLI_CACHE_DIR /tmp/.wp-cli/cache/

RUN echo 'composer() { su -p www-data -s /bin/sh -c "/usr/local/bin/composer.phar $*"; }' >> ~/.bashrc

RUN apt-get update && apt-get install -y git zip unzip zlib1g-dev gnupg \
  --no-install-recommends && rm -r /var/lib/apt/lists/*

COPY docker-php-pecl-install /usr/local/bin/docker-php-pecl-install

RUN chmod a+x /usr/local/bin/docker-php-pecl-install && rm -rf /var/www/html

COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

CMD ["/docker-entrypoint.sh"]
