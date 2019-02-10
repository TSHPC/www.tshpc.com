#!/bin/bash
DOCKER_DIR="./docker"

COMPOSE_FILE="${DOCKER_DIR}/development.yml"

docker-compose -f ${COMPOSE_FILE} up
