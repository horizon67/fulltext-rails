FROM ruby:3.3.1-slim-bullseye

ENV ROOT="/fulltext"
ARG RUNTIME_PACKAGES="git build-essential default-libmysqlclient-dev"

WORKDIR ${ROOT}
RUN apt-get update \
    && apt-get install -y --no-install-recommends ${RUNTIME_PACKAGES} \
    && apt-get clean \
    && rm -rf /var/cache/apt/archives/* \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
COPY Gemfile ${ROOT}
COPY Gemfile.lock ${ROOT}
RUN gem install bundler
RUN gem update --system
RUN bundle install

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3006

CMD ["rails", "server", "-b", "0.0.0.0"]
