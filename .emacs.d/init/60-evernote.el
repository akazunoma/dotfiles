;; evernote
;; $ cd
;; $ curl -O http://emacs-evernote-mode.googlecode.com/files/evernote-mode-0_13.zip
;; $ tar zxvf evernote-mode-0_13.zip
;; $ mv evernote-mode-0_13 ~/.emacs.d/elisp/evernote
;; $ cd ~/.emacs.d/elisp/evernote
;; $ ruby ruby/setup.rb
(add-to-list 'load-path "~/.emacs.d/elisp/evernote")
(require 'evernote-mode)
