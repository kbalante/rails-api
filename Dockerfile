FROM ruby:2.6.3

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install --path vendor/bundle

COPY . .

CMD ["./docker-entrypoint.sh"]
