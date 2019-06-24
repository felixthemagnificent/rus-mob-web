FROM ruby:2.6.3-alpine

RUN apk add --update --no-cache build-base postgresql-dev git tzdata

ENV RAILS_ENV production
RUN mkdir /app
WORKDIR /app

COPY Gemfile* ./
RUN bundle install --jobs 4 --retry 4 --without development test

COPY . .

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
