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
        if [ -s "$HOME/$file" ]; then
            echo "File $file already exists."
        else
            echo "$file linked"
            ln -s "$HOME/dotfiles/files/$file" "$HOME/$file"
        fi
    done
    touch $HOME/dotfiles/zsh/.zshrc.local
    touch $HOME/dotfiles/zsh/.zshenv.local
else
     echo "Applying cancelled."
fi
