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

## Bisect

Find a revision that introduced a bug with [git-bisect](https://git-scm.com/docs/git-bisect):
```
$ git bisect start
$ git bisect bad                 # Mark current version as bad
$ git bisect good v2.6.13-rc2    # v2.6.13-rc2 is known to be good
```

Test code and mark version as either good or bad:
```
$ git bisect bad
## test the code...
$ git bisect good
```

Skip the current version if you can't test it:
```
$ git bisect skip
```

### `git-bisect` with a script
You can run bisect with a script that tests the code. If the script returns `exit 0`, it marks the revision as good:
```
$ git bisect run some_script arguments
```

Another example:
```
$ git bisect start HEAD HEAD~10 --   # culprit is among the last 10 revs (HEAD is bad, HEAD~10 is good)
$ git bisect run ~/some_test.sh      # executes some script on each rev
$ git bisect reset                   # quit the bisect session
```
