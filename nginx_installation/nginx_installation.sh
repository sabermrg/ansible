#!/bin/bash
apt install nginx
systemctl start nginx
systemctl enable nginx

wget https://gist.githubusercontent.com/nishantmodak/d08aae033775cb1a0f8a/raw/ebea0ae66e0a0188009accae2acba88cc646ddcd/nginx.conf.default
cp -f nginx.conf.default /etc/nginx/nginx.conf
nginx -t
is_valid=$?

if [ $is_valid ne 0 ]; then
        echo 'Nginx configuration Failed!'
        rm -f nginx.conf.default
        exit 1
fi
systemctl restart nginx
rm -f nginx.conf.default
