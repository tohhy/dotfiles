;====================================
; scala設定
;====================================
(require 'scala-mode-auto)
(add-to-list 'auto-mode-alist '("\\.scala$" . scala-mode))

(require 'scala-mode-feature-electric)
(add-hook 'scala-mode-hook
  (lambda ()
    (set-buffer-file-coding-system 'utf-8)
    (setq default-buffer-file-coding-systems 'utf-8)
    (scala-electric-mode)
    (define-key global-map "\C-cs" 'scala-run-scala)
    (define-key global-map "\C-c\C-e" 'scala-eval-definition)))
