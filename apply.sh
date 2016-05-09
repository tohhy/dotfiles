#!/bin/bash
pwd
read -p " Are you sure to apply dotfiles to your system? [y/n]" ans
if [ "$ans" == "y" ]
then
    echo "Applying..."
    files=(`ls -AB1 files/`)
    cd files/

    for file in ${files[@]}
    do
        ln -s ~/dotfiles/files/$file ~/$file
    done
    touch ~/.zsh/.zshrc.local
    touch ~/.zsh/.zshenv.local
else
     echo "Applying cancelled."
fi
