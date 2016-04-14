FROM netflixoss/java:8

#RUN apk --update add curl tar bash
RUN apt-get update && \
    apt-get install -y --force-yes --no-install-recommends curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists

ENV SOLR_VERSION 4.10.4

RUN mkdir -p /opt/solr && \
curl http://archive.apache.org/dist/lucene/solr/$SOLR_VERSION/solr-$SOLR_VERSION.tgz | tar -xzC /opt/solr --strip=1

EXPOSE 8983

ENTRYPOINT ["/opt/solr/bin/solr", "-f"]
