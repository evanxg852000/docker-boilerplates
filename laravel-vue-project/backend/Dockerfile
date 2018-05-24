FROM php:7.2-fpm

LABEL maintainer="Evance Soumaoro <evanxg852000@gmail.com>"

#
#--------------------------------------------------------------------------
# Software's Installation
#--------------------------------------------------------------------------
#
# Installing tools and PHP extentions using "apt", "docker-php", "pecl",
#

# Install "curl", "libmemcached-dev", "libpq-dev", "libjpeg-dev",
#         "libpng-dev", "libfreetype6-dev", "libssl-dev", "libmcrypt-dev",
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    curl \
    libmemcached-dev \
    libz-dev \
    libpq-dev \
    libjpeg-dev \
    libpng-dev \
    libfreetype6-dev \
    libssl-dev \
    libmcrypt-dev \
  && rm -rf /var/lib/apt/lists/*
 
RUN docker-php-ext-install pdo_mysql \
  && docker-php-ext-install pdo_pgsql \
  && docker-php-ext-configure gd \
  --enable-gd-native-ttf \
  --with-jpeg-dir=/usr/lib \
  --with-freetype-dir=/usr/include/freetype2 \
  && docker-php-ext-install gd


#
#--------------------------------------------------------------------------
# Optional Software's Installation
#--------------------------------------------------------------------------
#

ARG INSTALL_SOAP=true
ARG INSTALL_PGSQL=true
ARG INSTALL_PG_CLIENT=true
ARG INSTALL_XDEBUG=true
ARG INSTALL_PHPREDIS=false
ARG INSTALL_SWOOLE=true
ARG INSTALL_MONGO=true
ARG INSTALL_AMQP=true
ARG INSTALL_ZIP_ARCHIVE=true
ARG INSTALL_BCMATH=true
ARG INSTALL_GMP=false
ARG INSTALL_MEMCACHED=true
ARG INSTALL_EXIF=true
ARG INSTALL_OPCACHE=true
ARG INSTALL_MYSQLI=true
ARG INSTALL_TOKENIZER=true
ARG INSTALL_INTL=true
ARG INSTALL_GHOSTSCRIPT=true
ARG INSTALL_LDAP=true
ARG INSTALL_MSSQL=false
ARG INSTALL_IMAGE_OPTIMIZERS=true
ARG INSTALL_IMAGEMAGICK=true
ARG INSTALL_IMAP=true

#####################################
# SOAP:
#####################################
RUN if [ ${INSTALL_SOAP} = true ]; then \
    rm /etc/apt/preferences.d/no-debian-php && \
    apt-get update -yqq && \
    apt-get -y install libxml2-dev php-soap && \
    docker-php-ext-install soap \
;fi

#####################################
# Install the pgsql extension
#####################################
RUN if [ ${INSTALL_PGSQL} = true ]; then \
    docker-php-ext-install pgsql \
;fi

#####################################
# Install the pgsql client
#####################################
RUN if [ ${INSTALL_PG_CLIENT} = true ]; then \
    mkdir -p /usr/share/man/man1 && \
    mkdir -p /usr/share/man/man7 && \
    apt-get install -y postgresql-client \
;fi

#####################################
# Install the xdebug extension
#####################################
RUN if [ ${INSTALL_XDEBUG} = true ]; then \
    pecl install xdebug && \
    docker-php-ext-enable xdebug \
;fi

# Copy xdebug configuration for remote debugging
COPY ./docker/php/xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini

#####################################
# PHP Redis Extension
#####################################
RUN if [ ${INSTALL_PHPREDIS} = true ]; then \
    printf "\n" | pecl install -o -f redis \
    &&  rm -rf /tmp/pear \
    &&  docker-php-ext-enable redis \
;fi


#####################################
# PHP Swoole Extension
#####################################
RUN if [ ${INSTALL_SWOOLE} = true ]; then \
    pecl install swoole \
    &&  docker-php-ext-enable swoole \
;fi

#####################################
# PHP MongoDB Extension
#####################################
RUN if [ ${INSTALL_MONGO} = true ]; then \
    pecl install mongodb && \
    docker-php-ext-enable mongodb \
;fi

###########################################################################
# PHP AMQP Extension
###########################################################################
RUN if [ ${INSTALL_AMQP} = true ]; then \
    apt-get install librabbitmq-dev -y && \
    pecl install amqp && \
    docker-php-ext-enable amqp \
;fi

#####################################
# PHP ZipArchive Extension
#####################################
RUN if [ ${INSTALL_ZIP_ARCHIVE} = true ]; then \
    docker-php-ext-install zip \
;fi

#####################################
# PHP Bcmath Extension
#####################################
RUN if [ ${INSTALL_BCMATH} = true ]; then \
    docker-php-ext-install bcmath \
;fi

###########################################################################
# PHP GMP (GNU Multiple Precision) Extension
###########################################################################
RUN if [ ${INSTALL_GMP} = true ]; then \
	apt-get install -y libgmp-dev && \
    docker-php-ext-install gmp \
;fi

#####################################
# PHP Memcached Extension
#####################################
RUN if [ ${INSTALL_MEMCACHED} = true ]; then \
    curl -L -o /tmp/memcached.tar.gz "https://github.com/php-memcached-dev/php-memcached/archive/php7.tar.gz" \
    && mkdir -p memcached \
    && tar -C memcached -zxvf /tmp/memcached.tar.gz --strip 1 \
    && ( \
        cd memcached \
        && phpize \
        && ./configure \
        && make -j$(nproc) \
        && make install \
    ) \
    && rm -r memcached \
    && rm /tmp/memcached.tar.gz \
    && docker-php-ext-enable memcached \
;fi

#####################################
# PHP Exif Extension
#####################################
RUN if [ ${INSTALL_EXIF} = true ]; then \
   docker-php-ext-install exif \
;fi

#####################################
# PHP Opcache Extension
#####################################
RUN if [ ${INSTALL_OPCACHE} = true ]; then \
    docker-php-ext-install opcache \
;fi

# Copy opcache configration
COPY ./docker/php/opcache.ini /usr/local/etc/php/conf.d/opcache.ini

#####################################
# Mysqli Modifications:
#####################################
RUN if [ ${INSTALL_MYSQLI} = true ]; then \
    docker-php-ext-install mysqli \
;fi

#####################################
# Tokenizer Modifications:
#####################################
RUN if [ ${INSTALL_TOKENIZER} = true ]; then \
    docker-php-ext-install tokenizer \
;fi

#####################################
# PHP Human Language and Character Encoding Support Extension
#####################################
RUN if [ ${INSTALL_INTL} = true ]; then \
    apt-get update -yqq && \
    apt-get install -y zlib1g-dev libicu-dev g++ && \
    docker-php-ext-configure intl && \
    docker-php-ext-install intl \
;fi

#####################################
# GHOSTSCRIPT: Install the ghostscript extension for PDF editing
#####################################
RUN if [ ${INSTALL_GHOSTSCRIPT} = true ]; then \
    apt-get install -y \
    poppler-utils \
    ghostscript \
;fi

#####################################
# LDAP:
#####################################
RUN if [ ${INSTALL_LDAP} = true ]; then \
    apt-get install -y libldap2-dev && \
    docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/ && \
    docker-php-ext-install ldap \
;fi

#####################################
# PHP SQL SERVER Extension
#####################################
ENV INSTALL_MSSQL ${INSTALL_MSSQL}
RUN if [ ${INSTALL_MSSQL} = true ]; then \
    apt-get update -yqq && apt-get install -y apt-transport-https \
        && curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
        && curl https://packages.microsoft.com/config/debian/8/prod.list > /etc/apt/sources.list.d/mssql-release.list \
        && apt-get update -yqq \
        && ACCEPT_EULA=Y apt-get install -y unixodbc unixodbc-dev libgss3 odbcinst msodbcsql locales \
        && echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && locale-gen \
        && pecl install pdo_sqlsrv-4.1.8preview sqlsrv-4.1.8preview \
        && docker-php-ext-enable pdo_sqlsrv sqlsrv \
;fi

#####################################
# Image optimizers:
#####################################
USER root
RUN if [ ${INSTALL_IMAGE_OPTIMIZERS} = true ]; then \
    apt-get install -y --force-yes jpegoptim optipng pngquant gifsicle \
;fi

#####################################
# ImageMagick:
#####################################
USER root
RUN if [ ${INSTALL_IMAGEMAGICK} = true ]; then \
    apt-get install -y libmagickwand-dev imagemagick && \
    pecl install imagick && \
    docker-php-ext-enable imagick \
;fi

###########################################################################
# PHP IMAP Extension
###########################################################################
RUN if [ ${INSTALL_IMAP} = true ]; then \
    apt-get install -y libc-client-dev libkrb5-dev && \
    rm -r /var/lib/apt/lists/* && \
    docker-php-ext-configure imap --with-kerberos --with-imap-ssl && \
    docker-php-ext-install imap \
;fi

#
#--------------------------------------------------------------------------
# Copy configurations (You can switch to apache2 base image)
#--------------------------------------------------------------------------
#
COPY ./docker/apache2/apache2.conf /etc/apache2/apache2.conf
COPY ./docker/apache2/sites-enabled /etc/apache2/sites-enabled
COPY ./docker/php/php.ini /usr/local/etc/php/php.ini

#
#--------------------------------------------------------------------------
# Install Composer
#--------------------------------------------------------------------------
#
RUN curl -s https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer

#
#--------------------------------------------------------------------------
# clean and revert to normal user
#--------------------------------------------------------------------------
#
USER root
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    rm /var/log/lastlog /var/log/faillog
RUN usermod -u 1000 www-data

#
#--------------------------------------------------------------------------
# Copy project code
#--------------------------------------------------------------------------
#
RUN mkdir -p /usr/share/nginx/html
WORKDIR /usr/share/nginx/html

COPY composer.* ./
RUN composer install --no-autoloader

COPY . .
RUN composer dump-autoload

EXPOSE 9000

CMD [ "php-fpm" ]
