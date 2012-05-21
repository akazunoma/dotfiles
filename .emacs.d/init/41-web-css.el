;; CSS

;; css mode
(autoload 'css-mode "css-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.css$" . css-mode))
(setq css-indent-offset 2)

;; sass mode
;; (install-elisp "https://raw.github.com/nex3/haml-mode/master/haml-mode.el")
;; (install-elisp "https://raw.github.com/nex3/sass-mode/master/sass-mode.el")
(autoload 'sass-mode "sass-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.sass$" . sass-mode))
(add-to-list 'auto-mode-alist '("\\.scss$" . sass-mode))
(add-to-list 'auto-mode-alist '("\\.less$" . sass-mode))
