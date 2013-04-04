#
# environment variables settings
#

# set LANG as ja_JP
export LANG='ja_JP.UTF-8'


#
# completion settings
#

# use advanced completion if available
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

#
# history settings
#

# create history file in bash dir
HISTFILE=~/.bash/.bash_history

# the number of history log
HISTSIZE=1000

# don't log any line which starts space or tab
# and any input which matches to recently history
HISTCONTROL=ignoreboth

#
# appearance settings
#

# show current dir path on prompt
# multi-line and colored
PS1="(bash) \[\033[34m\][\w]\[\033[0m\]\n\[\033[1;35m\]\u\[\033[1;30m\] -> \[\033[0m\]"    

# add color to ls
export LSCOLORS=exfxcxdxbxegedabagacad
alias ls='ls -G'

#
# exclude environment related settings to bashrc.local
#
if [ -f ~/.bash/.bashrc.local ]; then
  source ~/.bash/.bashrc.local
fi
