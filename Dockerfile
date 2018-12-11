
FROM fluent/fluentd:stable-debian

USER root

RUN apt-get update \
    && apt-get -y install \
        ruby-dev \
    && apt-get autoclean \
    && gem install \
        fluent-plugin-elasticsearch \
        fluent-plugin-record-reformer \
    && gem sources --clear-all
