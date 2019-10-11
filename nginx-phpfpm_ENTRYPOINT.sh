#!/bin/bash
set -e
#多个进程需要将第一个进程设置为daemon运行方式（nginx默认为daemon运行方式），否则第二个进程不会运行。
/usr/sbin/nginx -g "daemon on;"
/usr/local/php/sbin/php-fpm --nodaemonize --fpm-config /usr/local/php/etc/php-fpm.conf
