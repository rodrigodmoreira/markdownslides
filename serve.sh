#!/bin/bash

# build/serve files
docker run \
  --rm -it \
  -p 4000:4000 \
  -v "$(pwd):/app" \
  --name jekyll-serve \
  jekyll:latest

# clean build files
docker run \
  --rm -it \
  -v "$(pwd):/app" \
  --name jekyll-clean \
  jekyll:latest \
  bundle exec jekyll clean

