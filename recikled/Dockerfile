FROM mbsolutions/tryton-server:4.2
RUN localedef -i ru_UA -c -f UTF-8 -A /usr/share/locale/locale.alias ru_UA.UTF-8
ENV LANG ru_UA.utf8

RUN apt-get update && apt-get install -y \
    wget \
    && wget http://ftp.uk.debian.org/debian/pool/main/s/simpleeval/python-simpleeval_0.9.1-2_all.deb \
    && wget http://ftp.uk.debian.org/debian/pool/main/p/python-sql/python-sql_0.8-3_all.deb \
    && dpkg -i ./python-simpleeval_0.9.1-2_all.deb && dpkg -i ./python-sql_0.8-3_all.deb \
    && rm *.deb


## Install additional distribution packages
#RUN apt-get update && apt-get install -y \
#tryton-modules-sale \
#&& rm -rf /var/lib/apt/lists/*

COPY trytond.conf /etc/tryton/trytond.conf
#
#    && apt-get update && apt-get install -y tryton-modules-sale \
#    && rm -rf /var/lib/apt/lists/*

