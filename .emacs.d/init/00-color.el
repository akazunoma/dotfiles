;; color
;; $ cd
;; $ curl -O http://gnuemacscolorthemetest.googlecode.com/files/color-theme-6.6.0-mav.zip
;; $ unzip color-theme-6.6.0-mav.zip
;; $ mv color-theme-6.6.0/themes color-theme-6.6.0/color-theme.el .emacs.d/elisp
(require 'color-theme)
(color-theme-initialize)
(color-theme-midnight)

(set-frame-parameter nil 'alpha 100)

(global-hl-line-mode t)
(set hl-line-face '(:background "Navy" t))
