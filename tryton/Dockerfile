FROM iraqez/tryton:4.2

RUN pip install trytond_sale \
    && pip install trytond_analytic_sale \
    && pip install trytond_project \
    && pip install trytond_purchase \
    && pip install trytond_analytic_purchase

RUN echo workfree > /.trytonpassfile
ENV TRYTONPASSFILE /.trytonpassfile


COPY trytond.conf /etc/tryton/trytond.conf
#COPY database_create_update.sh /docker-entrypoint-init.d/
