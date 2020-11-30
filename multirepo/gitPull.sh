#!/bin/sh
# script to pull multiple git repositories and update submodules specified in an input file
# run: ./gitClone.sh $inputFile $mainDirMultiRepoPath
# i.e. unix-like: sh gitClone.sh nembidRepo.list ~/repo/nem
# i.e. poweshell: sh .\gitClone.sh .\nembidRepo.list  C:\repo\nem\
rootDir=$PWD
while read line; do
  proto=$(echo $line | cut -f 1 -d :)
  url=$(echo $line | cut -f 2 -d :)
  url="${proto}:${url}"
  tag=$(echo $line | cut -f 3 -d :)
  repo=$(echo $url | cut -f 4 -d /)
  repoDir=$(echo $url | cut -f 5 -d /)
  echo "------------------------------------------------------------------------"
  echo   Pulling Repo:$url 
  echo "------------------------------------------------------------------------"
  cd $2/$repoDir && git pull && git submodule update --recursive --init && cd $rootDir
done < $1
