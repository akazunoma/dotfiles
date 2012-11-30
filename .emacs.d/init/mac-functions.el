;; Mac

;; functions
(defun browse-url-default-macosx-browser (url &optional new-window)
  (interactive (browse-url-interactive-arg "URL: "))
  (start-process (concat "open" url) nil "open" "--background" url))

(defun copy-current-dir ()
  (interactive)
  (shell-command-to-string "pwd | perl -pe 's/(\r|\n)//' | pbcopy"))

(defun copy-current-path ()
  (interactive)
  (shell-command-to-string (concat "echo " buffer-file-name " | pbcopy")))

(define-key global-map (kbd "C-x C-d") 'copy-current-dir)
(define-key global-map (kbd "C-x C-p") 'copy-current-path)
