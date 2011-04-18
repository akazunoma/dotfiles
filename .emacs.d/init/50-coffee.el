;; (install-elisp "https://github.com/defunkt/coffee-mode/raw/master/coffee-mode.el")
(require 'coffee-mode)
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))
