FROM php:7.4-fpm-alpine

# задает рабочий каталог для любых инструкций RUN, CMD, ENTRYPOINT, COPY и ADD, 
#которые следуют за ней в Dockerfile. Если WORKDIR не существует, он будет создан, даже если он не 
#используется в любой последующей инструкции Dockerfile.
WORKDIR /var/www/html 
#Задаються переменные среды
ENV PHPIZE_DEPS \
    autoconf \
    cmake \
    file \
    g++ \
    gcc \
    libc-dev \
    pcre-dev \
    make \
    git \
    pkgconf \
    re2c \
    freetype-dev \
    libpng-dev  \
    libjpeg-turbo-dev \
    libxslt-dev \
    findutils \
    libressl-dev
# Установка зависимостей
RUN apk add --no-cache --virtual .persistent-deps \
    # for intl extension
    icu-dev \
    # for soap
    libxml2-dev \
    # for GD
    freetype \
    libpng \
    libjpeg-turbo \
    # for bz2 extension
    bzip2-dev \
    # for intl extension
    libintl gettext-dev libxslt \
    # etc
    bash nano curl libzip-dev oniguruma-dev libmcrypt-dev supervisor findutils
# по сути тоже установка зависимостей
RUN set -xe \
    # workaround for rabbitmq linking issue
    && ln -s /usr/lib /usr/local/lib64 \
    && apk add --no-cache --virtual .build-deps \
    $PHPIZE_DEPS \
    && docker-php-ext-configure bcmath --enable-bcmath \
    && docker-php-ext-configure intl --enable-intl \
    && docker-php-ext-configure pcntl --enable-pcntl \
    && docker-php-ext-configure mysqli --with-mysqli \
    && docker-php-ext-configure pdo_mysql --with-pdo-mysql \
    && docker-php-ext-configure mbstring --enable-mbstring \
    && docker-php-ext-configure zip \
    && docker-php-ext-configure soap --enable-soap \
    && docker-php-ext-install -j$(nproc) \
    gd \
    bcmath \
    intl \
    pcntl \
    mysqli \
    pdo_mysql \
    mbstring \
    soap \
    iconv \
    bz2 \
    calendar \
    exif \
    gettext \
    shmop \
    sockets \
    sysvmsg \
    sysvsem \
    sysvshm \
    xsl \
    zip

#Требуется определить хотя бы одну инструкцию (ENTRYPOINT или CMD) (для запуска).
ENTRYPOINT []
CMD []