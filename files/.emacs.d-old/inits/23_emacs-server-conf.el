;====================================
; emacs server関係
;====================================
;; 起動
(require 'server)
(unless (server-running-p)
  (server-start))
;; M-x exit でサーバーも終わる
(defalias 'exit 'save-buffers-kill-emacs)
;; http://k-ui.jp/?p=204より
;; emacsclient でアクセスした時の文字コード設定
(add-hook 'server-visit-hook
          (lambda ()
            (set-terminal-coding-system 'utf-8)
            (set-keyboard-coding-system 'utf-8)
            ))
;; 外部ファイルを既存emacs内で開く
(setq ns-pop-up-frames nil)
