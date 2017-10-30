#!/bin/sh

create() {
    echo "DEV_HOST_IP="$(hostname -I | cut -d' ' -f1) \
    "\nUID="$(id -u) \
    "\nGID="$(id -g) \
    > ./.env
}

if create; then
    echo "New .env file has been created"
else
    echo "Error occurred."
    exit 1
fi
exit 0
