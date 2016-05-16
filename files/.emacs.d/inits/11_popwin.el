;; ==================================================
;; Popwin
;; ==================================================
(require 'popwin nil t)
(setq display-buffer-function 'popwin:display-buffer)
(setq popwin:popup-window-position 'bottom)
;; -------------------------------------------------
;; Show in popup
;; -------------------------------------------------
(push "*Backtrace*" popwin:special-display-config)
(push '("*git-gutter:diff*" :noselect t) popwin:special-display-config)
;; -------------------------------------------------
;; direx (show directory tree)
;; -------------------------------------------------
(require 'direx nil t)
(setq direx:leaf-icon ""
      direx:open-icon "▾ "
      direx:closed-icon "▸ ")
(push '(direx:direx-mode :position left :width 25 :dedicated t)
      popwin:special-display-config)
(global-set-key (kbd "C-x C-d") 'direx:jump-to-directory-other-window)

