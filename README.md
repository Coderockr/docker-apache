# docker-apache
Docker image used in our projects

Configuring:
```
apache:
    image: eminetto/apache
    ports:
        - "80:80"
    volumes:
        - .:/var/www/html/clipp
        - ./Deploy/apache/dev.conf:/etc/apache2/sites-enabled/001-clipp.conf
    links:
        - mysql
        - memcached
        - statsd
        - gocep
```
