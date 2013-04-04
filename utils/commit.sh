#!/bin/sh

current_path=`pwd`

files=(`ls -AB1 ../files/`)

cd ~/

for file in ${files[@]}
do
  cp -r $file dotfiles/files
done

cd $current_path

git add -A
git commit
