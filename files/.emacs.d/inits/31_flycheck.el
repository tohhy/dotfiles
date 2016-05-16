(require 'flycheck)

(flycheck-define-checker c/c++
  "A C/C++ checker using g++."
  :command ("g++" "-Wall" "-Wextra" source)
  :error-patterns  ((error line-start
                           (file-name) ":" line ":" column ":" " エラー: " (message)
                           line-end)
                    (warning line-start
                           (file-name) ":" line ":" column ":" " 警告: " (message)
                           line-end))
  :modes (c-mode cc-mode c++-mode C++/l-mode))

(add-hook 'after-init-hook #'global-flycheck-mode)
(add-hook 'c-mode-common-hook 'flycheck-mode)
(global-set-key (kbd "M-s M-n") 'flycheck-next-error)
(global-set-key (kbd "M-s M-p") 'flycheck-previous-Error)




