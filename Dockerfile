
FROM fluent/fluentd:stable-debian

USER root

RUN apt-get update \
    && apt-get -y install \
        ruby-dev \
    && apt-get autoclean \
    && gem install \
        fluent-plugin-elasticsearch \
        fluent-plugin-record-reformer \
        fluent-plugin-multi-format-parser \
        fluent-plugin-grok-parser \
    && gem sources --clear-all

ADD fluent.conf /fluentd/etc/fluent.conf
