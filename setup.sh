#!/bin/sh

# Setting up the proper database
if [ -n "$DB_HOST" ]; then
    reg="1,2s/kong-database/${DB_HOST}/"
    echo $reg
    echo `(sed -i  $reg /etc/kong/kong.yml)`
fi

if [ -n "$DB_PORT" ]; then
    reg="3,3s/5432/${DB_PORT}/"
    echo $reg
    echo `(sed -i  $reg /etc/kong/kong.yml)`
fi

if [ -n "$DB_NAME" ]; then
    reg="4,4s/kong/${DB_NAME}/"
    echo $reg
    echo `(sed -i  $reg /etc/kong/kong.yml)`
fi

if [ -n "$DB_USER" ]; then
    reg="5,5s/kong/${DB_USER}/"
    echo $reg
    echo `(sed -i  $reg /etc/kong/kong.yml)`
fi

if [ -n "$DB_PASS" ]; then
    reg="6,6s/kong/${DB_PASS}/"
    echo $reg
    echo `(sed -i  $reg /etc/kong/kong.yml)`
fi

if [ -n "$DATABASE" ]; then
    echo -e '\ndatabase: "'$DATABASE'"' >> /etc/kong/kong.yml
    cat /etc/kong/kong.yml
fi
