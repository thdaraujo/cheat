# Copy and paste

Read from Mac OS X's pbcopy & pbpaste commands.
 
```ruby
  # paste into a variable
  s = IO.popen('pbpaste', 'r').read
  
  # copy contents from a variable
  stuff = "hey!"
  IO.popen('pbcopy', 'w') {|io| io.write(stuff)}
```
