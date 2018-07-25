Shell/bash/terminal Tips
------------------------

# Folders size

Check subfolders size:

`$ sudo du -sh ./* `

# Freezing command

- `CTRL+Z` freezes current process
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

# Logs and file digging

Log digging and file processing (more tips [data science at the command line](https://www.datascienceatthecommandline.com))
- `$ head -n 10 filename.log` reads the first `10` lines from `filename`
- `$ tail -n 10 filename.log` reads the last `10` lines from `filename`
- `$ tail -n 10 filename.log | grep -i error` pipes the tail into `grep`
- `$ grep -i error filename.log` case-insensitive search
- `$ grep -o "error.*"` highlights matches 
- `$ cat filename.csv | awk -F "," '{OFS="\t"; print $4 }'` `awk` splits rows into comma-separated values and prints column $4
- `$ cat filename.csv | cut -c1-10` truncates the line (cuts) getting from the 1st to the 10th character
- `$ cat filename.log | wc -l` counts lines (`wordcount -line`)
- `$ cat filename.log | sort` sorts alphabetically
- `$ cat filename.log | sort | uniq -c` groups by and counts
- `$ cat filename.log | sort | uniq -c | sort -nr` group by, count, and sort by count
- `$ zcat filename.csv.gz` reads gzipped file content
