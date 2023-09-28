# -*- encoding: utf-8 -*-

class Masao_API

  require 'json'
  require 'natto'

  def initialize
    @nm = Natto::MeCab.new
  end

  def word1(params)
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
    return JSON.generate(res)
  end

  def word2(params)
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
    return JSON.generate(res)
  end

  def word3(params)
  end
end
