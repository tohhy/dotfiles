
;====================================
; term設定
;====================================
(require 'term)

;;フックの設定
(add-hook 'term-mode-hook '(lambda ()
           (define-key term-raw-map "\C-r" 'term-send-raw)
           (define-key term-raw-map "\C-s" 'term-send-raw)
           (define-key term-raw-map "\C-f" 'forward-char)
           (define-key term-raw-map "\C-t" 'set-mark-command)
           (define-key term-raw-map [bs] 'term-send-backspace)
           (define-key term-raw-map [delete] 'term-send-del)
           (define-key term-raw-map "\C-z"
               (lookup-key (current-global-map) "\C-z"))
           ; tmux用
           (define-key term-raw-map "\C-b" 'term-send-raw)
           ; vim用
           (define-key term-raw-map (kbd "ESC") 'term-send-raw)
           ;; zshを使う
           (setq shell-file-name "/bin/zsh")
           ;; shell-modeでpasswordを隠す
           (add-hook 'comint-output-filter-functions 'comint-watch-for-password-prompt)
           (define-key global-map [ns-drag-file] 'ns-find-file)
           (set-display-table-slot standard-display-table 0 ?\ ) 
))
; Emacs+zsh+ansi-termで4mと出る問題対策
(setq system-uses-terminfo nil)

; lsの色がおかしくなる問題対策
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

; termをmulti-termへ
(require 'multi-term)
(defalias 'term 'multi-term)
