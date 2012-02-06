;; html mode
(defvar html-mode-map (make-sparse-keymap))
(define-key html-mode-map (kbd "C-\\") 'php-mode)
(add-to-list 'auto-mode-alist '("\\.tpl$" . html-mode))
(add-to-list 'auto-mode-alist '("\\.erb$" . html-mode))
