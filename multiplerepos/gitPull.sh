#!/bin/sh
### script to clone multiple git repositories specified in an input file
while read line; do
  echo "------------------------------------------------------------------------"
  echo   Pulling Repo:$url 
  echo "------------------------------------------------------------------------"
  proto=$(echo $line | cut -f 1 -d :)
  url=$(echo $line | cut -f 2 -d :)
  url="${proto}:${url}"
  tag=$(echo $line | cut -f 3 -d :)
  repo=$(echo $url | cut -f 4 -d /)
  dir=$(echo $url | cut -f 5 -d /)
  cd ./$dir && git pull && git submodule update --recursive --init && cd ..
done < $1
