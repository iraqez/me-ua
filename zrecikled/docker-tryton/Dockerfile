FROM debian:jessie
MAINTAINER Volodimir Gumenyuk <vladimir.gumenyuk@gmail.com>

# Set Tryton major variable for reuse
ENV T_DIST jessie
ENV T_MAJOR 4.2

RUN apt-get update && apt-get install locales \
    && localedef -i ru_UA -c -f UTF-8 -A /usr/share/locale/locale.alias ru_UA.UTF-8 && useradd tryton
ENV LANGUAGE ru_UA.UTF-8
ENV LANG ru_UA.UTF-8
ENV LC_ALL ru_UA.UTF-8

#RUN useradd tryton

RUN gpg --keyserver pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4
RUN apt-get update && apt-get install -y --no-install-recommends \
	curl ca-certificates locales \
	&& rm -rf /var/lib/apt/lists/* \
	&& curl -o /usr/local/bin/gosu -SL "https://github.com/tianon/gosu/releases/download/1.2/gosu-$(dpkg --print-architecture)" \
	&& curl -o /usr/local/bin/gosu.asc -SL "https://github.com/tianon/gosu/releases/download/1.2/gosu-$(dpkg --print-architecture).asc" \
	&& gpg --verify /usr/local/bin/gosu.asc \
	&& rm /usr/local/bin/gosu.asc \
	&& chmod +x /usr/local/bin/gosu \
	&& apt-get purge -y --auto-remove curl ca-certificates

RUN apt-get update && apt-get -y -q install python-setuptools \
                    python-pip \
                    python-lxml \
                    unoconv \
                    python-psycopg2 \
                    python-levenshtein \
                    python-bcrypt \
                    python-pydot \
                    python-psycopg2 \
                    ssl-cert \

    && pip install 'trytond>=4.2,<4.3'
#    && pip install trytond_sale \
#    && pip install trytond_analytic_sale \
#    && pip install trytond_project

#COPY trytond.conf /etc/tryton/trytond.conf

#RUN echo workfree > /.trytonpassfile
#ENV TRYTONPASSFILE /.trytonpassfile

# Default environment for the server
ENV TRYTOND_CONFIG=/etc/tryton/trytond.conf
#ENV TRYTOND_DATABASE_URI=sqlite://
#ENV TRYTOND_DATA=/var/lib/tryton

RUN mkdir /docker-entrypoint-init.d

EXPOSE 	8000

COPY docker-entrypoint.sh /
RUN chmod a+x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["trytond"]