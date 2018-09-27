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


# Performance and pg_stats

(see this [interesting reference](http://okigiveup.net/what-postgresql-tells-you-about-its-performance/))
Ratio of cache hits to total reads (should be close to 1):
```
SELECT blks_hit::float/(blks_read + blks_hit) as cache_hit_ratio
FROM pg_stat_database
WHERE datname=current_database();
```

Ratio of index scans (should be close to 1):
```
SELECT sum(idx_scan)/(sum(idx_scan) + sum(seq_scan)) as idx_scan_ratio
FROM pg_stat_all_tables
WHERE schemaname='public';
```

More detailed: 
```
SELECT relname,idx_scan::float/(idx_scan+seq_scan+1) as idx_scan_ratio
FROM pg_stat_all_tables
WHERE schemaname='public'
ORDER BY idx_scan_ratio ASC;
```


Slow queries:
```
select queryid, total_time, (total_time::float/calls) as mean_time, left(query,40) as short_query from pg_stat_statements order by total_time desc limit 10;
```

Show running queries:
```
SELECT pid, age(clock_timestamp(), query_start), usename, query 
FROM pg_stat_activity 
WHERE query != '<IDLE>' AND query NOT ILIKE '%pg_stat_activity%' 
ORDER BY query_start desc;
```


User tables:
```
SELECT * FROM pg_stat_user_tables;
```

Locks:
```
SELECT locktype, database, relation::regclass, mode, pid FROM pg_locks;
```

Size of tables:
```
SELECT 
       relname AS "table_name", 
       pg_size_pretty(pg_table_size(C.oid)) AS "table_size" 
FROM 
       pg_class C 
LEFT JOIN pg_namespace N ON (N.oid = C.relnamespace) 
WHERE nspname NOT IN ('pg_catalog', 'information_schema') AND nspname !~ '^pg_toast' AND relkind IN ('r') 
ORDER BY pg_table_size(C.oid) 
DESC LIMIT 10;
```

