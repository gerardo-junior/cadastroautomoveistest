#!/bin/bash

if [ -e "$(pwd)/yarn.lock" ]; then
    yarn install --pure-lockfile
    yarn cache clean --force
elif [ -e "$(pwd)/package.json" ]; then
    npm install
    npm cache clean --force
fi

if [ -e "$(pwd)/composer.lock" ]; then
    composer install -n 
fi

exec "$@"