FROM postgres:9.4
RUN localedef -i ru_UA -c -f UTF-8 -A /usr/share/locale/locale.alias ru_UA.UTF-8
ENV LANG ru_UA.utf8

COPY init-user-db.sh /docker-entrypoint-initdb.d/