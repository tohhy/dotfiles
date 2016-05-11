; パッケージインストール先を隔離可能にする
; init.elからの相対パスでパッケージを参照
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

; elisp extension
(el-get-bundle s)
(el-get-bundle dash)
(el-get-bundle ht)
(el-get-bundle f)

; ui extension
(el-get-bundle drag-stuff)

; etc
(el-get-bundle exec-path-from-shell)


; init-loader
(init-loader-load (concat user-emacs-directory "inits"))
(setq init-loader-show-log-after-init nil)


