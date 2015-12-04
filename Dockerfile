FROM ubuntu:latest
RUN locale-gen en_US.UTF-8 \
	&& export LANG=en_US.UTF-8 \
	&& apt-get update \
	&& apt-get install -y software-properties-common \
	&& add-apt-repository -y ppa:ondrej/php5-5.6 \
	&& apt-get update \
    && apt-get -y install \
		apache2 \
		libapache2-mod-php5 \
		php5 \
		php5-cli \
		php5-xdebug \
		sqlite3 \
		php5-mysql \
		php-apc \
		php5-apcu \
		php5-geoip \
		php5-imagick \
		php5-mcrypt \
		php5-mongo \
		php5-memcached \
		php-pear \
		curl \
		imagemagick \
		php5-dev \
		php5-dbg \
		php5-gd \
		npm \
		nodejs-legacy \
		php5-json \
		php5-curl \
		php5-sqlite \
		php5-intl \
		apache2 \
		vim \
		git-core \
		wget \
	&& a2enmod headers \
	&& a2enmod rewrite \
	&& npm install -g grunt-cli bower

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
RUN ln -sf /dev/stdout /var/log/apache2/access.log && \
    ln -sf /dev/stderr /var/log/apache2/error.log
RUN mkdir -p $APACHE_RUN_DIR $APACHE_LOCK_DIR $APACHE_LOG_DIR


VOLUME [ "/var/www/html" ]
WORKDIR /var/www/html

EXPOSE 80

ENTRYPOINT [ "/usr/sbin/apache2" ]
CMD ["-D", "FOREGROUND"]
