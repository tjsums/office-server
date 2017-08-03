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
	firefox \
        fonts-wqy-microhei \
	imagemagick \
        language-pack-zh-hant language-pack-gnome-zh-hant firefox-locale-zh-hant libreoffice-l10n-zh-tw \
        python3-pip python3-dev build-essential \

    && apt-get autoclean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/*

RUN cd /usr/bin \
	&& ln -s pydoc3 pydoc \
	&& ln -s python3 python \
	&& ln -s pip3 pip \
	&& ln -s python3-config python-config

VOLUME '/var/file_base'

RUN pip install --upgrade pip \
    && pip install setuptools \
    && pip install pyoo \
    && pip install openpyxl \
    && pip install tornado \
    && pip install Wand


CMD soffice --nologo --norestore --invisible --headless --accept='socket,host=0,port=8997,tcpNoDelay=1;urp;'
