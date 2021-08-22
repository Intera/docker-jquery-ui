FROM ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive
ENV LANG C.UTF-8

RUN apt-get update
RUN apt-get -y dist-upgrade
RUN apt-get install -y curl build-essential git xsltproc imagemagick

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && apt-get install -y nodejs

RUN npm install -g grunt-cli

RUN useradd -s /bin/bash -m localuser

USER localuser

WORKDIR /home/localuser

RUN curl -sL https://github.com/jquery/download.jqueryui.com/archive/main.tar.gz > jquery-ui.tar.gz \
    && tar -xzf jquery-ui.tar.gz \
    && mv download.jqueryui.com-main jquery-ui

WORKDIR /home/localuser/jquery-ui

RUN npm install

RUN grunt prepare

COPY patches/fix-basename-calls.diff /home/localuser/patches/fix-basename-calls.diff
RUN patch -p0 < /home/localuser/patches/fix-basename-calls.diff

USER root

RUN apt-get purge -y curl build-essential \
    && apt-get --purge -y autoremove \
	&& apt-get autoclean \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

RUN rm /home/localuser/jquery-ui.tar.gz

USER localuser

CMD ["/usr/bin/node", "server.js", "--host", "0.0.0.0", "--console"]
EXPOSE 8088/tcp
