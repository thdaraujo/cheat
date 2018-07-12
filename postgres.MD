# Postgres tips

## PSQL

Open psql and connect to a database:

```
$ psql -d database_name --username=username
``` 

Example:
```
$ psql -d postgres --username=username
```

Connect to a database while on psql: 

```
pqsl$ \c database_name
``` 

Display display one column per line (for readability):
```
\x
SELECT * FROM foo... ;
\x
```

## Docker

Running postgres on a docker container and exposing the port to localhost:
```
$ docker run --name postgres-docker -d -p <localhost-port>:<container-port-to-expose> -e POSTGRES_PASSWORD=<password> postgres:alpine
```

Example:
```
$ docker run --name post1 -d -p 5432:5432 -e POSTGRES_PASSWORD=123 postgres:alpine

$ psql -h localhost -p 5432 -U postgres

```

# Tables and object sizes

refs: [Check size of tables and objects in PostgreSQL](https://wiki-bsse.ethz.ch/display/ITDOC/Check+size+of+tables+and+objects+in+PostgreSQL+database)

Select the size of all tables:
```
SELECT
   relname as "Table",
   pg_size_pretty(pg_total_relation_size(relid)) As "Size",
   pg_size_pretty(pg_total_relation_size(relid) - pg_relation_size(relid)) as "External Size"
   FROM pg_catalog.pg_statio_user_tables ORDER BY pg_total_relation_size(relid) DESC;
```

Size of objects, entries (rows) and its type (r for table, i for index, t for toast data):
```
SELECT
   relname AS objectname,
   relkind AS objecttype,
   reltuples AS "#entries", pg_size_pretty(relpages::bigint*8*1024) AS size
   FROM pg_class
   WHERE relpages >= 8
   ORDER BY relpages DESC;
```

# Read-only user

```
CREATE ROLE some_user WITH LOGIN PASSWORD 'SOME-LONG-PASSWORD-HERE' 
NOSUPERUSER INHERIT NOCREATEDB NOCREATEROLE NOREPLICATION VALID UNTIL 'infinity';

GRANT CONNECT ON DATABASE mydb TO some_user;
GRANT USAGE ON SCHEMA public TO some_user;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO some_user;
GRANT SELECT ON ALL SEQUENCES IN SCHEMA public TO some_user;
```
