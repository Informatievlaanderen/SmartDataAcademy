FROM postgis/postgis

COPY init_db.sql /docker-entrypoint-initdb.d/01-init_db.sql
COPY telraam.sql /docker-entrypoint-initdb.d/02-telraam.sql
COPY gipod.sql /docker-entrypoint-initdb.d/03-gipod.sql