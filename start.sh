#!/bin/sh
nginx_conf = "nginx/conf.d/default.conf"
[ -f $nginx_conf ] && rm $nginx_conf
docker-compose up -d --build