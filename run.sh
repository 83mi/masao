#!/bin/bash

export RACK_ENV=development
#bundle exec thin start
bundle exec puma -C config/puma.rb
