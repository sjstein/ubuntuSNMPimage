FROM ubuntu

ENV HOME=/root

RUN ln -snf /usr/share/zoneinfo/$CONTAINER_TIMEZONE /etc/localtime && echo $CONTAINER_TIMEZONE > /etc/timezone;


RUN set -eux; \
	apt update; \
	apt upgrade -y; \
	apt install -y \
		gcc \
		g++ \
		git \
		libssl-dev \
		libnl-3-dev \
		libnl-route-3-dev \
		libperl-dev \
		libtool \
		make \
		net-tools \
		pkg-config \
		vim \
	;

RUN set -eux; \
	mkdir $HOME/dev ;\
	cd $HOME/dev ;\
	git clone  https://github.com/net-snmp/net-snmp.git;\
	cd net-snmp \
	;

COPY config.status $HOME/dev/net-snmp/

RUN set -eux; \
	cd $HOME/dev/net-snmp ;\
	ls ;\
	sh config.status ;\
	make ;\
	make install; \
	ldconfig \
	;

EXPOSE 161
EXPOSE 162
