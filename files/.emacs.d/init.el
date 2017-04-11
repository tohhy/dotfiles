; パッケージインストール先を隔離可能にする
; init.elからの相対パスでパッケージを参照
; emacs -q -l <init.el>
(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

; バージョン別にパッケージをインストールする設定
; 異なるバージョンのemacsでコンパイルされたバイトコードには互換性がないため
(let ((versioned-dir (locate-user-emacs-file (concat "pkg-" emacs-version))))
  (setq el-get-dir (expand-file-name "el-get" versioned-dir)
        package-user-dir (expand-file-name "elpa" versioned-dir)))

; el-get
; パッケージマネージャ
; 初回起動時のみcloneしてくる

(add-to-list 'load-path (concat el-get-dir "/el-get"))
(unless (require 'el-get nil 'noerror)
    (with-current-buffer
            (url-retrieve-synchronously
                     "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
                (goto-char (point-max))
                    (eval-print-last-sexp)))


; bundle

; basics
(el-get-bundle init-loader)
(el-get-bundle bind-key)
(el-get-bundle auto-complete)
(el-get-bundle helm)
(el-get-bundle helm-ag)
(el-get-bundle yasnippet)
(el-get-bundle recentf-ext)
(el-get-bundle real-auto-save)
(el-get-bundle direx)
(el-get-bundle use-package)
(el-get-bundle sequential-command)


; undo
(el-get-bundle undo-tree)
(el-get-bundle undohist)

; elisp extension
(el-get-bundle s)
(el-get-bundle dash)
(el-get-bundle ht)
(el-get-bundle f)

; ui extension
(el-get-bundle drag-stuff)
(el-get-bundle smex)
(el-get-bundle popwin)
(el-get-bundle popup)
(el-get-bundle expand-region)
(el-get-bundle highlight-symbol)

; coding
(el-get-bundle flycheck)
(el-get-bundle quickrun)
(el-get-bundle smartparens)
(el-get-bundle ruby-mode)
(el-get-bundle coffee-mode)
(el-get-bundle sass-mode)
(el-get-bundle slim-mode)
(el-get-bundle go-mode)
(el-get-bundle json-mode)
(el-get-bundle rust-mode)
(el-get-bundle web-mode)
(el-get-bundle markdown-mode)
(el-get-bundle php-mode)
(el-get-bundle scala-mode2)
(el-get-bundle auto-complete-clang)
(el-get-bundle google-c-style)

; git
(el-get-bundle git-gutter)
(el-get-bundle git-commit-mode)

; etc
(el-get-bundle exec-path-from-shell)
(el-get-bundle htmlize)
(el-get-bundle prodigy)
(el-get-bundle projectile)

; init-loader
(init-loader-load (concat user-emacs-directory "inits"))
(setq init-loader-show-log-after-init nil)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-dictionary-directories
   (quote
    ((locate-user-emacs-file "cache/auto-complete-dict"))))
 '(ac-use-menu-map t)
 '(flyspell-auto-correct-binding [(control 58)])
 '(package-selected-packages (quote (sequential-command real-auto-save bind-key)))
 '(tab-width 4))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
