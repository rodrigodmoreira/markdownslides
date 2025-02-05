FROM ubuntu:24.10

# setup ruby and jekyll
RUN apt update
RUN apt install -y ruby-full
RUN apt-get install -y build-essential zlib1g-dev
RUN gem install jekyll bundler

# jekyll server
EXPOSE 4000

RUN ruby --version
RUN gem --version


# setup app
WORKDIR /app
COPY . ./


# install dependecies and build _site
RUN bundle install
RUN bundle exec jekyll build


CMD [ \
  "bundle", "exec", \
    "jekyll", "serve", "--force_polling", "-H", "0.0.0.0" \
]

