;; auto complete
;; $ cd
;; $ curl -O http://cx4a.org/pub/auto-complete/auto-complete-1.3.tar.bz2
;; $ tar -xvf auto-complete-1.3.tar.bz2
;; M-x load-file RET ~/auto-complete-1.3/etc/install.el RET
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elisp/ac-dict")
(ac-config-default)
(setq ac-ignore-case t)
(setq ac-use-menu-map t)
(define-key ac-menu-map (kbd "C-n") 'ac-next)
(define-key ac-menu-map (kbd "C-p") 'ac-previous)
