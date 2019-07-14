Emacs Tips
==========

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
