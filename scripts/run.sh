#!/bin/bash

DOCKER_DIR="./docker"

COMPOSE_FILE="${DOCKER_DIR}/development.yml"

srv=web

docker-compose -f ${COMPOSE_FILE} run ${srv} bundle exec $@
