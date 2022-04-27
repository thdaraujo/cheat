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

To get an interactive list of keybindings:
```
SPC b b
```

To get a list of possible shortcuts on current major/minor modes:
```
SPC ?
```

## Buffers

- New buffer: `SPC b N` (meta buffer new)

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
