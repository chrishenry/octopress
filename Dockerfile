FROM ubuntu:14.04.3
MAINTAINER Chris Henry <henry.christopher@gmail.com>

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

# Assumes yes for any whiptail interactive screens
ENV DEBIAN_FRONTEND noninteractive

# Install tools & libs to compile everything
RUN locale-gen en_US.UTF-8 && export LANG=en_US.UTF-8 && \
    apt-get update -y && apt-get install -y \
      ruby ruby-dev libffi-dev build-essential nodejs ruby-json

RUN mkdir -p /aws && \
  apt-get update -y && apt-get install -y python python-dev python-pip && \
  pip install awscli

RUN mkdir -p /opt/octopress
COPY Gemfile /opt/octopress/
COPY Gemfile.lock /opt/octopress/

RUN cd /opt/octopress/ && \
  gem install bundle && bundle install --system

WORKDIR /opt/octopress
EXPOSE 4000 80
