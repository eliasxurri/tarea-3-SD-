FROM bde2020/hadoop-base:2.0.0-hadoop2.7.4-java8

RUN apt-get update && apt-get install -y wget \
  && wget http://archive.apache.org/dist/pig/pig-0.17.0/pig-0.17.0.tar.gz \
  && tar -xzvf pig-0.17.0.tar.gz \
  && mv pig-0.17.0 /opt/ \
  && ln -s /opt/pig-0.17.0 /opt/pig \
  && rm pig-0.17.0.tar.gz

ENV PATH $PATH:/opt/pig/bin
