FROM postgres:latest

WORKDIR /docker-entrypoint-initdb.d

COPY /sql-files/*.sql ./