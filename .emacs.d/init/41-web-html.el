;; HTML

;; html mode
(add-to-list 'auto-mode-alist '("\\.html$" . html-mode))
(add-to-list 'auto-mode-alist '("\\.erb$" . html-mode))
(add-to-list 'auto-mode-alist '("\\.tpl$" . html-mode))
(defvar html-mode-map (make-sparse-keymap))
(define-key html-mode-map (kbd "C-\\") 'php-mode)

;; zencoding mode
;; (install-elisp "https://raw.github.com/rooney/zencoding/master/zencoding-mode.el")
(autoload 'zencoding-mode "zencoding-mode" nil t)
(add-hook 'html-mode-hook 'zencoding-mode)
(setq zencoding-indentation 2)
