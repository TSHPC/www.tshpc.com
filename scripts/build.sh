#!/bin/bash
mkdir -p src/tmp/db
docker-compose -f development.yml build         \
						  --build-arg ctr_user=$USER        \
              --build-arg ctr_group=$(id -g -n) \
              --build-arg ctr_gid=$(id -g)      \
              --build-arg ctr_uid=$(id -u)
