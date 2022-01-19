FROM ubuntu:20.04

MAINTAINER FND <fndemers@csfoy.ca>

ENV TERM=xterm\
    TZ=America/Toronto\
    DEBIAN_FRONTEND=noninteractive

RUN apt -y update
RUN apt-get -y upgrade

RUN apt install apt-utils

# Python 3.8.10 (Ubuntu 20.04.x)
RUN apt install -y python3 python3-dev python-is-python3

# Timezone Toronto
RUN apt-get install -yq tzdata && \
    ln -fs /usr/share/zoneinfo/$TZ /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata

RUN apt clean autoclean
RUN apt autoremove --yes
RUN rm -rf /var/lib/{apt,dpkg,cache,log}/

