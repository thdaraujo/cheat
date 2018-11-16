SFTP
-----

References: [tecmint - 10 sFTP Command Examples](https://www.tecmint.com/sftp-command-examples/)

# Working with SFTP on linux

## Connect

```
$ sftp username@ftp.example.com
> (password): ******
> Connected to ftp.example.com.
sftp> 
```

## List files/folders
On remote
```
sftp> ls
> foo/
> bar/
```

On local
```
sftp> ls
> local-folder/
> etc/
```

## Changing folders
On remote
```
sftp> cd foo
sftp> ls
> somefile.zip
```

On local
```
sftp> lcd ~/Desktop
```

## Download files
One file
```
sftp> get somefile.zip
> Fetching /foo/somefile.zip to somefile.zip                5%  103MB 395.3KB/s 1:18:48 ETA
```

Multiple files
```
sftp> mget *.zip
```

## Uploading files
```
sftp> put some-local-file.zip
Uploading some-local-file.zip /foo/some-local-file.zip
```

Multiple files:
```
sftp> mput *.zip
```

## Exit shell

```
sftp> !

[root@sftp ~]# exit
Shell exited with status 1
sftp>
```
