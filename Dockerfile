FROM wozhangkun/php-fpm:7.2.16

ENV PECL_EVENT_URL http://pecl.php.net/get/event-2.4.3.tgz
######################################################################################Copy composer
COPY nginx.repo /etc/yum.repos.d/
######################################################################################Configure
RUN \
#############Install Nginx.
    yum -y install pcre-devel zlib-devel librabbitmq-devel librdkafka-devel openssl-devel nginx \
    &&  cd /tmp \
#############install rabbitmq
      && /usr/local/php/bin/pecl install amqp   \
      && echo -e "extension=amqp.so" >> /usr/local/php/etc/php.ini \
#############install mongodb.so
      && /usr/local/php/bin/pecl install mongodb  \
      && echo -e "extension=mongodb.so" >> /usr/local/php/etc/php.ini \
      \
#############install rdkafka.so
      && /usr/local/php/bin/pecl install rdkafka  \
      && echo -e "extension=rdkafka.so" >> /usr/local/php/etc/php.ini \
      \
#############install event.so
      && wget -O event.tar.gz $PECL_EVENT_URL  \
      && mkdir event \
      && tar -xf event.tar.gz -C event --strip-components=1 \
      && cd event \
      && /usr/local/php/bin/phpize > /dev/null \
      && ./configure --with-php-config=/usr/local/php/bin/php-config --with-event-core --with-event-extra \
      && make \
      && make install \
      && echo -e "extension=event.so" >> /usr/local/php/etc/php.ini \
      \
      ######################################################################################move install file
      && cd \
      && yum clean all

# Nginx Dockerfile
# https://github.com/dockerfile/nginx
# Define mountable directories.
VOLUME ["/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/opt"]
COPY nginx.conf /etc/nginx/

# Expose ports.
EXPOSE 80
EXPOSE 443
EXPOSE 9000

WORKDIR /var/www/html

COPY nginx-phpfpm_ENTRYPOINT.sh /usr/local/bin/
ENTRYPOINT ["/bin/bash","/usr/local/bin/nginx-phpfpm_ENTRYPOINT.sh"]
