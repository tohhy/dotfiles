#!/bin/sh

pwd

files=(`ls -AB1 ../files/`)

cd ‾/

for file in ${files[@]}
do
  cp -r $file dotfiles/files
done

git add -A
git commit