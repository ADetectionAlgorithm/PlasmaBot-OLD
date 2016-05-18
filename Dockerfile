FROM ubuntu:14.04


MAINTAINER ADetectionAlgorithm

#Install dependencies
RUN apt-get update -y && apt-get upgrade -y \
        &&  apt-get install software-properties-common -y \
        &&  add-apt-repository ppa:fkrull/deadsnakes -y \
        &&  add-apt-repository ppa:mc3man/trusty-media -y \
        &&  apt-get install build-essential unzip -y \
        &&  apt-get install git -y \
        &&  apt-get install vim -y \
        &&  apt-get install python3.5 python3.5-dev -y \
        &&  apt-get install ffmpeg -y \
        &&  apt-get install libopus-dev -y \
        &&  apt-get install libffi-dev -y \
        &&  apt-get install libsodium-dev -y

#Install Pip
RUN  apt-get install wget \
    && wget https://bootstrap.pypa.io/get-pip.py \
    &&  python3.5 get-pip.py

#Clone the bot into /musicBot
RUN  git clone https://github.com/PlasmaRobotics2403/PlasmaBot.git musicBot \
        && cd musicBot \
        && git checkout review

WORKDIR /musicBot

#Install PIP dependencies
RUN  pip install -r requirements.txt

#Add volume for configuration
VOLUME /musicBot/config

CMD python3.5 run.py