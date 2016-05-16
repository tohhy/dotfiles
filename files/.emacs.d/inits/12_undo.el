(require 'undo-tree nil t)
(global-undo-tree-mode t)

(require 'undohist nil t)
(setq undohist-directory (locate-user-emacs-file "cache/undohist"))
(undohist-initialize)


