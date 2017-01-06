FROM postgres:9.5
MAINTAINER Cameron Manderson <cameronmanderson@gmail.com>

RUN localedef -i en_AU -c -f UTF-8 -A /usr/share/locale/locale.alias en_AU.UTF-8
ENV LANG en_AU.utf8

ENV POSTGIS_MAJOR 2.2
ENV POSTGIS_VERSION 2.2

RUN apt-get update \
      && apt-get install -y --no-install-recommends --fix-missing \
                 postgresql-9.5-postgis-2.2 \
                 osm2pgsql \
                 osmosis \
      && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /docker-entrypoint-initdb.d
COPY ./initdb-postgis.sh /docker-entrypoint-initdb.d/postgis.sh

RUN mkdir -p /data/import

# Add VOLUMEs to allow backup of config, logs and databases
VOLUME ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]

EXPOSE 5432
