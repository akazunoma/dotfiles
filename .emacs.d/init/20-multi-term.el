;; multi term
;; (install-elisp "http://www.emacswiki.org/emacs/download/multi-term.el")
(require 'multi-term)
(setq multi-term-program "/bin/bash")
(add-hook 'term-mode-hook
          '(lambda ()
             (add-to-list 'term-unbind-key-list (kbd "C-t"))))
