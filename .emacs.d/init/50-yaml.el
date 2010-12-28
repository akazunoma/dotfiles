;; yaml mode
;; (install-elisp "http://github.com/yoshiki/yaml-mode/raw/master/yaml-mode.el")
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
