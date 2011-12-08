;; ruby mode
;; (install-elisp "http://svn.ruby-lang.org/cgi-bin/viewvc.cgi/trunk/misc/ruby-mode.el?view=co")
(require 'ruby-mode)
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.thor$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.builder$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("[Rr]akefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("[Gg]emfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("[Cc]apfile$" . ruby-mode))
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
;; $ curl -O http://www.ruby-lang.org/ja/man/archive/ruby-refm-1.9.2-dynamic-20110629.zip
;; $ unzip ruby-refm-1.9.2-dynamic-20110629.zip
;; $ mv ruby-refm-1.9.2-dynamic-20110629 ~/Dropbox/Documents/ruby-refm
(setq rsense-home (expand-file-name "~/.emacs.d/elisp/rsense"))
(require 'rsense)
(setq rsense-rurema-home "~/Dropbox/Documents/ruby-refm")
(setq rsense-rurema-refe "refe-1_9_2")
(add-hook 'ruby-mode-hook
          '(lambda ()
             (add-to-list 'ac-sources 'ac-source-rsense-method)
             (add-to-list 'ac-sources 'ac-source-rsense-constant)
             (define-key ruby-mode-map (kbd "C-x C-.") 'ac-complete)))

;; haml mode
;; (install-elisp "https://raw.github.com/nex3/haml-mode/master/haml-mode.el")
(require 'haml-mode)

;; sass mode
;; (install-elisp "https://raw.github.com/nex3/sass-mode/master/sass-mode.el")
(require 'sass-mode)
(add-to-list 'auto-mode-alist '("\\.sass$" . sass-mode))
(add-to-list 'auto-mode-alist '("\\.scss$" . sass-mode))
(add-to-list 'auto-mode-alist '("\\.less$" . sass-mode))


;; rinari
(require 'rinari)

;; execute ruby
(defun execute-ruby-whole-buffer ()
  (interactive)
  (let (buf)
    (save-excursion
      (setq buf (get-buffer-create "*result ruby execution*"))
      (mark-whole-buffer)
      (call-process-region (region-beginning) (region-end) "ruby" nil buf nil)
      (display-buffer buf))))
(add-hook 'ruby-mode-hook
          '(lambda ()
             (define-key ruby-mode-map (kbd "C-x C-e") 'execute-ruby-whole-buffer)))
