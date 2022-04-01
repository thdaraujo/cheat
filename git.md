## Rebase

Interactively rebase the last 10 commits:
```shell
$ git rebase -i HEAD~10
```

## Cloning

Shallow clone:
```
$ git clone --depth 1 [remote-url]
```

Shallow clone and shallow submodule clone:
```
$ git clone --depth 1 --recurse-submodules --shallow-submodules [remote-url]
```
