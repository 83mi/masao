# -*- encoding: utf-8 -*-

module Masao
  class App < Sinatra::Base
    set :public_folder, "public"
    set :views, "views"

    @@api = Masao_API.new

    require_relative 'helper'
    require_relative 'route'
    require_relative 'worker'
  end
end
