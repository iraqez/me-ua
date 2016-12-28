FROM mbsolutions/tryton-server:4.2
RUN localedef -i ru_UA -c -f UTF-8 -A /usr/share/locale/locale.alias ru_UA.UTF-8
ENV LANG ru_UA.utf8

COPY trytond.conf /etc/tryton/trytond.conf

#RUN sleep 10 && trytond-admin -c /etc/tryton/trytond.conf -d tryton --all && servise tryton-server restart

#COPY database_create.sh /docker-entrypoint-init.d/