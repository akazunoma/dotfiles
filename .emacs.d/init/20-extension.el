;; Extension

;; auto-install
;; (install-elisp "http://www.emacswiki.org/emacs/download/auto-install.el")
(require 'auto-install)
(setq auto-install-directory "~/.emacs.d/elisp/")
(auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup)

;; anything
;; (auto-install-batch "anything")
(require 'anything-startup)

;; recentf-ext
;; (install-elisp "http://www.emacswiki.org/cgi-bin/wiki/download/recentf-ext.el")
(setq recentf-max-menu-items 100000)
(setq recentf-max-save-items 100000)
(setq recentf-max-saved-items 100000)
(setq recentf-auto-cleanup 'never)
(setq recentf-auto-save-timer
        (run-with-idle-timer 30 t 'recentf-save-list))
(require 'recentf-ext)

;; wdired
(require 'wdired)
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)

;; uniquify
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
(setq uniquify-ignore-buffers-re "*[^*]+*")
