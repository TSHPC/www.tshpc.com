#!/bin/bash
ROOT_DIR=${PWD}
COMPOSE_FILE=${ROOT_DIR}/docker-compose.development.yml
#COMPOSE_OPTS="-u $(id -u):$(id -g)"

# see: https://github.com/RailsApps/rails-composer
#if ! [ -d ${ROOT_DIR}/app ] ; then
#	docker-compose -f ${COMPOSE_FILE}                      \
#		run ${COMPOSE_OPTS} --rm app bundle exec rails new . \
#		--force --skip-bundle --database=postgresql  
#	./scripts/update.sh
#fi

docker-compose -f production.yml up

