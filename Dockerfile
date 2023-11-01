FROM ruby:3.2.2-alpine

WORKDIR /app

RUN gem update --system --no-document && gem install -N bundler

# Install build tools and dependencies
RUN apk update && apk add --no-cache build-base ruby-dev

COPY --link Gemfile Gemfile.lock ./

RUN bundle install

COPY . .