FROM openfrontier/gerrit:2.12.3

ENV DATABASE_TYPE postgresql
ENV DB_PORT_5432_TCP_ADDR postgres
ENV DB_ENV_POSTGRES_DB reviewdb
ENV DB_ENV_POSTGRES_USER gerrit2
ENV DB_ENV_POSTGRES_PASSWORD gerrit

COPY docker-entrypoint-init.d/* /docker-entrypoint-init.d/
