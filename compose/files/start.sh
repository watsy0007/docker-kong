#!/bin/bash
service nginx start
consul-template -consul=$CONSUL_URL -template="/templates/default.ctmpl:/etc/nginx/nginx.conf:service nginx reload"
cat /etc/nginx/conf.d/default.conf