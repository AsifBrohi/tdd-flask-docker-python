# pull official base image postgres

FROM postgres:16

# run create.sql on init

ADD create.sql /docker-entrypoint-initdb.d
