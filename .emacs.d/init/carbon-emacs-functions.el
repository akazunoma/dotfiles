;; Carbon Emacs

;; functions
(defun copy-current-dir ()
  (interactive)
  (shell-command-to-string "pwd | perl -pe 's/(\r|\n)//' | pbcopy"))

(defun copy-current-path ()
  (interactive)
  (shell-command-to-string (concat "echo " buffer-file-name " | pbcopy")))

(defun open-terminal ()
  (interactive)
  (shell-command-to-string "open -a terminal"))

(defun open-yorufukurou ()
  (interactive)
  (shell-command-to-string "open -a yorufukurou"))

(define-key global-map (kbd "C-x C-d") 'copy-current-dir)
(define-key global-map (kbd "C-x C-p") 'copy-current-path)
(define-key global-map (kbd "C-x C-t") 'open-terminal)
(define-key global-map (kbd "A-E") 'open-yorufukurou)
