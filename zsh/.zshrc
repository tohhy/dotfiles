export LANG=ja_JP.UTF-8

#
# Paths
#
source $ZDOTDIR/.paths

#
# zplug
#
source ~/.zplug/init.zsh
zplug "mollifier/cd-bookmark"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
zplug load --verbose

#
# cd-bookmark
#
export CD_BOOKMARK_FILE="$ZDOTDIR/conf/.cdbookmark"

#
# Completions
#
autoload -U compinit
compinit -d $ZDOTDIR/conf/.zcompdump
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' '+m:{A-Z}={a-z}' 'm:{a-zA-Z}={A-Za-z} r:|[-_.]=**'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:default' menu select
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
    /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

#
# History
#
HISTFILE=$ZDOTDIR/history/.zsh_history
HISTSIZE=1000000
SAVEHIST=100000

#
# keybinds
#
autoload -U bindfunc
bindfunc '\^\^' short_cdup
bindfunc '\^\\' short_popd

#
# Options
# http://zsh.sourceforge.net/Doc/Release/Options.html
#
setopt auto_cd
setopt auto_pushd
setopt cdable_vars
setopt pushd_ignore_dups
setopt always_to_end
setopt complete_aliases
setopt complete_in_word
setopt list_packed
setopt list_types
setopt extended_glob
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_reduce_blanks
setopt correct
setopt rm_star_wait

#
# Hooks
#
autoload -U chpwd

#
# Alias
#
source $ZDOTDIR/.aliases


#
# Others
#

# launch tmux if first shell
if [ $SHLVL = 1 ]; then
  tmux
fi


#
# 補完設定
#
# 補完時にヒストリを自動的に展開する
setopt hist_expand

# 履歴検索
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# historical backward/forward search with linehead string binded to ^P/^N
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "??ep" history-beginning-search-backward-end
bindkey "??en" history-beginning-search-forward-end
zmodload zsh/complist

#
# ターミナル設定
#

# screen系はxtermとくくる
case "${TERM}" in
screen|tmux)
    TERM=xterm
    ;;
esac

#
# 書式・色
#
autoload -U colors; colors

# プロンプト
PROMPT="%{${fg[green]}%}%n@%m%%%{${reset_color}%} "
PROMPT2="%{${fg[green]}%}%_%%%{${reset_color}%} "
SPROMPT="%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "
 [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
        PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') ${PROMPT}"

# プロンプトが表示されるたびにプロンプト文字列を評価、置換する
setopt prompt_subst
autoload rprompt_git_current_branch
RPROMPT='[`rprompt_git_current_branch`%{${fg[blue]}%}%~%{${reset_color}%}]'


# lsと補完の配色
case "${TERM}" in
xterm|xterm-color)
    export LSCOLORS=exfxcxdxbxegedabagacad
    export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
    ;;
kterm-color)
    stty erase '^H'
    export LSCOLORS=exfxcxdxbxegedabagacad
    export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
    ;;
kterm)
    stty erase '^H'
    ;;
cons25)
    unset LANG
    export LSCOLORS=ExFxCxdxBxegedabagacad
    export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=;34;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
    ;;
jfbterm-color)
    export LSCOLORS=gxFxCxdxBxegedabagacad
    export LS_COLORS='di=01;36:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=;36;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
    ;;
esac
case ${OSTYPE} in
	freebsd*|darwin*)
	    alias ls="ls -G -aw";;
	linux*)
	    alias ls="ls --color -a";;
esac

# -------------------------------------
# @see https://hoelz.ro/blog/making-ssh_auth_sock-work-between-detaches-in-tmux
# -------------------------------------
if [ ! -z "$SSH_AUTH_SOCK" -a "$SSH_AUTH_SOCK" != "$HOME/.ssh/agent_sock"  ] ; then
  unlink "$HOME/.ssh/agent_sock" 2>/dev/null
  ln -s "$SSH_AUTH_SOCK" "$HOME/.ssh/agent_sock"
  export SSH_AUTH_SOCK="$HOME/.ssh/agent_sock"
fi

# local settings
source $ZDOTDIR/.zshrc.local
