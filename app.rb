# -*- encoding: utf-8 -*-

require_relative 'lib/api'
require_relative 'lib/version'

require 'sinatra/base'
require 'json'
require 'kconv'
require 'nkf'
require 'cgi'
require 'date'

require 'net/http'
require 'securerandom'
require 'redis'
require 'rest-client'

$redis = Redis.new(url: ENV['REDIS_URL'])
$redis.flushall

ENV['API_KEY'] = SecureRandom.uuid if ENV['API_KEY'].nil?
if File.exist?("secret/api-key.json")
  API_KEY = JSON.parse(File.open("secret/api-key.json").read)
else
  API_KEY = ENV['API_KEY']
end

require_relative 'lib/masao'
