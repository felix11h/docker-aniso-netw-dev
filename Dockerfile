FROM ubuntu:16.04
MAINTAINER felix11h.dev@gmail.com

USER root

RUN apt-get update
RUN apt-get install -y python python-dev python-pip git

RUN pip install --upgrade pip==9.0.1
RUN pip install numpy==1.13.3
RUN pip install scipy==1.0.0
RUN pip install matplotlib==2.1.1

RUN useradd -ms /bin/bash docker
USER docker
