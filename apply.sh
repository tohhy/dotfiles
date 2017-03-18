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
        if [ -s "$file" ]; then
            echo "File $file already exists."
        else
            ln -s "~/dotfiles/files/$file" "~/$file"
        fi
    done
    touch ~/.zsh/.zshrc.local
    touch ~/.zsh/.zshenv.local
else
     echo "Applying cancelled."
fi
