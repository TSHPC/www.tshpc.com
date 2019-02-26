!#/bin/bash
docker-compose run web rails db:migrate
docker-compose run web rails g controller pages --skip-assets
docker-compose run web rails g scaffold User name:string password:digest
docker-compose run web rails db:migrate
