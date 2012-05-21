;; PHP

;; php mode
(require 'php-mode)
(add-hook 'php-mode-hook
          '(lambda()
             (define-key php-mode-map (kbd "C-\\") 'html-mode)))
