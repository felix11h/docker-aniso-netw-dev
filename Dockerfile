FROM ubuntu:16.04
MAINTAINER felix11h.dev@gmail.com

USER root

RUN apt-get update
RUN apt-get install -y apt-utils python python-dev python-pip git screen

RUN pip install --upgrade pip==9.0.1
RUN pip install numpy scipy matplotlib sumatra gitpython
# later install through
# pip install -r requirements.txt

RUN echo "deb http://downloads.skewed.de/apt/xenial xenial universe" | tee -a /etc/apt/sources.list
RUN echo "deb-src http://downloads.skewed.de/apt/xenial xenial universe" | tee -a /etc/apt/sources.list

RUN apt-key adv --keyserver pgp.skewed.de --recv-key 612DEFB798507F25
RUN apt-get update
RUN apt-get install -y python-graph-tool

RUN apt-get install -y texlive texlive-science

RUN useradd -ms /bin/bash docker
USER docker
