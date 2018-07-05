AWS DMS Tricks
---------------

1. DMS replication instance must be on the same VPC as the target (in case you want to connect directly)
2. Inbound rules on the vpc security settings must allow connection from the DMS replication instance, or else you're gonna get this stupid error:

```
RetCode: SQL_ERROR SqlState: 08001 NativeError: 101 Message: [unixODBC]timeout expired [122502] ODBC general error.]
```
