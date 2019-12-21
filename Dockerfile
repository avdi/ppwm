FROM ruby:1.9

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

WORKDIR /app

RUN bundle install

CMD ["sh", "-c", "bundle exec rails server"]
