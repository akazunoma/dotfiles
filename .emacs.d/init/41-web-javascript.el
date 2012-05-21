;; JavaScript

;; js2 mode
;; (install-elisp "http://js2-mode.googlecode.com/files/js2-20090723b.el")
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js2-mode))
(setq js2-basic-offset 2)
(setq js2-cleanup-whitespace t)
(setq js2-mirror-mode nil)
(setq js2-indent-on-enter-key t)
(setq js2-enter-indents-newline t)
(setq js2-strict-missing-semi-warning t)
(setq js2-mode-indent-inhibit-undo t)
(setq js2-bounce-indent-flag nil)
(add-hook 'js2-mode-hook
          '(lambda ()
             (define-key js2-mode-map (kbd "C-m") nil)))

;; gjslint
;; (install-elisp "http://gist.github.com/raw/561978/gjslint.el")
(add-hook 'js2-mode-hook
          '(lambda ()
             (require 'gjslint)
             (flymake-mode t)))

;; espresso mode
;; (install-elisp "http://download-mirror.savannah.gnu.org/releases/espresso/espresso.el")
(add-hook 'js2-mode-hook
          '(lambda ()
             (require 'espresso)
             (setq espresso-indent-level 2)
             (set (make-local-variable 'indent-line-function) 'js2-indent-function)))

;; http://mihai.bazon.net/projects/editing-javascript-with-emacs-js2-mode
(defun js2-indent-function ()
  (interactive)
  (save-restriction
    (widen)
    (let* ((inhibit-point-motion-hooks t)
           (parse-status (save-excursion (syntax-ppss (point-at-bol))))
           (offset (- (current-column) (current-indentation)))
           (indentation (espresso--proper-indentation parse-status))
           node)
      (save-excursion
        (back-to-indentation)
        (if (looking-at "case\\s-")
            (setq indentation (+ indentation (/ espresso-indent-level 2))))
        (setq node (js2-node-at-point))
        (when (and node
                   (= js2-NAME (js2-node-type node))
                   (= js2-VAR (js2-node-type (js2-node-parent node))))
          (setq indentation (+ 4 indentation))))
      (indent-line-to indentation)
      (when (> offset 0) (forward-char offset)))))

;; coffee mode
;; (install-elisp "https://github.com/defunkt/coffee-mode/raw/master/coffee-mode.el")
(autoload 'coffee-mode "coffee-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))

