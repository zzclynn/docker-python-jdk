FROM ubuntu:19.04

RUN apt-get update -y \
    && apt-get install -y \
        sudo curl \
        software-properties-common apt-transport-https \
        wget git \
        python3 python3-pip python3-venv \
        python3-all-dev python3-setuptools build-essential python3-wheel \
        openjdk-8-jdk \
    && apt-get autoremove -y \
    && apt-get clean -y

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
ENV PATH="$PATH:$JAVA_HOME/bin"
