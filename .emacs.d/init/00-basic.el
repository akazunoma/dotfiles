;; Basic

;; language
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)
(setq file-name-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)

;; display
(setq initial-frame-alist
      '((width . 150)
        (height . 45)))
(setq default-frame-alist initial-frame-alist)
(display-time-mode t)
(menu-bar-mode 0)
(line-number-mode t)
(column-number-mode t)

;; server
(server-start)

;; sound
(setq visible-bell t)
(setq ring-bell-function 'ignore)

;; color
;; $ cd
;; $ curl -O http://gnuemacscolorthemetest.googlecode.com/files/color-theme-6.6.0-mav.zip
;; $ unzip color-theme-6.6.0-mav.zip
;; $ mv color-theme-6.6.0/themes color-theme-6.6.0/color-theme.el .emacs.d/elisp
(require 'color-theme)
(color-theme-initialize)
(color-theme-midnight)
(set-frame-parameter nil 'alpha 85)
(global-hl-line-mode t)
(set hl-line-face '(:background "Navy" t))

;; elscreen
;; $ cd
;; $ curl -O ftp://ftp.morishima.net/pub/morishima.net/naoto/ElScreen/elscreen-1.4.6.tar.gz
;; $ tar -xvf elscreen-1.4.6.tar.gz
;; $ mv elscreen-1.4.6/elscreen.el .emacs.d/elisp/
(require 'elscreen nil t)
(setq elscreen-display-tab t)
