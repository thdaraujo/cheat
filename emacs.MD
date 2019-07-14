(SPACE)Emacs tips and tricks
----------------------------

Emacs Tips
==========

# Installation

## Install spacemacs on MacOS:
 ```
$ brew tap d12frosted/emacs-plus
$ brew install emacs-plus [options]
$ ln -s /usr/local/opt/emacs-plus/Emacs.app /Applications
```

## Install font source code pro

```
$ brew tap homebrew/cask-fonts && brew cask install font-source-code-pro
```

## Emacs Client Launcher

Add to `~/.bash_profile`:
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

# Buffers

- New buffer: `SPC b N` (meta buffer new)
- Copy whole buffer: `SPC b Y` (meta buffer Yank)

# Macros

- Record macro (evil-mode): `q a`
- Stop recording macro: `q`
- Run last macro: `@ a`
- Run macro 100 times: `100 @ a` (similar to `C-u 100 @ a`)

# Functions

- Eval last function or sexp: `C-x C-e`
- Eval and print last sexp:  `C-j`
- Describe function: `C-h f`
- Describe key or command: `C-h k [some key combination]`
- View lossage - list of commands entered/executed: `C-h l`
