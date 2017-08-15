FROM rhel
RUN mkdir -p /opt/kafka \
  && cd /opt/kafka \
  && yum -y install java tar \
  && curl -s http://www.mirrorservice.org/sites/ftp.apache.org/kafka/0.9.0.1/kafka_2.11-0.9.0.1.tgz | tar -xz --strip-components=1 \
  && yum clean all \
COPY zookeeper-server-start-multiple.sh /opt/kafka/bin/
RUN chmod -R a=u /opt/kafka
WORKDIR /opt/kafka
VOLUME /tmp/kafka-logs /tmp/zookeeper
EXPOSE 2181 2888 3888 9092
