;; php mode
;; (install-elisp "http://php-mode.svn.sourceforge.net/svnroot/php-mode/tags/php-mode-1.5.0/php-mode.el")
(require 'php-mode)
(add-hook 'php-mode-hook
          '(lambda()
             (textmate-mode t)
             (define-key php-mode-map (kbd "C-\\") 'html-mode)))
