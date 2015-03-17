FROM klevo/percona

MAINTAINER ServiceRocket Tools

RUN wget -O- -q http://s3tools.org/repo/deb-all/stable/s3tools.key | apt-key add - \
    && wget -O/etc/apt/sources.list.d/s3tools.list http://s3tools.org/repo/deb-all/stable/s3tools.list \
    && apt-get -qq update \
    && apt-get install -y supervisor s3cmd

COPY config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY config/s3cfg.config /root/.s3cfg

ADD scripts/ /usr/local/bin/


CMD ["/usr/bin/supervisord"]
