from ubuntu:18.04
MAINTAINER cagojeiger@naver.com

ENV LC_ALL C.UTF-8
ENV TERM screen-256color

RUN apt-get update -y
RUN apt-get install git -y
RUN git clone https://github.com/kangheeyong/kyle_setting.git /home/kyle_setting

RUN apt-get install python3-pip -y
RUN apt-get install python3.7 -y
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.7 3
RUN python3 -m pip install --upgrade --force-reinstall pip

RUN pip3 install tensorflow==2.1
