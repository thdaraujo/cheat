(Doom) Emacs tips and tricks
----------------------------

Emacs Tips
==========

# Installation
See [doom-emacs installation](https://github.com/hlissner/doom-emacs#install)

## Emacs Client Launcher

Add to `~/.bash_profile` or `~/.bashrc`:
```
$ alias ec='emacsclient --no-wait -c -a emacs "$@"'
$ source ~/.bash_profile
```

Open files:
```
$ ec filename
```

Kill frame:
```
M-x q z
```

## Cheatsheets
TODO

## Keybindings

To get an interactive list of keybindings (counsel-descbinds):
```
SPC b b
```

To get a list of possible shortcuts on current major/minor modes:
```
SPC ?
```

To know what a key sequence does in the current context (helpful-key), run:
```
SPC h k
```

Meta-x:
```
SPC :
M-x
```

## Workspaces

Find project/workspace:
```
SPC p p
```

Switch workspace:
```
SPC TAB .
```

Load workspace from file:
```
SPC TAB l
```

Create new workspace:
```
SPC TAB n
```

Rename workspace:
```
SPC TAB r
```

Save workspace:
```
SPC TAB s
```

## Files

Find file in project with fuzzy search:
```
SPC .
SPC SPC
```

## Files

Load recently viewed files:
```
SPC f r
```

## Magit

Magit status:
```
SPC g g
```

Stage file:
```
SPC g S
```



## Buffers

New buffer:
```
SPC b N
```

Switch to buffer outside current project:
```
SPC b B
```

## Finding text

Search project:
```
SPC s p
```

Search buffer:
```
/
```

Then `n` for next, and `N` for previous.

### To edit buffer matches across different files

Edit all files:
```
C-c C-e
```

Save changes:
```
C-c C-c
```

Abandon changes:
```
C-c C-k
```


## Macros

- Record macro (evil-mode): `q a`
- Stop recording macro: `q`
- Run last macro: `@ a`
- Run macro 100 times: `100 @ a` (similar to `C-u 100 @ a`)

## Functions

- Eval last function or sexp: `C-x C-e`
- Eval and print last sexp:  `C-j`
- Describe function: `C-h f`
- Describe key or command: `C-h k [some key combination]`
- View lossage - list of commands entered/executed: `C-h l`


## Set emacs as default editor

```
# ~/.bashrc
export EDITOR="emacs -nw"
export VISUAL=$EDITOR
```

## Languages

### Ruby

See [modules/lang/ruby](https://github.com/hlissner/doom-emacs/blob/master/modules/lang/ruby/README.org)


## References

- [NoelWelsh doom-emacs](https://noelwelsh.com/posts/doom-emacs/)
