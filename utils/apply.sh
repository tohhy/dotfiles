#!/bin/sh

pwd

read -p " Are you sure to apply dotfiles to your system? [y/n]" ans
if [ "$ans" == "y" ]
then
    echo "Applying..."
    files=(`ls -AB1 ../files/`)
    cd ../files/

    for file in ${files[@]}
    do
        cp -rb $file ~/
    done
else
     echo "Applying cancelled."
fi



