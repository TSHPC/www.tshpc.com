#!/bin/bash
APP_DIR="./src"
rm -rf ${APP_DIR}/app       \
			 ${APP_DIR}/bin       \
			 ${APP_DIR}/config    \
			 ${APP_DIR}/db        \
			 ${APP_DIR}/log       \
			 ${APP_DIR}/public    \
			 ${APP_DIR}/test      \
			 ${APP_DIR}/tmp       \
			 ${APP_DIR}/vendor    \
			 ${APP_DIR}/README*   \
			 ${APP_DIR}/lib       \
       ${APP_DIR}/Rakefile  \
       ${APP_DIR}/config.ru \
       ${APP_DIR}/.ruby-*   \
       ${APP_DIR}/Gemfile*
