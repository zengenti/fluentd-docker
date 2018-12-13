
FROM fluent/fluentd:stable-debian

USER root

RUN apt-get update \
    && apt-get -y install \
        ruby-dev \
        net-tools \
        tcpdump \
    && apt-get autoclean \
    && gem install \
        fluent-plugin-elasticsearch \
        fluent-plugin-record-reformer \
    && gem sources --clear-all

ADD fluent.conf /fluentd/etc/fluent.conf
