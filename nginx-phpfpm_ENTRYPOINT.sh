#!/bin/bash
set -e
/usr/sbin/nginx -g "daemon off;"
/usr/local/php/sbin/php-fpm --nodaemonize --fpm-config /usr/local/php/etc/php-fpm.conf
