FROM ubuntu:19.04

ARG SPARK_VERSION=2.4.4
ARG HADOOP_VERSION=2.7
ARG TAR=spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz

RUN apt-get update -y \
    && apt-get install -y \
        sudo tar \
        software-properties-common apt-transport-https \
        wget git \
        python3 python3-pip python3-venv \
        python3-all-dev python3-setuptools build-essential python3-wheel \
        openjdk-8-jdk \
    &&  pip3 install pyspark kafka-python virtualenv \
    && apt-get autoremove -y \
    && apt-get clean -y

WORKDIR /

RUN wget -t 100 -O "${TAR}" "http://mirrors.tuna.tsinghua.edu.cn/apache/spark/spark-2.4.4/${TAR}" && \
    tar zxf "${TAR}" && \
    rm -fv "${TAR}" && \
    ln -s "spark-$SPARK_VERSION-bin-hadoop$HADOOP_VERSION" spark


ENV SPARK_HOME /spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
ENV PATH="$PATH:$JAVA_HOME/bin"
ENV PYSPARK_PYTHON=python3.6