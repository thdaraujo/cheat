Apache Sqoop tips and tricks
----------------------------

Sqoop is a tool designed to transfer data between Hadoop and relational databases. You can use Sqoop to import data from a relational database management system (RDBMS) such as MySQL or Oracle into the Hadoop Distributed File System (HDFS), transform the data in Hadoop MapReduce, and then export the data back into an RDBMS.

Sqoop automates most of this process, relying on the database to describe the schema for the data to be imported. Sqoop uses MapReduce to import and export the data, which provides parallel operation as well as fault tolerance.

Full docs [here](https://sqoop.apache.org/docs/1.4.0-incubating/SqoopUserGuide.html)

# Copy json jars to hdfs on EMR - you might need it!

```
$ wget https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/org-json-java/org.json-20120521.jar
$ sudo cp org.json-20120521.jar /usr/lib/sqoop/lib/org.json-20120521.jar
```

# Sqoop jobs

List jobs:
```
$ sqoop job --list
> Available jobs:
>  my-sqoop-job  
```

Use the `parquet` file format instead of `csv` - they're better, easier to work with, compressed, and MUCH faster to read.

Run sqoop import directly (do you have free time?):
```
$ sqoop import \
--connect jdbc:postgresql://my-postgres-url:5432/my-db-name \
--username my-username -P \
--table "my-table" \
--target-dir /hadoop/my-table \
--as-parquetfile \
-m 1
```

Sqoop import all tables (JUST DO IT ALREADY!):
```
$ sqoop import-all-tables --connect jdbc:mysql://db.foo.com/corp
```

Create an import job - import table from postgres to hadoop as a parquet file:
```
$ sqoop job --create my-sqoop-job -- import \
--connect jdbc:postgresql://my-postgres-url:5432/my-db-name \
--username my-username -P \
--table "my-table" \
--target-dir /hadoop/my-table \
--as-parquetfile \
-m 1
```

Create a more complicated job:
- append instead of overwrite
- limit fetch size
- define the primary key column (partition column)
- map one column to a java string (stupid json parser!) (TODO fix json handling)
- run 8 workers in parallel

PS: Don't use more workers than free connections available (the `max_connections` config on your DB) 
or you're gonna get kicked out.

Usually, you're gonna be able to run 2, maybe 4 workers... 8 if you're lucky (Amazon Aurora). 
Yes, it's gonna be slow, depending on the size of your DB, but you should be able to copy 100~200GB per hour on AWS.

Job example:
```
$ sqoop job --create my-sqoop-job -- import \
--connect jdbc:postgresql://my-postgres-url:5432/my-db-name \
--username my-username -P \
--table "my-table" \
--split-by "id" \
--map-column-java my_column=String \
--incremental append \
--check-column id \
--fetch-size 10000 \
--target-dir /hadoop/my-table \
--as-parquetfile \
-m 8
```

Execute job in the background:
```
$ sqoop job --exec my-sqoop-job
```

View job:
```
$ sqoop job --show my-sqoop-job
```

Delete job:
```
$ sqoop job --delete my-sqoop-job
```
