#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    --TRYTON db
    CREATE USER tryton PASSWORD 'tryton';
    CREATE DATABASE tryton;
    GRANT ALL PRIVILEGES ON DATABASE tryton TO tryton;

    --DJANGO db
    CREATE USER django PASSWORD 'django';
    CREATE DATABASE django;
    GRANT ALL PRIVILEGES ON DATABASE django TO django;
EOSQL