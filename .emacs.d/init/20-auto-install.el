;; auto-install
;; (install-elisp "http://www.emacswiki.org/emacs/download/auto-install.el")
(require 'auto-install)
(setq auto-install-directory "~/.emacs.d/elisp/")
(auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup)
