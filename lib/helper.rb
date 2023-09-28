# -*- encoding: utf-8 -*-

module Masao
  class App < Sinatra::Base
    helpers do
      def enable_host
        stat = false
        enable_list = ENV['ENABLE_HOST'].split(/,/)
        enable_list.each do |url|
          if request.env['HTTP_X_FORWARDED_FOR'].to_s
            if /#{url}/ =~ request.env['HTTP_X_FORWARDED_FOR'].to_s
              stat = true
              break
            else
              stat = false
            end
          end
          if request.env['REMOTE_ADDR'].to_s
            if /#{url}/ =~ request.env['REMOTE_ADDR'].to_s
              stat = true
              break
            else
              stat = false
            end
          end
        end

        stat = true if request.env['REQUEST_PATH'] == '/'
        stat = true if request.env['REQUEST_PATH'] == '/help'
        stat = true if request.env['REQUEST_PATH'] == '/keepalive'
        stat = true if request.env['REQUEST_PATH'] == '/r_keepalive'

        stat
      end
    end
  end
end
