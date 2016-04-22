

(setq inhibit-startup-message t) ; inhibits the startup screen


;; --------------------------------------------------
;; Mode line
;; --------------------------------------------------
(size-indication-mode t) ; show file size
(setq display-time-24hr-fomat t) ; set time 24 fomat
(setq display-time-day-and-date t) ; display day and date
(display-time-mode t) ; display time
(setq line-number-mode t) ; show line number
(setq column-number-mode t) ; show column number
(fset 'yes-or-no-p 'y-or-n-p) ; "yes or no " to "y or n"

;; --------------------------------------------------
;; Display
;; --------------------------------------------------
(global-linum-mode 1) ; show line number at left side
(setq linum-format "%3d")
(menu-bar-mode -1) ; do not show 'menu bar'
(setq frame-title-format (format "%%f" (system-name))) ; show file path at title bar
(when window-system
  (tool-bar-mode -1) ; do not show 'tool bar'
  (set-scroll-bar-mode -1) ; do not 'show scroll bar'
  )

;; alert
(setq visible-bell t)
(setq ring-bell-function 'ignore)


;; --------------------------------------------------
;; Encoding
;; --------------------------------------------------
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8-unix)
(setq default-buffer-file-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)

;; --------------------------------------------------
;; Auto-save
;; --------------------------------------------------
(require 'auto-save-buffers-enhanced)
(setq auto-save-buffers-enhanced-interval 0.3) ; 0.3 sec delay
(auto-save-buffers-enhanced t)

;; --------------------------------------------------
;; Backup file
;; --------------------------------------------------
(setq make-backup-files nil) ; do not create backup file
(setq delete-auto-savefiles t) ; delete auto sage file when closing
(setq auto-save-list-file-prefix nil) ; do not create auto-save-list
(setq auto-save-default nil)


;; --------------------------------------------------
;; Meta key(Mac)
;; --------------------------------------------------
(when (eq system-type 'darwin)
  (setq ns-command-modifier (quote meta)))


;; --------------------------------------------------
;; indent
;; --------------------------------------------------
(setq-default indent-tabs-mode nil)
(custom-set-variables '(tab-width 4))


;; --------------------------------------------------
;; completion
;; --------------------------------------------------
(setq completion-ignore-case t) ; do not distinguish character case
(setq read-file-name-completion-ignore-case t) ; do not distinguish character case


;; --------------------------------------------------
;; paren mode
;; --------------------------------------------------
(show-paren-mode t)
(setq show-paren-delay 0)
(setq show-paren-style 'mixed)


;; --------------------------------------------------
;; recentf mode
;; --------------------------------------------------
(setq recentf-max-menu-items 10) ; max display
(setq recentf-max-saved-items 3000) ; max save
(setq recentf-save-file "~/.emacs.d/etc/.cache/recentf")
(recentf-mode t)

;; --------------------------------------------------
;; Save hist mode
;; --------------------------------------------------
(savehist-mode 1)
(setq history-length 3000)
(setq savehist-file "~/.emacs.d/etc/.cache/history")


