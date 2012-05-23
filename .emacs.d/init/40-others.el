;; Others

;; generic-x mode
(require 'generic-x)

;; shell script mode
(add-to-list 'auto-mode-alist '("\\.zsh" . shell-script-mode))

;; conf mode
(add-to-list 'auto-mode-alist '("\\.screenrc" . conf-space-mode))

;; yaml mode
;; (install-elisp "http://github.com/yoshiki/yaml-mode/raw/master/yaml-mode.el")
(autoload 'yaml-mode "yaml-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))
