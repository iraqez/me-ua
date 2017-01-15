FROM python:3.5

RUN apt-get update \
    && apt-get install locales \
    && localedef -i ru_UA -c -f UTF-8 -A /usr/share/locale/locale.alias ru_UA.UTF-8
ENV LANG ru_UA.utf8
WORKDIR /data/web
# Initialize
RUN mkdir -p /data/web
#COPY requirements.txt /data/web/

# Setup
#RUN apt-get update && apt-get upgrade && apt-get install python3 python3-dev python3-pip gettext bash postgresql-client libpq-dev libjpeg-dev -y
#RUN pip3 install --upgrade pip
#RUN pip3 install -r requirements.txt

# Clean
#RUN apk del -r python3-dev postgresql

# Prepare

RUN pip install proteus trytond

RUN pip install trytond_sale \
    && pip install trytond_analytic_sale \
    && pip install trytond_project \
    && pip install trytond_purchase \
    && pip install trytond_analytic_purchase

COPY . /data/web
COPY ./trytond.conf /etc/tryton/trytond.conf

RUN pip3 install -r requirements.txt
WORKDIR /data/web/present-me
RUN mkdir -p present-me/static/admin
