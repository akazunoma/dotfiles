;; color-moccur and moccur edit
;; (install-elisp "http://www.emacswiki.org/emacs/download/color-moccur.el")
;; (install-elisp "http://www.emacswiki.org/emacs/download/moccur-edit.el")
(require 'color-moccur)
(require 'moccur-edit)
(setq moccur-split-word t)
(add-to-list 'dmoccur-exclusion-mask "\\.DS_Store")
(add-to-list 'dmoccur-exclusion-mask "^#.+#$")

;; igrep
;; (install-elisp "http://www.emacswiki.org/emacs/download/igrep.el")
(require 'igrep)

;; grep edit
;; (install-elisp "http://www.emacswiki.org/emacs/download/grep-edit.el")
(require 'grep-edit)
