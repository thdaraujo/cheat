Apache Spark tips (pyspark)
---------------------------

Full docs [here](https://spark.apache.org/docs/latest/)

# Installing

You can install python and spark with [asdf](https://github.com/asdf-vm/asdf)

```
$ asdf plugin-add python
$ asdf install python 3.6.4
$ asdf global python 3.6.4

```

```
$ asdf plugin-add spark
$ asdf install spark 2.3.0
$ asdf global spark 2.3.0
```

You might also want to install java, scala, sbt and maven using asdf too, depending on which tools you need.

# Running the shell

```
$ pyspark
$ spark-shell
```

# Running a job/script

Your script/spark program should look a little like this:

```python
# my-script.py

from __future__ import print_function
from pyspark import SparkContext, SparkConf
from pyspark.sql import SparkSession, SQLContext

if __name__ == "__main__":
    """Executes program
       Usage: spark-submit my-script.py
    """
    
    spark = SparkSession\
            .builder\
            .appName("My cool script")\
            .getOrCreate() 
    
    sc = spark.sparkContext
    sqlContext = SQLContext(sc) # for Spark SQL stuff - pretty handy

    df = spark.read.json("some-file.json")
    df.show()
    
    # Finish
    spark.stop()
    
```

To run the script:
```
$ spark-submit my-script.py
```

# Import package dependencies

Whenever you want to add some package dependencies (like jdbc+postgres) without creating a scala sbt project or maven project, you can just import them 
directly when you run `spark-shell` or `spark-submit`:

```
$ spark-submit --packages org.postgresql:postgresql:9.4.1212 my-script.py
$ pyspark --packages org.postgresql:postgresql:9.4.1212,org.elasticsearch:elasticsearch-hadoop:6.3.1
```

Or import the jar files directly:
```
$ pyspark --jars myCoolLib.jar
```


# Loading data

`TODO load data from S3...`

# Writing data

`TODO write data to S3...`

