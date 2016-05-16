(require 'auto-complete-config nil t)
(global-auto-complete-mode t)

(custom-set-variables
'(ac-use-menu-map t)
'(ac-dictionary-directories '((locate-user-emacs-file "cache/auto-complete-dict"))))

(define-key ac-menu-map (kbd "C-n") 'ac-next)
(define-key ac-menu-map (kbd "C-p") 'ac-previous)
(define-key ac-menu-map (kbd "M-TAB") nil)

(setq ac-comphist-file (locate-user-emacs-file "cache/ac-comphist.dat"))

