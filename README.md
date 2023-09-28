# -*- mode: org; coding: utf-8 -*-
まさお - Masao 形態素解析MeCab+Nattoを利用したAPIサーバ.

* 要件
**  必須アプリケーション
- ruby 3.1.x later
- rake
- gem
- Bundler
- redis

** インストール方法
- $ gem update --system
- $ gem install bundler
-  $ bundle install
-  $ rake db:migrate
    上手く動かなかったら
-    $ bundle exec rake db:setup
-  $ ./run.sh
    上手く動かなかったら
-    $ bundle exec thin start

** ディレクトリ構成
  - app.rb: 本体スクリプト
  - secret: テスト用環境設定ファイル
  - views: ビューファイル
  - public: 公開静的リンクファイル
  - config: rake config
  - data: 各種辞書等
  - lib: masao libs

* ライセンスなど
** ライセンス

MIT license

Copyright 2023, masao project

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files
(the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge,
publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO
THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
DEALINGS IN THE SOFTWARE.
