CREATE USER test WITH PASSWORD 'test' CREATEDB;
CREATE DATABASE crystal_todo_test
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'en_US.utf8'
    LC_CTYPE = 'en_US.utf8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = 1

-- https://github.com/oxlb/docker-postgres-multiple-databases/blob/master/docker_postgres_init.sql