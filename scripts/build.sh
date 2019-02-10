#!/bin/bash
if [ "$1" == "-f" ] ; then 
	echo "... forcing new build"
	rm -rf ./src/tmp/db
	rm -rf ./src/Gemfile*
fi

DOCKER_DIR="./docker"

COMPOSE_FILE="${DOCKER_DIR}/development.yml"

mkdir -p ./src/tmp/db

docker-compose -f ${COMPOSE_FILE} build         \
						  --build-arg ctr_user=$USER        \
              --build-arg ctr_group=$(id -g -n) \
              --build-arg ctr_gid=$(id -g)      \
              --build-arg ctr_uid=$(id -u)
