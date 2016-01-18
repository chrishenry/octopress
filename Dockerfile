FROM envygeeks/alpine
MAINTAINER Chris Henry <henry.christopher@gmail.com>

RUN \
  apk --update add readline readline-dev libxml2 libxml2-dev libxslt  \
    libxslt-dev zlib zlib-dev ruby ruby-dev yaml \
    yaml-dev libffi libffi-dev build-base nodejs ruby-io-console \
    ruby-irb ruby-json ruby-rdoc

RUN mkdir -p /aws && \
  apk -Uuv add groff less python py-pip && \
  pip install awscli && \
  apk --purge -v del py-pip && \
  rm /var/cache/apk/*

RUN mkdir -p /opt/octopress
COPY Gemfile /opt/octopress/
COPY Gemfile.lock /opt/octopress/

RUN cd /opt/octopress/ && \
  gem install bundle && bundle install --system

WORKDIR /opt/octopress
EXPOSE 4000 80
