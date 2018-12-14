FROM php:7.1-apache

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin && ln -s /usr/local/bin/composer.phar /usr/local/bin/composer

ENV COMPOSER_HOME /tmp/.composer
ENV WP_CLI_CACHE_DIR /tmp/.wp-cli/cache/
ENV COMPOSER_NO_INTERACTION=1

RUN apt-get update && apt-get install -y git zip unzip zlib1g-dev gnupg dirmngr libcap2-bin \
  --no-install-recommends && rm -r /var/lib/apt/lists/*

RUN apt-key adv --no-tty --keyserver keyserver.ubuntu.com --recv-keys 1397BC53640DB551
RUN curl https://dl-ssl.google.com/dl/linux/direct/mod-pagespeed-stable_current_amd64.deb -o mod-pagespeed.deb && dpkg -i mod-pagespeed.deb && apt-get --yes --fix-broken install
RUN a2enmod rewrite pagespeed

COPY docker-php-pecl-install /usr/local/bin/docker-php-pecl-install

RUN chmod a+x /usr/local/bin/docker-php-pecl-install && rm -rf /var/www/html

COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

CMD ["/docker-entrypoint.sh"]
