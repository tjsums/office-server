FROM ubuntu:16.04

ENV DEBIAN_FRONTEND noninteractive
ENV HOME /root

RUN dpkg --add-architecture i386

RUN apt-get update \
    && apt-get install -y software-properties-common \
    && add-apt-repository -y ppa:ubuntu-wine/ppa \
    && apt-get update \
    && apt-get install -y --force-yes --no-install-recommends \
        libreoffice \
        python-pip python-dev build-essential \

    && apt-get autoclean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/*
