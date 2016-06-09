(req-package exec-path-from-shell
                 :config
                     (if (eq system-type 'darwin)
                               (exec-path-from-shell-initialize)))
