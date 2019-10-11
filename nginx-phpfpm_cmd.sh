#!/bin/bash
set -e
/usr/sbin/nginx
/usr/local/php/sbin/php-fpm --nodaemonize --fpm-config /usr/local/php/etc/php-fpm.conf
