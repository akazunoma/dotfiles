;; add load path
(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/elisp")
(add-to-list 'load-path "~/.emacs.d/elisp/anything")
(add-to-list 'load-path "~/.emacs.d/elisp/rsense/etc")
(add-to-list 'load-path "~/.emacs.d/elisp/rinari")

;; init loader
;; (install-elisp "http://coderepos.org/share/export/38744/lang/elisp/init-loader/init-loader.el")
(require 'init-loader)
(init-loader-load "~/.emacs.d/init")
