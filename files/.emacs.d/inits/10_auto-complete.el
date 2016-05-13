;;; 10_auto-complete.el ---

; ==================================================
;; auto-complete-mode.el
;; ==================================================
(require 'auto-complete-config nil t)
(global-auto-complete-mode t)
;; --------------------------------------------------
;; Settings
;; --------------------------------------------------
(custom-set-variables
'(ac-use-menu-map t)
'(ac-dictionary-directories '("~/.emacs.d/cache/auto-complete-dict")))
;; --------------------------------------------------
;; Keybind at showing candidates
;; --------------------------------------------------
(define-key ac-menu-map (kbd "C-n") 'ac-next)
(define-key ac-menu-map (kbd "C-p") 'ac-previous)
(define-key ac-menu-map (kbd "M-TAB") nil)
;; --------------------------------------------------
;; Backup file
;; --------------------------------------------------
(setq ac-comphist-file "~/.emacs.d/cache/ac-comphist.dat")

