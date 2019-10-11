#!/bin/bash
set -e
/usr/local/php/sbin/php-fpm --nodaemonize --fpm-config /usr/local/php/etc/php-fpm.conf
/usr/sbin/nginx
