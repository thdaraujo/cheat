# kubectl

## Operations

Set current context:
```shell
$ kubectl config set-context --current --namespace=foo
```

Pods:
```shell
$ kubectl get pods
$ kubectl get pods -A 
$ kubectl get pods -n foo
```

Logs:
```shell
$ kubectl logs some-pod-name
$ kubectl logs some-pod-name -n foo
```

Exec into a pod:
```shell
$ kubectl exec -it some-pode-name -- /bin/bash
```

Check pod env:
```
kubectl exec pod-name env
```

Run a postgres one-off psql container:
```shell
$ kubectl run shell-pod --rm -i --tty --image ubuntu -- bash

root@shell-pod:/# $ apt-get update && apt-get install postgresql-client
root@shell-pod:/# $ psql ...
```
