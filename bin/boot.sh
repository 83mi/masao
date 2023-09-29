#!/usr/bin/env bash
# exit on error
set -o errexit

export LANG=ja_JP.UTF-8

#bundle exec rake assets:precompile
#bundle exec rake assets:clean
#bundle exec rake db:migrate
#bundle exec rake db:seed

#RACK_ENV=production bundle exec thin start
#bundle exec thin start
bundle exec puma -C config/puma.rb
