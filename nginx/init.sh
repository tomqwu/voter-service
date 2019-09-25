#!/bin/bash

sed -i "s#UPSTREAM_HOSTNAME#${UPSTREAM_HOSTNAME}#g" /etc/nginx/nginx.conf

nginx -g "daemon off;"
