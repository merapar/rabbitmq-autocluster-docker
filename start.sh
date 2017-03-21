#!/usr/bin/env bash

docker-entrypoint.sh rabbitmq-server &
rabbitMQ=$!
echo 'Sleeping, awaiting for RabbitMQ to have completely started'
sleep 15
echo 'Done sleeping, continiung clustering'

if [ "$MY_POD_NAME" == 'rabbitmq-0' ]
then
  rabbitmqctl set_policy HA '.*' '{"ha-mode": "all"}'
else
  rabbitmqctl stop_app
  rabbitmqctl join_cluster rabbit@rabbitmq-0.rabbitmq
  rabbitmqctl start_app
fi

wait $rabbitMQ
