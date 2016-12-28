#FROM debian:jessie
FROM meua_tryton
RUN apt-get update && apt-get install locales && localedef -i ru_UA -c -f UTF-8 -A /usr/share/locale/locale.alias ru_UA.UTF-8
ENV LANG ru_UA.utf8

RUN apt-get update && apt-get -y -q install python-setuptools python-pip python-lxml unoconv \
    && pip install 'trytond>=4.2,<4.3'

COPY trytond.conf /etc/tryton/trytond.conf

RUN echo workfree > /.trytonpassfile
ENV TRYTONPASSFILE /.trytonpassfile

#RUN apt-get -y -q install unoconv

#CMD ["-c", "/etc/tryton/trytond.conf", "-v"]
#ENTRYPOINT ["service trytond start"]