FROM python:3.5

RUN apt-get update \
    && apt-get install locales \
    && localedef -i ru_UA -c -f UTF-8 -A /usr/share/locale/locale.alias ru_UA.UTF-8
ENV LANG ru_UA.utf8