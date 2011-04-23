;; ruby mode
;; (install-elisp "http://svn.ruby-lang.org/cgi-bin/viewvc.cgi/trunk/misc/ruby-mode.el?view=co")
(require 'ruby-mode)
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.builder$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("[Rr]akefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("[Gg]emfile$" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))
(add-hook 'ruby-mode-hook
          '(lambda ()
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
(add-hook 'after-save-hook
          '(lambda ()
             (when (string-match "[Gg]emfile$" buffer-file-name)
               (growl "Gemfile has been modified" "Should be bundle install"))))

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
;; $ curl -O http://www.ruby-lang.org/ja/man/archive/ruby-refm-1.9.2-dynamic-20101229.tar.bz2
;; $ tar zxvf ruby-refm-1.9.2-dynamic-20101229.tar.bz2
;; $ mv ruby-refm-1.9.2-dynamic-20101229 ~/dropbox/doc/refm/ruby-refm
(setq rsense-home (expand-file-name "~/.emacs.d/elisp/rsense"))
(require 'rsense)
(setq rsense-rurema-home "~/dropbox/doc/refm/ruby-refm")
(setq rsense-rurema-refe "refe-1_9_2")
(add-hook 'ruby-mode-hook
          '(lambda ()
             (add-to-list 'ac-sources 'ac-source-rsense-method)
             (add-to-list 'ac-sources 'ac-source-rsense-constant)
             (define-key ruby-mode-map (kbd "C-x C-.") 'ac-complete)))
