FROM php:5.6.13-apache
RUN apt-get update \
        && apt-get -y --fix-missing install apache2 php5 php5-cli php5-xdebug sqlite3 php5-mysql php-apc php5-apcu php5-geoip php5-imagick php5-mcrypt php5-mongo php5-memcache php-pear curl imagemagick php5-dev php5-dbg php5-gd npm nodejs-legacy php5-json php5-curl php5-sqlite php5-intl apache2 vim git-core wget \
	&& a2enmod headers \
	&& a2enmod rewrite \
	&& npm install -g grunt-cli bower

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2

RUN mkdir -p $APACHE_RUN_DIR $APACHE_LOCK_DIR $APACHE_LOG_DIR

VOLUME [ "/var/www/html" ]
WORKDIR /var/www/html

EXPOSE 80

ENTRYPOINT [ "/usr/sbin/apache2" ]
CMD ["-D", "FOREGROUND"]
