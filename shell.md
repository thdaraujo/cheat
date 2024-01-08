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
- `zgrep "PATTERN" $(find . -name "*.gz")` greps all gzipped files in current directory

# jq (json parsing on the command line)

count json delimited logs with timestamps per hour:
`$ cat somefile.json | jq ".timestamp" | cut -c1-14 |  uniq -c`

or simply:
`$ cat somefile.json | jq ".timestamp" | uniq -w14 -c`
(`uniq -wXX`, where *XX* is the number of characters to use in the uniq)



