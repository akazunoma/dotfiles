;; Basic

;; language
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)
(setq file-name-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)

;; display
(setq default-frame-alist
      '((width . 150)
        (height . 45)
        (font . "-apple-monaco-medium-r-normal--13-120-72-72-m-120-iso10646-1")))
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
(set-frame-parameter nil 'alpha 100)
(global-hl-line-mode t)

;; tabbar
;; (install-elisp "http://www.emacswiki.org/emacs/download/tabbar.el")
(require 'tabbar)
(tabbar-mode t)
(dolist (button '(tabbar-buffer-home-button
                  tabbar-scroll-left-button
                  tabbar-scroll-right-button))
  (set button (cons (cons "" nil)
                    (cons "" nil))))
(setq tabbar-buffer-groups-function
      '(lambda ()
         (list
          (symbol-name major-mode))))
(setq tabbar-buffer-list-function
      '(lambda ()
         (remove-if
          '(lambda (buffer)
             (find (aref (buffer-name buffer) 0) " *"))
           (buffer-list))))
(set-face-attribute
 'tabbar-default nil
 :family "monaco"
 :background "gray30"
 :height 1.0)
(set-face-attribute
 'tabbar-selected nil
 :foreground "gray10"
 :background "gray80"
 :box nil)
(set-face-attribute
 'tabbar-unselected nil
 :foreground "gray70"
 :background "gray30"
 :box nil)
(set-face-attribute
 'tabbar-separator nil
 :foreground "gray30"
 :background "gray30")
(setq tabbar-separator '(1))
