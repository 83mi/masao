FROM ruby:3.4.4
ENV LANG=ja_JP.UTF-8
RUN mkdir /app
WORKDIR /app

RUN gem install bundler
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

RUN apt-get update
RUN apt-get install -y libmecab2 libmecab-dev mecab mecab-ipadic mecab-ipadic-utf8 mecab-utils
RUN apt-get install -y build-essential libpq-dev

RUN bundle config set --local without 'development test'
RUN bundle install

COPY . /app
COPY dic/dicrc /var/lib/mecab/dic/ipadic-utf8/dicrc
COPY bin/boot.sh /usr/bin/
RUN chmod +x /usr/bin/boot.sh
ENTRYPOINT ["boot.sh"]

EXPOSE 3000
