#!/bin/bash

DOCKER_DIR="./docker"

COMPOSE_FILE="${DOCKER_DIR}/development.yml"

srv=web

docker-compose -f ${COMPOSE_FILE} run ${srv} \
									bundle install
docker-compose -f ${COMPOSE_FILE} run ${srv} \
									bundle update
docker-compose -f ${COMPOSE_FILE} run ${srv} \
									bundle exec rails db:migrate
docker-compose -f ${COMPOSE_FILE} run ${srv} \
									bundle exec rails g controller pages --skip-assets
docker-compose -f ${COMPOSE_FILE} run ${srv} \
									bundle exec rails g scaffold User name:string password:digest
docker-compose -f ${COMPOSE_FILE} run ${srv} \
									bundle exec rails db:migrate
