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

Quit:
```
SPC q q
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

## Yanking

Copy word:
```
y i w
```

Mark whole buffer:
```
C-h x
```

Copy whole buffer:
```
C-h x y
```

Surround word with something (yank surround ...):
```
ysiw
```

## Commenting

Comment:
```
gcc
```

## Jumping around

Search and jump on the current line with `f`:
```
fa
fb
```

Search for `hello` and jump on the current line with `s` + 2 characters:
```
she
slo
```

Jump forward (`forward-sexp`):
```
C-M-f
```

Jump backwards:
```
C-M-b
```

Jump to matching:
```
%
```


## Selecting

To enter visual selection mode (evil-visual-char):
```
v
```

To select a rectangle (evil-visual-block):
```
C-v
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

Open project tab:
```
SPC o p
```

Find file in project tab:
```
SPC o p
```

## Files

Find file in project with fuzzy search:
```
SPC .
SPC SPC
```

## Search

You can search in project by using `SPC s p`.

*Filtering results*

You can pass arguments to ripgrep by adding `--` to your search.

Filter by file type:
```
-- -t ruby
```

Filter by specific extension:
```
foo -- -g *.js

# multiple filters:
foo -- -g {*.rb,*spec.rb}
```

[List of ripgrep supported file types](https://github.com/BurntSushi/ripgrep/blob/master/GUIDE.md#manual-filtering-file-types)

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

Create branch and checkout `(magit-branch-and-checkout)`:
```
SPC g c b
```

Spinoff branch `(magit-branch-spinoff)` - create and checkout new branch off of current one, and reset current branch to upstream:

Spinout branch `(magit-branch-spinout)` - this command behaves like `magit-branch-spinoff`, except that it does not change the current branch:

Pull:
```
SPC g F
```



## Buffers

New buffer:
```
SPC b N
```

Switch to other buffer:
```
SPC b b
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

### Jump with evil-snipe

When the word is close, use evil-snipe (`s`).

Jump to text with `s` and start typing the characters of the word you want to jump to.
`S` jumps backwards.
  `,` to cycle to previous matches
  `;` to cycle through later matches.

When the word is farther away or in other window, use Avy (`g s SPC`):

use `gs SPC` and type the word to jump or disambiguate.

To select words, use snipe and `v`.


### To edit buffer matches across different files

Edit all files:
```
C-c C-e
```

Finish/commit changes:
```
C-c C-c
```

Abort changes:
```
C-c C-k
```

### Multiple cursors

You can use [evil-mc](https://github.com/gabesoft/evil-mc) and [evil-multiedit](https://github.com/hlissner/evil-multiedit).

#### `evil-multiedit`:

Select what you want to edit and press `R`.

Move cursor over one word and press `M-d` and `M-D` to select next or previous example.

Move between regions with `C-n` and `C-p`. `RET` removes selection of current region.

Once you select the regions, edits made to one region will apply to all of them.

Press `ESC` or `C-[` to exit evil-multiedit.

#### `evil-mc`:

`gzm` to create cursors for the word at point.
`gzd` to create cursor at point and move to next match.
`gzz` to create cursor at point.

TODO...

#### Search and replace files

```
SPC s p foo C-; E C-c C-p :%s/old/new/g RET Z Z
```

- `SPC s p foo`: Find lines of files in project containing `foo`
- `C-;`: embark-act
- `E`: export to new buffer
- `C-c C-p`: makes search result writable
- `:%s/old/new/g`: evil search and replace
- `ZZ`: save and close buffer

[ref](https://descore.dk/posts/emacs/search-and-replace-in-doom-emacs/)



## Source code

`gd` or `SPC c d` to go to definition.
`gD` or `SPC c D` to list references to symbol at point.
`K` for documentation.


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
## Terminal

Toggle vterm: 
```
SPC o t
```

Open vterm:
```
SPC o T
```

## Languages

### Ruby

See [modules/lang/ruby](https://github.com/hlissner/doom-emacs/blob/master/modules/lang/ruby) for more info.

### Elixir

See [modules/lang/elixir](https://github.com/doomemacs/doomemacs/tree/master/modules/lang/elixir) for more info.


Start project repl (alchemist iex):
```
SPC m i
```

Format buffer:
```
SPC m f
```

Run all tests
```
SPC m t a
```

Toggle between file and test:
```
SPC m t T
```

Toggle between file and test other window:
```
SPC m t t
```

Exunit rerun:
```
SPC m t r
```

## Rspec Mode

### Use Spring

```elisp
;; in ~/.doom.d/config.el

;; ruby + spring - customize command
(after! rspec-mode
  (setq rspec-spec-command "bin/rspec"))
```

## References

- [NoelWelsh doom-emacs](https://noelwelsh.com/posts/doom-emacs/)
- [Default keybindings](https://github.com/hlissner/doom-emacs/blob/develop/modules/config/default/+evil-bindings.el)
- [evil-multiedit](https://www.youtube.com/watch?v=zXdT5jY_ui0)
