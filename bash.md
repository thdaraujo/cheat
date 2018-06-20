Bash Tips
-------------

# Folders size

Check subfolders size:

`$ sudo du -sh ./* `

# Freezing command

- `ctrl + z` freezes current process
- `bg` sends process to the background
- `fg` moves it back into the foreground
- `jobs` lists user processes

# Tmux

Terminal Multiplexer - keeps active session running on remote servers (via ssh, for example).
Install with `$ brew install tmux`.
More tips [here](https://danielmiessler.com/study/tmux/)

- Connect to remote server via ssh and do:
- `$ tmux` to start tmux session
- `$ tmux ls` lists active terminal sessions or `CTRL+B s`
- `$ tmux new -s session-name` creates a new session with name `<session-name>`
- `$ tmux attach` opens current sesssion
- `$ tmux a` attaches to first available session
- `$ tmux a -t session-name` attaches to `<session name>`
- `$ tmux attach -t 0` to attach to session `0`
- `$ tmux detach` or `CTRL+B d` detaches from session
- `$ tmux kill-session -t 0` to kill session `0`

## Window management

- Press `CTRL+B %` to split windows vertically
- Press `CTRL+B "`. to split windows horizontally
- Press `CTRL+B <arrow>` to move between windows (you can also use `n` and `p` for next and previous
- Press `CTRL+B z` to maximize current window
- Press `CTRL+B c` to create new window
- Press `CTRL+B 0` to move to window `0`
- Press `CTRL+B x` kills current pane
- Press `CTRL+B d` to detach from current session
