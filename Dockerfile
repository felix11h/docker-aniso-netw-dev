FROM ubuntu:16.04
MAINTAINER felix11h.dev@gmail.com

USER root

# installing the latest version of these basic packages 
# fixing versions through apt is possible, however previous
# versions are often not available and the build will fail
RUN apt-get -qy update
RUN apt-get install -qy python python-dev python-pip git screen

# installing fixed python package versions through pip from
# requirements.txt
RUN pip install --upgrade pip==9.0.1

# pip install from requirements replaces the below command to
# try and install exact versions:
# RUN pip install numpy scipy matplotlib sumatra gitpython \
#                 configparser nose ipython
COPY requirements.txt /requirements.txt
RUN pip install -r /requirements.txt


# the method of installing graph_tool is likely to change in the
# future, so this command might need to be updated if build fails
# refer to graph_tool documentation: https://graph-tool.skewed.de/
RUN echo "deb http://downloads.skewed.de/apt/xenial xenial universe" | tee -a /etc/apt/sources.list
RUN echo "deb-src http://downloads.skewed.de/apt/xenial xenial universe" | tee -a /etc/apt/sources.list

RUN apt-key adv --keyserver pgp.skewed.de --recv-key 612DEFB798507F25
RUN apt-get -qy update
RUN apt-get install -qy python-graph-tool

RUN apt-get install -qy texlive-full

RUN useradd -ms /bin/bash docker
USER docker
