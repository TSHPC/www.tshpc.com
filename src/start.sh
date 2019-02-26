#!/bin/bash

# bootstrap rails gems.
root_dir="${APP_DIR}/app"
srv_file="${APP_DIR}/tmp/pids/server.pid"
gem_file="${APP_DIR}/Gemfile"
db_file="${APP_DIR}/config/database.yml"

# check if we are generating for the first time. 
if [ ! -f ${gem_file} ] ; then 
	echo "... launching rails in $APP_DIR:"
	echo "source 'https://rubygems.org'"     > ${gem_file}
	echo "gem 'rails', '~> 5.2.2'"          >> ${gem_file}
	echo "gem 'bcrypt', '~> 3.1.7'"         >> ${gem_file}
	echo "gem 'pg'"                         >> ${gem_file}
	echo "gem 'listen'"                     >> ${gem_file}
	echo "gem 'bootstrap'"                  >> ${gem_file}
	echo "gem 'turbolinks'"                 >> ${gem_file}
	echo "gem 'coffee-rails'"               >> ${gem_file}
	echo "gem 'jquery-rails'"               >> ${gem_file}
	echo "gem 'jquery-ui-rails'"            >> ${gem_file}
	echo "gem 'font-awesome-rails'"         >> ${gem_file} 
	touch ${gem_file}.lock
fi

bundle check || bundle install

if [ ! -d ${root_dir} ] ; then 
	echo "... generating rails in $APP_DIR:"	
	bundle exec rails new . --no-deps --database=postgresql
	bundle check || bundle install
	# adjust the database.yml file.
	cp ${db_file} ${db_file}.backup
	echo "default: &default"                                      > ${db_file}
	echo "  adapter: postgresql"                                 >> ${db_file}
	echo "  encoding: unicode"                                   >> ${db_file}
	echo "  host: db"                                            >> ${db_file}
	echo "  username: postgres"                                  >> ${db_file}
	echo "  password:"                                           >> ${db_file}
	echo "  pool: <%= ENV.fetch(\"RAILS_MAX_THREADS\") { 5 } %>" >> ${db_file}
	echo "development:"                                          >> ${db_file}
	echo "  <<: *default"                                        >> ${db_file}
	echo "  database: tshpc_development"                         >> ${db_file}
	echo "test:"                                                 >> ${db_file}
	echo "  <<: *default"                                        >> ${db_file}
	echo "  database: tshpc_test"                                >> ${db_file}
	echo "production:"                                           >> ${db_file}
	echo "  <<: *default"                                        >> ${db_file}
	echo "  database: tshpc_production"                          >> ${db_file}
	echo "  username: tshpc"                                     >> ${db_file}
	echo "  password: <%= ENV['TSHPC_DATABASE_PASSWORD'] %>"     >> ${db_file}
	bundle exec rake db:create  2>/dev/null || bundle exec rake db:setup
	bundle exec rake db:migrate 2>/dev/null || bundle exec rake db:setup
	bundle exec rake db:seed
fi

# build or update the database and then run the server.
bundle check || bundle install
bundle exec rake db:migrate 2>/dev/null || bundle exec rake db:setup
bundle exec rake db:seed
rm -f ${srv_file}
bundle exec rails s -b 0.0.0.0
