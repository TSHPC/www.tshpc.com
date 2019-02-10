#!/bin/bash

# bootstrap rails gems.
gem_file="${APP_DIR}/Gemfile"
db_file="${APP_DIR}/config/database.yml"

# check if we are generating for the first time. 
if [ ! -f ${gem_file} ] ; then 
	echo "... bootstrap in $APP_DIR:"
	echo "source 'https://rubygems.org'" > ${gem_file}
	echo "gem 'rails', '~> 5.0.0'"      >> ${gem_file}
	#gem 'bcrypt', '~> 3.1.7'
	#gem 'jquery-rails'
	#gem 'jquery-ui-rails'
	touch ${gem_file}.lock
	bundle check || bundle install
	bundle exec rails new . --force --no-deps --database=postgresql
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
	bundle exec rake db:create
fi

# run the server.
rm -f ${APP_DIR}/tmp/pids/server.pid
bundle check || bundle install
bundle exec rails s -b 0.0.0.0
