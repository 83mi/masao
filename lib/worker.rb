# -*- encoding: utf-8 -*-

module Masao
  class App < Sinatra::Base

    EM::defer do
      $redis_worker = Redis.new(url: ENV['REDIS_URL'])
      api = Masao_API.new

      begin
        loop do
          sleep 5.0
          next if $redis_worker.llen("worker_spool") == 0

          method_raw = $redis_worker.lrange("worker_spool", 0, 1).first
          next if method_raw.nil?

          method_json = JSON.parse(method_raw)
          pp "worker run: " + method_json['namespace']

          case method_json['namespace']
          when 'word'
            s = method_json['server']
            w = method_json['word']
            #api.search_word_save(s, w)
            pp "worker run: " + method_json['namespace'] + " done."
          else
            pp "no match namespace. : " + method_json['namespace']
          end

          $redis_worker.lpop("worker_spool")
          pp "worker spool remove"

          GC.start
        end
      rescue => e
        pp "worker abort"
        pp "worker Log: " + e.to_s
        sleep 5.0
        retry
      end
    end

  end
end
