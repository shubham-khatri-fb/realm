# FROM ruby:2.5.6-alpine

# RUN apk add --update --no-cache \
#       binutils-gold \
#       build-base \
#       curl \
#       file \
#       g++ \
#       gcc \
#       git \
#       less \
#       libstdc++ \
#       libffi-dev \
#       libc-dev \ 
#       linux-headers \
#       libxml2-dev \
#       libxslt-dev \
#       libgcrypt-dev \
#       make \
#       netcat-openbsd \
#       openssl \
#       pkgconfig \
#       postgresql-dev \
#       python \
#       tzdata

# RUN gem install bundler -v 2.3.26

# WORKDIR /app

# COPY Gemfile Gemfile.lock ./

# RUN bundle config build.nokogiri --use-system-libraries

# RUN bundle check || bundle install 

# COPY . ./ 

# RUN bundle exec rails s -b 0.0.0.0

FROM ruby:2.5.6

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
	&& rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY Gemfile ./

RUN gem install bundler -v 2.3.15

RUN gem update --system 3.2.3

RUN bundle install
COPY . .

CMD bundle exec rails s -b 0.0.0.0

# EXPOSE 3000
# CMD ["rails", "server", "-b", "0.0.0.0"]