#!/bin/bash
set -e
/usr/sbin/nginx -g "daemon on;"
/usr/local/php/sbin/php-fpm --nodaemonize --fpm-config /usr/local/php/etc/php-fpm.conf
