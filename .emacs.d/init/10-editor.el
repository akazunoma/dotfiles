;; Editor

;; Map
(define-prefix-command 'tabbar-mode-map)
(global-set-key (kbd "C-z") 'tabbar-mode-map)

;; key
(define-key global-map (kbd "C-m") 'newline-and-indent)
(define-key global-map (kbd "C-i") 'indent-and-back-to-indentation)
(define-key global-map (kbd "C-j") 'indent-new-comment-line)
(define-key global-map (kbd "C-h") 'delete-backward-char)
(define-key global-map (kbd "C-t") 'next-window-or-split-horizontally)
(define-key global-map (kbd "C-S-T") 'prev-window-or-split-horizontally)
(define-key global-map (kbd "C-w") 'copy-region-as-kill)
(define-key global-map (kbd "C-^") 'enlarge-window)
(define-key global-map (kbd "C-~") 'enlarge-window-horizontally)
(define-key global-map (kbd "M-a") 'beginning-of-defun)
(define-key global-map (kbd "M-e") 'end-of-defun)
(define-key global-map (kbd "M-f") 'forward-sexp)
(define-key global-map (kbd "M-b") 'backward-sexp)
(define-key global-map (kbd "M-v") 'scroll-other-window)
(define-key global-map (kbd "M-#") 'query-replace)
(define-key global-map (kbd "M-$") 'query-replace-regexp)
(define-key global-map (kbd "M-?") 'help-for-help)
(define-key global-map (kbd "M-k") 'kill-this-buffer)
(define-key global-map (kbd "M-p") 'point-undo)
(define-key global-map (kbd "M-n") 'point-redo)
(define-key global-map (kbd "M-_") 'redo)
(define-key global-map (kbd "M-t") 'delete-window)
(define-key global-map (kbd "M-w") 'kill-region)
(define-key global-map (kbd "M-.") 'anything-yaetags-find-tag)
(define-key global-map (kbd "C-M-a") 'backward-sentence)
(define-key global-map (kbd "C-M-e") 'forward-sentence)
(define-key global-map (kbd "C-M-f") 'forward-word)
(define-key global-map (kbd "C-M-b") 'backward-word)
(define-key global-map (kbd "C-M-_") 'redo)
(define-key global-map (kbd "C-M-v") 'scroll-down)
(define-key global-map (kbd "C-M-#") 'replace-string)
(define-key global-map (kbd "C-M-$") 'replace-regexp)
(define-key global-map (kbd "C-x f") 'anything-find-file)
(define-key global-map (kbd "C-x b") 'anything-buffers+)
(define-key global-map (kbd "C-x ^") 'shrink-window)
(define-key global-map (kbd "C-x ~") 'shrink-window-horizontally)
(define-key global-map (kbd "C-x C-.") 'auto-complete)
(define-key global-map (kbd "C-x C-a") 'anything-recentf)
(define-key global-map (kbd "C-x C-c") 'server-edit)
(define-key global-map (kbd "C-x C-f") 'anything)
(define-key global-map (kbd "C-x C-b") 'anything-buffers+)
(define-key global-map (kbd "C-x C-i") 'indent-region)
(define-key global-map (kbd "C-c C-t") 'twittering-mode)
(define-key global-map (kbd "C-c C-u") 'twittering-update-status-interactive)
(define-key global-map (kbd "C-z a") 'tabbar-local-mode)
(define-key global-map (kbd "C-z n") 'tabbar-forward-group)
(define-key global-map (kbd "C-z p") 'tabbar-backward-group)
(define-key global-map (kbd "C-z k") 'kill-this-buffer)
(define-key global-map (kbd "C-z C-n") 'tabbar-forward-tab)
(define-key global-map (kbd "C-z C-p") 'tabbar-backward-tab)
(define-key global-map (kbd "C-z C-a") 'tabbar-mode)
(define-key global-map (kbd "C-<tab>") 'tabbar-forward-tab)
(define-key global-map (kbd "C-S-<tab>") 'tabbar-backward-tab)
(define-key global-map (kbd "A-]") 'tabbar-forward-tab)
(define-key global-map (kbd "A-[") 'tabbar-backward-tab)
(define-key global-map (kbd "A-}") 'tabbar-forward-group)
(define-key global-map (kbd "A-{") 'tabbar-backward-group)

;; file
(setq require-final-newline t)
(setq kill-whole-line t)
(setq backup-inhibited t)
(setq delete-auto-save-files t)

;; paren
(show-paren-mode t)
(setq show-paren-delay 0)
(setq show-paren-style 'expression)
(set-face-background 'show-paren-match-face nil)
(set-face-underline-p 'show-paren-match-face t)

;; tab
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq-default basic-offset 2)
(setq-default c-basic-offset 2)
(setq-default c-toggle-auto-state 0)
(setq-default c-toggle-hungry-state 1)

;; savekill
;; (install-elisp "http://www.emacswiki.org/cgi-bin/wiki/download/savekill.el")
(require 'savekill)

;; redo+
;; (install-elisp "http://www.emacswiki.org/emacs/download/redo+.el")
(require 'redo+)

;; point-undo
;; (install-elisp "http://www.emacswiki.org/cgi-bin/wiki/download/point-undo.el")
(require 'point-undo)

;; develock
;; $ curl -O http://www.jpl.org/elips/develock.el.gz
;; $ open develock.el.gz
;; $ mv develock.el ~/.emacs.d/elisp/
(require 'develock)

;; auto complete
;; $ cd
;; $ curl -O http://cx4a.org/pub/auto-complete/auto-complete-1.3.1.tar.bz2
;; $ tar -xvf auto-complete-1.3.1.tar.bz2
;; M-x load-file RET ~/auto-complete-1.3.1/etc/install.el RET
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elisp/ac-dict")
(ac-config-default)
(setq ac-ignore-case t)
(setq ac-use-menu-map t)
(define-key ac-menu-map (kbd "C-n") 'ac-next)
(define-key ac-menu-map (kbd "C-p") 'ac-previous)
