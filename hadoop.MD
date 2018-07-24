# Folder/file management

List files:
```
hdfs dfs -ls /hadoop/some-folder
```

Read whole file (cat):
```
hdfs dfs -cat /hadoop/some-folder/some-file.parquet
```

Read tail of file:
```
hdfs dfs -tail /hadoop/some-folder/some-file.parquet
```

Copy file
```
hdfs dfs -cp /hadoop/file1 /hadoop/file2 /hadoop/dir
```

Create folder:
```
hadoop fs -mkdir /user/saurzcode/dir1 /user/saurzcode/dir2
```

Delete file:
```
hdfs dfs -rm /some-folder/some-file
```

Remove deleted files(empty deleted trash):
```
hdfs dfs –expunge
```

Check checksum:
```
hadoop fs -checksum /hadoop/some-file
```

Count files/directories:
```
hdfs dfs -count hdfs://nn1.example.com/file1 hdfs://nn2.example.com/file2
```

Check folder/file sizes/disk usage (in GB):
```
hdfs dfs -du -h /hadoop/some-folder
```

Disk free space:
```
hdfs dfs -df -h
```

Distributed file copy (to s3):
```
hadoop distcp some-folder s3n://some-bucket/some-folder
```


