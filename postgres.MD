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

