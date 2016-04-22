;====================================
; ロードパスの追加
;====================================
(setq load-path (append
                 '("~/.emacs.d"
                   "~/.emacs.d/config"
                   "~/.emacs.d/packages"
                   "~/.emacs.d/packages/scala"
                   "~/.emacs.d/packages/emacs-nav"
                   "~/.emacs.d/auto-install"
)
                 load-path))

;====================================
; package.el
;====================================
(require 'package)
;;リポジトリにMarmaladeを追加
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
;;インストールするディレクトリを指定
(setq package-user-dir (concat user-emacs-directory "vendor/elpa"))
;;インストールしたパッケージにロードパスを通してロードする
(package-initialize)

;====================================
; リポジトリ外のパッケージの導入
;====================================
;; emacs-nav
(require 'nav)
(setq nav-split-window-direction 'vertical) ;; 分割したフレームを垂直に並べる

;====================================
; init-loader
;====================================
; 設定ファイルを分割して読み込み
; http://tech.kayac.com/archive/divide-dot-emacs.html
; http://coderepos.org/share/browser/lang/elisp/init-loader/init-loader.el
(require 'init-loader)
(init-loader-load "~/.emacs.d/inits")

;====================================
; キャッシュファイルの生成位置指定
;====================================
;; auto-complete
(setq ac-comphist-file "~/.emacs.d/cache/auto-complete/ac-comphist.dat")
;; eshell
(setq eshell-directory-name "~/.emacs.d/cache/eshell/")
;; recentf
(setq recentf-save-file "~/.emacs.d/cache/recentf")
;; savehist
(setq savehist-file "~/.emacs.d/cache/savehist/history")


;====================================
; キーバインド
;====================================
;; CUAモード(v22.1.1 or later)
;; C-cでコピー、C-xで切り取り、C-vで貼付け、C-zでアンドゥ
(cua-mode 1)
;; Shiftで選択
(setq shift-select-mode t)
(setq pc-select-selection-keys-only t)
(if (fboundp 'pc-selection-mode)
        (pc-selection-mode)
      (require 'pc-select))
;; C-aで全て選択
(define-key global-map (kbd "C-a") 'mark-whole-buffer)
;; C-sで上書き保存
(define-key global-map (kbd "C-s") 'save-buffer)
;; C-fで検索
(define-key global-map (kbd "C-f") 'isearch-forward)
;; C-x C-tでterm
(define-key global-map (kbd "C-x C-t") 'multi-term)
;; C-x カーソル、C-カーソルでページ移動
(global-set-key (kbd "C-x <up>") 'scroll-down)
(global-set-key (kbd "C-x <down>") 'scroll-up)
(global-set-key (kbd "C-<up>") 'scroll-down)
(global-set-key (kbd "C-<down>") 'scroll-up)
;; C-横カーソルで行頭、行末へ
(global-set-key (kbd "C-<left>") 'move-beginning-of-line)
(global-set-key (kbd "C-<right>") 'move-end-of-line)

;; 拡張機能のキーバインド
(global-set-key (kbd "C-x b") 'anything)         ;; C-x bでanything
(global-set-key (kbd "C-x C-d") 'nav-toggle)     ;; C-x C-d で nav をトグル
(global-set-key (kbd "C-x C-b") 'ibuffer)        ;; C-x C-b をibufferに取替え



;====================================
; 画面設定
;====================================
;; スクロールバーのオンオフ機能
(global-set-key [M-f10] 'toggle-scroll-bar)
;; (Cocoa用)フルスクリーンの導入
(global-set-key [(super return)] 'ns-toggle-fullscreen)
(global-set-key [(meta return)] 'ns-toggle-fullscreen)
(global-set-key [M-f11] 'ns-toggle-fullscreen)
;; echoareaとmodelineのオンオフ機能
(defun toggle-mode-line () "toggles the modeline on and off"
  (interactive)
  (setq mode-line-format
    (if (equal mode-line-format nil)
        (default-value 'mode-line-format)))
  (redraw-display))

(global-set-key [M-f12] 'toggle-mode-line)


;====================================
; エディタ設定
;====================================
;; 対応する括弧をハイライト
(show-paren-mode 1)
;; ウィンドウ内に収まらないときだけ括弧内も光らせる
(setq show-paren-style 'mixed)
;; Tabの代わりにスペースでインデント
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

;; カーソルのスタイル変更
(setq-default cursor-type 'bar)
(setq default-frame-alist '((cursor-color . "#444444")))

;;行間設定
;;整数で指定するとピクセル数で、少数で指定すると
;;行の高さに対して相対値で設定されます。
(setq-default line-spacing 0.2)

;; macで全角記号類「！”＃＄％＆’（）＝?｜｀『＋＊』＜＞？＿」を入力できるようにする
;(mac-add-key-passed-to-system 'shift)

;; 選択時に自動でリージョンにコピーされてしまうのを防ぐ
(setq mouse-drag-copy-region nil)

;1行ずつスクロールする
(setq scroll-conservatively 35
  scroll-margin 0
  scroll-step 1) 



;====================================
; エンコード設定
;====================================
(cond
 ((or (eq window-system 'mac) (eq window-system 'ns))
  ;; Mac OS X の HFS+ ファイルフォーマットではファイル名は NFD (の様な物)で扱うため以下の設定をする必要がある
  (require 'ucs-normalize)
  (setq file-name-coding-system 'utf-8-hfs)
  (setq locale-coding-system 'utf-8-hfs))

 ((or (eq system-type 'cygwin) (eq system-type 'windows-nt)
  (setq file-name-coding-system 'utf-8)
  (setq locale-coding-system 'utf-8)
  ;; もしコマンドプロンプトを利用するなら sjis にする
  ;; (setq file-name-coding-system 'sjis)
  ;; (setq locale-coding-system 'sjis)
  ;; 古い Cygwin だと EUC-JP にする
  ;; (setq file-name-coding-system 'euc-jp)
  ;; (setq locale-coding-system 'euc-jp)
  ))

 (t
  (setq file-name-coding-system 'utf-8)
  (setq locale-coding-system 'utf-8)))

;; 日本語環境設定
(set-language-environment 'Japanese)
;; テキストエンコーディングとしてUTF-8を優先使用
(prefer-coding-system 'utf-8)



;====================================
; モードエリア設定
;====================================
;; カーソルの位置が何文字目、何行目かを表示する
(column-number-mode t)
(line-number-mode t)
;; 改行コードを表示
(setq eol-mnemonic-dos "(CRLF)")
(setq eol-mnemonic-mac "(CR)")
(setq eol-mnemonic-unix "(LF)")


;====================================
; その他
;====================================
;;背景透過
(if window-system (set-frame-parameter nil 'alpha 90))
;; 画像表示に対応
(auto-image-file-mode t)


