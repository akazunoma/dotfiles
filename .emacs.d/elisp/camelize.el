;;; camelize.el --- Make a string from snake_case to CamelCase

;; Copyright (C) 2012 tomykaira

;; Author: tomykaira <tomykaira@gmail.com>
;; Keywords: emacs

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; Commentary:

;;; Code:

(defun camelize (s)
  "Convert under_score string S to CamelCase string."
  (let ((tok (split-string s "_")))
    (concat (car tok)
            (mapconcat '(lambda (word) (capitalize (downcase word)))
                       (cdr tok) ""))))

(defun camelize-region (beg end)
  (save-excursion
    (let ((c (camelize (buffer-substring-no-properties beg end))))
      (delete-region beg end)
      (goto-char (min beg end))
      (insert-before-markers c))))

(defun camelize-next-snake ()
  "Camelize the next snake cased string.

If transient-mark-mode is active and a region is activated,
camelize the region."
  (interactive)
  (let (beg end)
    (if (and (boundp 'transient-mark-mode) transient-mark-mode mark-active)
        (setq beg (mark)
              end (point))
      (setq beg (point)
            end (+ beg (skip-chars-forward "[:alnum:]_"))))
    (camelize-region beg end)))

(defun camelize-previous-snake ()
  "Camelize the next snake cased string.

If transient-mark-mode is active and a region is activated,
camelize the region."
  (interactive)
  (let (beg end)
    (if (and (boundp 'transient-mark-mode) transient-mark-mode mark-active)
        (setq beg (mark)
              end (point))
      (setq end (point)
            beg (+ end (skip-chars-backward "[:alnum:]_"))))
    (camelize-region beg end)))

(provide 'camelize)
;;; camelize.el ends here
