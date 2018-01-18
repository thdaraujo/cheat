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
