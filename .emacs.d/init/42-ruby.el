;; Ruby

;; ruby mode
;; cd
;; cp .rvm/src/ruby-1.9.3-p125/misc/ruby-mode.el .emacs.d/elisp/
(autoload 'ruby-mode "ruby-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rb.sample$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.thor$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.builder$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("[Rr]akefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("[Gg]emfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("[Cc]apfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("[Gg]uardfile$" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))
(add-hook 'ruby-mode-hook
          '(lambda ()
             (setq ruby-deep-indent-paren '(t))
             (define-key ruby-mode-map (kbd "C-x C-t") 'open-terminal)
             (define-key ruby-mode-map (kbd "C-m") 'ruby-reindent-then-newline-and-indent)
             (define-key ruby-mode-map (kbd "C-j") 'newline)
             (define-key ruby-mode-map (kbd "M-a") 'ruby-beginning-of-defun)
             (define-key ruby-mode-map (kbd "M-e") 'ruby-end-of-defun)
             (define-key ruby-mode-map (kbd "M-f") 'ruby-forward-sexp)
             (define-key ruby-mode-map (kbd "M-b") 'ruby-backward-sexp)
             (define-key ruby-mode-map (kbd "C-M-a") 'backward-sentence)
             (define-key ruby-mode-map (kbd "C-M-e") 'forward-sentence)
             (define-key ruby-mode-map (kbd "C-M-f") 'forward-word)
             (define-key ruby-mode-map (kbd "C-M-b") 'backward-word)))

;; http://willnet.in/13
(defadvice ruby-indent-line (after unindent-closing-paren activate)
  (let ((column (current-column))
        indent offset)
    (save-excursion
      (back-to-indentation)
      (let ((state (syntax-ppss)))
        (setq offset (- column (current-column)))
        (when (and (eq (char-after) ?\))
                   (not (zerop (car state))))
          (goto-char (cadr state))
          (setq indent (current-indentation)))))
    (when indent
      (indent-line-to indent)
      (when (> offset 0) (forward-char offset)))))

;; rsense
;; $ cd
;; $ curl -O http://cx4a.org/pub/rsense/rsense-0.3.zip
;; $ unzip rsense-0.3.zip
;; $ mv rsense-0.3 .emacs.d/elisp/rsense
;; $ export RSENSE_HOME=$HOME/.emacs.d/elisp/rsense
;; $ cd $RSENSE_HOME
;; $ chmod +x bin/rsense
;; $ ruby etc/config.rb > ~/.rsense
;; $ cd
;; $ curl -O http://www.ruby-lang.org/ja/man/archive/ruby-refm-1.9.2-dynamic-20110629.zip
;; $ unzip ruby-refm-1.9.2-dynamic-20110629.zip
;; $ mv ruby-refm-1.9.2-dynamic-20110629 ~/Dropbox/Documents/ruby-refm
(setq rsense-home (expand-file-name "~/.emacs.d/elisp/rsense"))
(setq rsense-rurema-home "~/Dropbox/Documents/ruby-refm")
(setq rsense-rurema-refe "refe-1_9_2")
(add-hook 'ruby-mode-hook
          '(lambda ()
             (require 'rsense)
             (add-to-list 'ac-sources 'ac-source-rsense-method)
             (add-to-list 'ac-sources 'ac-source-rsense-constant)
             (define-key ruby-mode-map (kbd "C-x C-.") 'ac-complete)))

;; rinari
;; $ cd ~/emacs.d/elisp
;; $ git clone git://github.com/eschulte/rinari.git
(require 'rinari)
