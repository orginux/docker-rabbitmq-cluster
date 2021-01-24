#!/bin/bash

set -ex

rabbitmq-server -detached

# Wait for start server
sleep 3

rabbitmqctl stop_app
rabbitmqctl join_cluster rabbit@rabbitmq1
rabbitmqctl start_app

if [ "$HOSTNAME" == rabbitmq2 ]; then
    rabbitmqctl add_user ${RABBITMQ_USER} ${RABBITMQ_PASS}
    rabbitmqctl set_user_tags ${RABBITMQ_USER} administrator
    rabbitmqctl set_permissions -p / ${RABBITMQ_USER} ".*" ".*" ".*"
    rabbitmqctl delete_user guest
fi

# Stop the entire RMQ server. This is done so that we
# can attach to it again, but without the -detached flag
# making it run in the forground
rabbitmqctl stop

# Start it
rabbitmq-server
