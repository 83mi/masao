# -*- encoding: utf-8 -*-

module Masao
  class App < Sinatra::Base

    before do
      # HTTPS redirect
      if request.env['REMOTE_ADDR'] != '127.0.0.1' && request.scheme != 'https' && ENV['RACK_ENV'] != 'development'
        if /^192.168.(0|1)./ !~ request.env['REMOTE_ADDR'] && ENV['RACK_ENV'] != 'development'
          redirect "https://#{request.env['HTTP_HOST']}"
        end
      end

      redirect '/' if not self.enable_host
    end

    after do
      redirect '/' if not self.enable_host
    end

    get '/' do
      @server_version = Masao_Status.Version
      @first_update = Masao_Status.Init
      @last_update = Masao_Status.Update

      erb :top
    end

    get '/keepalive' do
      return ""
    end

    get '/r_keepalive' do
      return ""
    end

    post '/api/v1/word1', provides: :json do
      @@api.word1(request.body.read)
    end

    post '/api/v1/word2', provides: :json do
      @@api.word2(request.body.read)
    end

    error 404 do
      if env["REQUEST_PATH"].nil?
        puts 'not found:'
      else
        puts 'not found: ' + env["REQUEST_PATH"]
      end
      return '404'
    end
  end
end
