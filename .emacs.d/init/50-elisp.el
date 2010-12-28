;; lisp mode
(add-hook 'emacs-lisp-mode-hook
          '(lambda ()
             (setq ac-sources '(ac-source-words-in-same-mode-buffers ac-source-symbols))))

;; eldoc
;; (install-elisp "http://www.emacswiki.org/emacs/download/eldoc-extension.el")
(require 'eldoc-extension)
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)
