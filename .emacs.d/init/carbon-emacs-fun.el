(defun copy-current-dir ()
  (interactive)
  (shell-command-to-string "pwd | perl -pe 's/(\r|\n)//' | pbcopy"))

(defun copy-current-path ()
  (interactive)
  (shell-command-to-string (concat "echo " buffer-file-name " | pbcopy")))

(defun open-terminal ()
  (interactive)
  (shell-command-to-string "open -a terminal"))

(defun open-echofon ()
  (interactive)
  (shell-command-to-string "open -a echofon"))

(defun browse-url-default-macosx-browser (url &optional new-window)
  (interactive (browse-url-interactive-arg "URL: "))
  (start-process (concat "open " url) nil "open" url "-g"))

(define-key global-map (kbd "C-x C-d") 'copy-current-dir)
(define-key global-map (kbd "C-x C-p") 'copy-current-path)
(define-key global-map (kbd "C-x C-t") 'open-terminal)
(define-key global-map (kbd "A-C-e") 'open-echofon)
