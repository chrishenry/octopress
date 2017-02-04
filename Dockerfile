FROM buildpack-deps:jessie
MAINTAINER Chris Henry <henry.christopher@gmail.com>

ENV LANG C.UTF-8

# runtime dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
		tcl \
		tk \
		ruby \
		ruby-dev \
	&& rm -rf /var/lib/apt/lists/*

RUN mkdir -p /opt/octopress
COPY . /opt/octopress/

RUN cd /opt/octopress/ && \
  gem install bundle && bundle install --system

WORKDIR /opt/octopress
EXPOSE 4000
