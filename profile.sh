#!/usr/bin/env bash

# run your java process in the [background](https://stackoverflow.com/a/12108646/771112)
java -jar target/yourjar.jar yourpackage.entryclass > log.txt &

# get the process id of the last background job
jpid="$!"

# send SIGQUIT to the java process which will then print stack trace to console
while kill -3 $jpid ;
  do sleep 1 ;
done ;

# filter output to get code location information from trace
# sort and count to find most frequent line of code
# sort again to put most frequently executed line of code at bottom of screen
# filter by yourpackage to see your code
grep at\  log.txt | sort | uniq -c | sort -n | grep yourpackage
