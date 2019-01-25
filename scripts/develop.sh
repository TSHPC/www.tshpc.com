#!/bin/bash
#docker-compose run  --rm -it -v src:$HOME tshpc bash

CMD="rails new . --force --no-deps --database=postgresql"

docker-compose -f development.yml run --rm web ${CMD}
