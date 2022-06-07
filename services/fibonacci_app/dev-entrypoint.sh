#!/bin/sh

set -e

echo "Environment: $RAILS_ENV"
echo "Current directory: `pwd`"
echo `ls -lta`

# install missing gems
bundle check || bundle install --jobs 20 --retry 5

# Remove pre-existing puma/passenger server.pid
rm -f $APP_PATH/tmp/pids/server.pid

# run passed commands
bundle exec ${@}