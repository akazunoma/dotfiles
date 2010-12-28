;; redo+
;; (install-elisp "http://www.emacswiki.org/emacs/download/redo+.el")
(require 'redo+)

;; point-undo
;; (install-elisp "http://www.emacswiki.org/cgi-bin/wiki/download/point-undo.el")
(require 'point-undo)

;; undo-tree
;; (install-elisp "http://www.dr-qubit.org/undo-tree/undo-tree.el")
(require 'undo-tree nil t)
(global-undo-tree-mode)

;; undohist
;; (install-elisp "http://cx4a.org/pub/undohist.el")
(require 'undohist)
(undohist-initialize)
