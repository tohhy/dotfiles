### ~/.zsh/.zshrc
# このファイルには汎用設定を書き込む
# 環境に依存する設定は~/.zshrcに集約
# 別環境に移った際にも簡単に設定を持ち込めるように.

#
# 環境設定
#

# 文字コードをUTF-8に指定
export LANG=ja_JP.UTF-8

# 新しく作られたファイルのパーミッションが常に644になるようにする
umask 022

#
# 補完設定
#
fpath=(${HOME}/.zsh/functions/Completion ${fpath})
autoload -U compinit
compinit -d ${HOME}/.zsh/.zcompdump

# 補完の際に大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# カーソルキーで補完候補を選べるようにする
zstyle ':completion:*:default' menu select

# カーソル位置から補完する
setopt complete_in_word

# コマンドにsudoをつけても正常に補完できるようにする
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
    /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# 補完の際にエイリアスのオリジナルコマンドも対象にする
setopt complete_aliases

# 補完時にヒストリを自動的に展開する
setopt hist_expand



#
# 履歴設定
#
HISTFILE=${HOME}/.zsh/history/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

setopt hist_ignore_dups    # 重複した履歴を保存しない
setopt hist_ignore_space   # スペースで始まるコマンドを保存しない
setopt share_history       # 履歴を共有する
setopt extended_history    # zshの開始終了を記録

# 履歴検索
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# historical backward/forward search with linehead string binded to ^P/^N
#
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "??ep" history-beginning-search-backward-end
bindkey "??en" history-beginning-search-forward-end
zmodload zsh/complist


# auto change directory
#
setopt auto_cd

# auto directory pushd that you can get dirs list by cd -[tab]
setopt auto_pushd

# pushdで同じディレクトリを重複してpushしない
setopt pushd_ignore_dups

# command correct edition before each completion attempt
#
setopt correct

# compacked complete list display
#
setopt list_packed

# no remove postfix slash of command line
#
setopt noautoremoveslash

# 補完時にbeepを鳴らさない
#
setopt nolistbeep

# rm * を実行する前に確認
setopt rm_star_wait

# Auto ls
function chpwd() { 
    case ${OSTYPE} in
        freebsd*|darwin*)
            ls -G -w;;
        linux*)
            ls --color;;
    esac
}

# cd .. with ^^
function cdup(){
    echo
    cd ..
    zle reset-prompt
}
zle -N cdup
bindkey '\^\^' cdup

# 引数の検索ワードで google 検索 (日本語可)
function google() {
  local str opt
  if [ $# != 0 ]; then # 引数が存在すれば
    for i in $*; do
      str="$str+$i"
    done
    str=`echo $str | sed 's/^\+//'` # 先頭の「+」を削除
    opt='search?num=50&hl=ja&ie=utf-8&oe=utf-8&lr=lang_ja'
    opt="${opt}&q=${str}"
  fi
  w3m http://www.google.co.jp/$opt # 引数がなければ $opt は空
}
alias gg=google

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
autoload colors
colors

# プロンプト
PROMPT="%{${fg[green]}%}%n@%m%%%{${reset_color}%} "
PROMPT2="%{${fg[green]}%}%_%%%{${reset_color}%} "
RPROMPT="[%{${fg[blue]}%}%~%{${reset_color}%}]"
SPROMPT="%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "
 [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
        PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') ${PROMPT}"

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

# lsの配色適用エイリアス
case ${OSTYPE} in
	freebsd*|darwin*)
	    alias ls="ls -G -aw";;
	linux*)
	    alias ls="ls --color -a";;
esac


#
# zsh関係の細かな設定
#

# 出力の行末が改行コードでない場合に最終行が表示されない問題対策
unsetopt promptcr

# Fix mac tmux bug
export __CF_USER_TEXT_ENCODING="0x1F5:0x08000100:14"

## python関連の設定
if [ -f ~/.python/.pythonstartup ]; then
  export PYTHONSTARTUP=~/.python/.pythonstartup
fi

## emacs関連の設定
# zshのキーバインドをemacs風に
bindkey -e

# emacsから呼ばれた場合の色設定を変更
if [ "$EMACS" ];then
  export TERM=Eterm-color
fi

# エイリアス
alias emacs-server="emacs --daemon"
alias em="emacsclient -nw"
alias emacsc="emacsclient -nw"

# local settings
source .zshrc.local
