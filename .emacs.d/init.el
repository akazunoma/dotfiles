;; add .emacs to load path
(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/elisp")

;; init loader
;; (install-elisp "http://coderepos.org/share/export/38744/lang/elisp/init-loader/init-loader.el")
(require 'init-loader)
(init-loader-load "~/.emacs.d/init")
