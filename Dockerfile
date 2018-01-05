FROM ubuntu:16.04
MAINTAINER felix11h.dev@gmail.com

USER root

RUN apt-get update
RUN apt-get install -y python3 python3-dev python3-pip git

RUN pip install numpy scipy sympy

RUN useradd -ms /bin/bash docker
USER docker
