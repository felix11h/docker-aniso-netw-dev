FROM ubuntu:16.04
MAINTAINER felix11h.dev@gmail.com

USER root

RUN apt-get -qy update
RUN apt-get install -qy apt-utils=1.2.24 python=2.7.11-1 python-dev=2.7.11-1 \
                        python-pip=8.1.1-2ubuntu0.4 git=1:2.7.4-0ubuntu1.3 \
			screen=4.3.1-2build1

RUN pip install --upgrade pip==9.0.1
RUN pip install numpy scipy matplotlib sumatra gitpython configparser nose ipython
# later install through
# pip install -r requirements.txt

RUN echo "deb http://downloads.skewed.de/apt/xenial xenial universe" | tee -a /etc/apt/sources.list
RUN echo "deb-src http://downloads.skewed.de/apt/xenial xenial universe" | tee -a /etc/apt/sources.list

RUN apt-key adv --keyserver pgp.skewed.de --recv-key 612DEFB798507F25
RUN apt-get -qy update
RUN apt-get install -qy python-graph-tool

RUN apt-get install -qy texlive-full

RUN useradd -ms /bin/bash docker
USER docker
