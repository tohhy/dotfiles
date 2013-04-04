;; 行番号関係の設定
; http://d.hatena.ne.jp/kitokitoki/20100714/p1

;; ファイル名での判定
(defvar my-linum-file nil)
(setq my-linum-file '(
"hosts"
))
(defun my-linum-file-name ()
  (when (member (buffer-name) my-linum-file)
                (linum-mode t)))
(add-hook 'find-file-hook 'my-linum-file-name)

;; 拡張子での判定
(defvar my-linum-file-extension nil)
(setq my-linum-file-extension '(
"txt" "conf" "el" 
"java" "html" "css" "js"
))
(defun my-linum-file-extension ()
  (when (member (file-name-extension (buffer-file-name)) my-linum-file-extension)
                (linum-mode t)))
(add-hook 'find-file-hook 'my-linum-file-extension)

;; メージャーモード/マイナーモードでの指定
(defvar my-linum-hook-name nil)
(setq my-linum-hook-name '(
                           emacs-lisp-mode-hook slime-mode-hook 
                           sh-mode-hook text-mode-hook 
                           php-mode-hook python-mode-hook ruby-mode-hook 
                           clojure-mode-hook scala-mode-hook 
                           css-mode-hook yaml-mode-hook org-mode-hook
                           howm-mode-hook js2-mode-hook javascript-mode-hook
                           smarty-mode-hook html-helper-mode-hook))
(mapc '(lambda (hook-name)
          (add-hook hook-name (lambda () (linum-mode t))))
       my-linum-hook-name)
