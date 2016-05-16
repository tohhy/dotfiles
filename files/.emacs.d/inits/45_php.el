;;For php
(require 'php-mode)

;*.phpのファイルのときにphp-modeを自動起動する
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))

;PEAR規約のインデント設定にする
(defvar php-mode-force-pear t)


