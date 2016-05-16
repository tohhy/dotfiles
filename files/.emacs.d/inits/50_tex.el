
(defvar auto-mode-alist (append '(("\\.tex$" . LaTeX-mode)) auto-mode-alist))

;; spell-checker
(setq-default ispell-program-name "aspell")
(setq ispell-program-name "aspell")
(eval-after-load "ispell"
  '(setq ispell-skip-region-alist (cons '("[^A-Za-z0-9 -]+")
                                        ispell-skip-region-alist)))
;; Latex-modeに入る時、自動でflyspell-modeに入るようにする
(add-hook 'LaTex-mode-hook 'flyspell-mode)
(custom-set-variables
 '(flyspell-auto-correct-binding [(control ?\:)]))


