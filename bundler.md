Bundler Cheatsheet
==================

## Debugging a gem

1. `bundle show [GEM-NAME]` or `gem which [GEM-NAME]` to get path to gem.
2. Open file on editor `bundle open [GEM-NAME]`
3. Insert breakpoint for debugging (pry or debugger)
4. Run `bundle pristine` to restore all gems to their cached version

If you want to use a specific editor, you have to set the `$EDITOR` or `$VISUAL` env variables.
