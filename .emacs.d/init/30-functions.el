;; Functions

;; functions
(defun indent-whole-buffer ()
  (interactive)
  (indent-region (point-min) (point-max))
  (untabify (point-min) (point-max)))

(defun indent-and-back-to-indentation ()
  (interactive)
  (indent-for-tab-command)
  (let ((point-of-indentation
         (save-excursion
           (back-to-indentation)
           (point))))
    (skip-chars-forward "\s " point-of-indentation)))

(defun next-window-or-split-vertically ()
  (interactive)
  (when (one-window-p)
    (split-window-vertically))
  (other-window 1))

(defun next-window-or-split-horizontally ()
  (interactive)
  (when (one-window-p)
    (split-window-horizontally))
  (other-window 1))

(defun prev-window-or-split-horizontally ()
  (interactive)
  (when (one-window-p)
    (split-window-horizontally))
  (other-window -1))

(setq growl-program (executable-find "growlnotify"))
(defun growl (title message &optional app)
  (when growl-program
    (unless app
      (setq app ""))
    (start-process "Growl" "*Growl*" growl-program
                   "-t" title
                   "-m" message
                   "-a" app)))

;; aliases
(defalias 'exit 'save-buffers-kill-emacs)
(defalias 'yes-or-no-p 'y-or-n-p)
