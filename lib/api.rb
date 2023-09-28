# -*- encoding: utf-8 -*-

class Masao_API

  require 'json'
  require 'natto'
  require "digest/sha2"

  def initialize
    @nm = Natto::MeCab.new
  end

  def word1(params)
    sha256 = Digest::SHA256.hexdigest(params)
    size = params.size.to_s
    key = 'word1_' + sha256 + size

    if $redis.exists(key) == 0
      params = JSON.parse(params)
      res = {}
      params.each do |dbs|
        data = dbs['body']
        if not data.empty?
          @nm.parse(data) do |n|
            text = n.feature.split(/,/).first
            if text == '名詞'
              trim_surface = n.surface
              if trim_surface.size >= 3
                if res[trim_surface].nil?
                  res[trim_surface] = 1
                else
                  res[trim_surface] += 1
                end
              end
            end
          end
        end
      end
      g_res = JSON.generate(res)
      $redis.set(key, g_res)
      $redis.expire(key, 3600)
      return g_res
    else
      g_res = $redis.get(key)
      return g_res
    end
  end

  def word2(params)
    sha256 = Digest::SHA256.hexdigest(params)
    size = params.size.to_s
    key = 'word2_' + sha256 + size

    if $redis.exists(key) == 0
      res = {}
      params2 = NKF.nkf("-Xwm0Z1", params)

      JSON.parse(params2).each do |dbs|
        data = dbs['body']
        if not data.empty?
          @nm.parse(data) do |n|
            text = n.feature.split(/,/).first
            if text == '名詞'
              trim_surface = n.surface
              if trim_surface.size >= 3
                if res[trim_surface].nil?
                  res[trim_surface] = 1
                else
                  res[trim_surface] += 1
                end
              end
            end
          end
        end
      end
      g_res = JSON.generate(res)
      $redis.set(key, g_res)
      $redis.expire(key, 3600)
      return g_res
    else
      g_res = $redis.get(key)
      return g_res
    end
  end

  def word3(params)
  end
end
