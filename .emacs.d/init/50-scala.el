;; scala mode
;; $ cp -r /opt/local/share/scala-2.8/misc/scala-tool-support/emacs ~/.emacs.d/elisp/scala
(require 'scala-mode-auto)
(add-to-list 'auto-mode-alist '("\\.scala$" . scala-mode))

;; ensime
;; $ cd
;; $ curl -O http://cloud.github.com/downloads/aemoncannon/ensime/ensime_2.8.1-0.5.0.tar.gz
;; $ tar -xvf ensime_2.8.1-0.5.0.tar.gz
;; $ mv ensime_2.8.1-0.5.0 .emacs.d/elisp/ensime/
(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
