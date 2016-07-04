#!/bin/sh

# Setting up the proper database
path="/etc/kong/kong.yml"
if [ -n "$DB_HOST" ]; then
    reg="1,2s/kong-database/${DB_HOST}/"
    echo `(sed -i '' $reg $path)`
fi

if [ -n "$DB_PORT" ]; then
    reg="3,3s/5432/${DB_PORT}/"
    echo `(sed -i '' $reg $path)`
fi

if [ -n "$DB_NAME" ]; then
    reg="4,4s/kong/${DB_USER}/"
    echo `(sed -i '' $reg $path)`
fi

if [ -n "$DB_USER" ]; then
    reg="5,5s/kong/${DB_USER}/"
    echo `(sed -i '' $reg $path)`
fi

if [ -n "$DB_PASS" ]; then
    reg="6,6s/kong/${DB_PASS}/"
    echo `(sed -i '' $reg $path)`
fi

if [ -n "$DATABASE" ]; then
  echo -e '\ndatabase: "'$DATABASE'"' >> /etc/kong/kong.yml
fi
