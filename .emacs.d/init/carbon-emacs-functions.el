;; Carbon Emacs

;; functions
(defun open-terminal ()
  (interactive)
  (shell-command-to-string "open -a terminal"))

(defun open-yorufukurou ()
  (interactive)
  (shell-command-to-string "open -a yorufukurou"))

(define-key global-map (kbd "C-x C-t") 'open-terminal)
(define-key global-map (kbd "A-E") 'open-yorufukurou)
