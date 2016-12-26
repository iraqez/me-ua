#http://tryton.alioth.debian.org/mirror.html

FROM debian

MAINTAINER Dockerfiles

#RUN cd /etc/apt && wget http://debian.tryton.org/debian/debian.tryton.org-archive.asc && apt-key add debian.tryton.org-archive.asc \
#    cd /etc/apt/sources.list.d && wget http://debian.tryton.org/debian/tryton-stretch-4.2.list \
#    apt-get update && apt-get install tryton-server

# Do not use Recommends (otherwise Tryton packages will install postgresql)
# Grab gosu for easy step-down from root
# (gosu snippets taken from https://github.com/docker-library/postgres/blob/master/9.4/Dockerfile)
# Add key and sources for gosu and debian.tryton.org
RUN gpg --keyserver pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4
RUN apt-get update && apt-get install -y --no-install-recommends \
	curl ca-certificates locales \
	&& rm -rf /var/lib/apt/lists/* \
#	&& curl -o /usr/local/bin/gosu -SL "https://github.com/tianon/gosu/releases/download/1.2/gosu-$(dpkg --print-architecture)" \
#	&& curl -o /usr/local/bin/gosu.asc -SL "https://github.com/tianon/gosu/releases/download/1.2/gosu-$(dpkg --print-architecture).asc" \
#	&& gpg --verify /usr/local/bin/gosu.asc \
#	&& rm /usr/local/bin/gosu.asc \
#	&& chmod +x /usr/local/bin/gosu \
	&& curl -o /etc/apt/debian.tryton.org-archive.asc -SL "http://debian.tryton.org/debian/debian.tryton.org-archive.asc" \
	&& apt-key add /etc/apt/debian.tryton.org-archive.asc \
	&& curl -o /etc/apt/sources.list.d/tryton-$T_DIST-$T_MAJOR.list http://debian.tryton.org/debian/tryton-$T_DIST-$T_MAJOR.list \
	&& curl -o /etc/apt/preferences.d/debian.tryton.org.pref -SL "http://debian.tryton.org/debian/debian.tryton.org.pref" \
	&& localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8 \
	&& apt-get purge -y --auto-remove curl ca-certificates

# Install additional distribution packages
RUN apt-get update && apt-get install -y --no-install-recommends \
	python-psycopg2 \
	python-levenshtein \
	python-bcrypt \
	python-pydot \
	python-psycopg2 \
	ssl-cert \
	tryton-server \
	unoconv \
	&& rm -rf /var/lib/apt/lists/*

CMD ["trytond"]