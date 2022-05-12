#!/usr/bin/env bash

java -jar target/yourjar.jar yourpackage.entryclass > log.txt &
jpid="$!"
while kill -3 $jpid ;
  do sleep 1 ;
done ;
grep at\  log.txt | sort | uniq -c | sort -n | grep yourpackage
