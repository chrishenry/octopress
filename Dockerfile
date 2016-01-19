FROM ubuntu:14.04.3
MAINTAINER Chris Henry <henry.christopher@gmail.com>

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

# Assumes yes for any whiptail interactive screens
ENV DEBIAN_FRONTEND noninteractive

# Install tools & libs to compile everything
RUN locale-gen en_US.UTF-8 && export LANG=en_US.UTF-8 && \
    apt-get update -y && apt-get install -y \
      ruby ruby-dev build-essential

RUN mkdir -p /opt/octopress
COPY Gemfile /opt/octopress/
COPY Gemfile.lock /opt/octopress/

RUN cd /opt/octopress/ && \
  gem install bundle && gem install rdoc && bundle install --system

WORKDIR /opt/octopress
EXPOSE 4000 80
