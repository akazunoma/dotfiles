;; js2 mode
;; (install-elisp "http://js2-mode.googlecode.com/files/js2-20090723b.el")
(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(setq js2-basic-offset 2)
(setq js2-cleanup-whitespace t)
(setq js2-mirror-mode nil)
(setq js2-indent-on-enter-key t)
(setq js2-enter-indents-newline t)
(setq js2-strict-missing-semi-warning t)
(setq js2-mode-indent-inhibit-undo t)
(setq js2-bounce-indent-flag nil)
(add-hook 'js2-mode-hook
          '(lambda ()
             (define-key js2-mode-map (kbd "C-m") 'newline-and-indent)
             (define-key js2-mode-map (kbd "C-i") 'indent-and-back-to-indentation)))

;; gjslint
;; (install-elisp "http://gist.github.com/raw/561978/gjslint.el")
(require 'gjslint)
(add-hook 'js2-mode-hook
          '(lambda ()
             (flymake-mode t)))
