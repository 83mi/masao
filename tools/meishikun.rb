# -*- encoding: utf-8 -*-

require 'json'

data = JSON.parse(open("item_name.json").read)
template = "NAME,1288,1288,4000,名詞,固有名詞,一般,*,*,*,アイテム,アイテム,アイテム"

data.each do |d|
  name = d
  puts template.sub(/^NAME/, name)
end
