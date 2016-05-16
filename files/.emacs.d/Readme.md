ikn-emacs-d
=======================

研究室共有用のemacs設定ファイルです。


使い方
-----------------------

### お試し利用

    git clone git@gitlab.com:ikn/ikn-emacs-d.git
    emacs -q -l ikn-emacs-d/init.el


### 初回セットアップ

    cd ~
    git clone git@gitlab.com:ikn/ikn-emacs-d.git
    mv .emacs.d .emacs.d.bak
    ln -s ikn-emacs-d .emacs.d


### 更新の受け取り

    cd ~/.emacs.d
    git pull


### 変更の送信

    cd ~/.emacs.d
    git add .
    git commit
    git push



