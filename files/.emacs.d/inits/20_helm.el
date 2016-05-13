;;; 20_helm.el ---

;; ==================================================
;; helm.el
;; ==================================================
(require 'helm-config)
(helm-mode 1)

;; -------------------------------------------------
;; Keybind (run)
;; -------------------------------------------------

(bind-key "C-;" 'helm-mini)
(bind-key "M-y" 'helm-show-kill-ring)
(bind-key "C-x C-r" 'helm-recentf)
(bind-key "C-x C-z" 'helm-resume)
(bind-key "C-x C-g" 'helm-do-ag)
(bind-key "C-x C-a" 'helm-do-ag)
(bind-key "C-c C-s" 'helm-ghq)
(bind-key "C-h" 'delete-backward-char)

;; -------------------------------------------------
;; Keybind (while executing helm)
;; -------------------------------------------------
(bind-key "C-h" 'delete-backward-char helm-read-file-map)
(bind-key "TAB" 'helm-execute-persistent-action helm-read-file-map)
(bind-key "C-f" 'helm-execute-persistent-action helm-read-file-map)
(bind-key "TAB" 'helm-execute-persistent-action helm-find-files-map)

;; -------------------------------------------------
;; Occur
;; -------------------------------------------------
(bind-key "C-x C-o" 'helm-occur)
(bind-key "C-o" 'helm-occur-from-isearch isearch-mode-map)

;; -------------------------------------------------
;; Etc
;; -------------------------------------------------
(setq helm-ff-auto-update-initial-value nil)
(add-to-list 'helm-for-files-preferred-list 'helm-source-ghq)

