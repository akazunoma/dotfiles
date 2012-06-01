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

(defun github-markup-preview ()
  (interactive)
  (defcustom
    github-markup-command (executable-find "github-markup")
    "github-markup-command"
    :type 'string
    :group 'github-markup)
  (defcustom
    github-markup-directory temporary-file-directory
    "github-markup-directory"
    :type 'string
    :group 'github-markup)
  (let ((github-markup-file-path
         (concat github-markup-directory (format-time-string "%Y%m%d%H%M%S" (current-time)) ".html")))
    (shell-command-to-string
     (concat github-markup-command " " buffer-file-name " > " github-markup-file-path))
    (shell-command-to-string
     (concat "open " github-markup-file-path))))

(define-key global-map (kbd "C-x C-d") 'copy-current-dir)
(define-key global-map (kbd "C-x C-p") 'copy-current-path)
(define-key global-map (kbd "C-x C-t") 'open-terminal)
(define-key global-map (kbd "A-E") 'open-yorufukurou)

