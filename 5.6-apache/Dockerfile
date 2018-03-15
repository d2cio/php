FROM php:5.6-apache

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin

RUN useradd -g www-data -u 1000 -ms /bin/bash deploy

ENV COMPOSER_HOME /home/deploy/.composer

RUN echo 'function composer() { su -p deploy -c "/usr/local/bin/composer.phar $*"; }' >> ~/.bashrc

RUN apt-get update && apt-get install -y git zip unzip zlib1g-dev gnupg \
  --no-install-recommends && rm -r /var/lib/apt/lists/*

COPY docker-php-pecl-install /usr/local/bin/docker-php-pecl-install

RUN chmod a+x /usr/local/bin/docker-php-pecl-install && rm -rf /var/www/html

COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

CMD ["/docker-entrypoint.sh"]
