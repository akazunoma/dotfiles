;; add .emacs to load path
(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/elisp")

;; language and coding
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)
(setq file-name-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)

;; server
(server-start)

;; frame and display
(setq initial-frame-alist
      '((width . 150)
        (height . 45)))
(setq default-frame-alist initial-frame-alist)

(display-time-mode t)
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode t)
(line-number-mode t)
(column-number-mode t)

;; color
;; $ cd
;; $ curl -O http://gnuemacscolorthemetest.googlecode.com/files/color-theme-6.6.0-mav.zip
;; $ unzip color-theme-6.6.0-mav.zip
;; $ mv color-theme-6.6.0/themes color-theme-6.6.0/color-theme.el .emacs.d/elisp
(require 'color-theme)
(color-theme-initialize)
(color-theme-midnight)

(set-frame-parameter nil 'alpha 100)

(global-hl-line-mode t)
(set hl-line-face '(:background "Navy" t))

;; elscreen
;; $ cd
;; $ curl -O ftp://ftp.morishima.net/pub/morishima.net/naoto/ElScreen/elscreen-1.4.6.tar.gz
;; $ tar -xvf elscreen-1.4.6.tar.gz
;; $ cp elscreen-1.4.6/elscreen.el .emacs.d/elisp/
(require 'elscreen nil t)
(setq elscreen-display-tab t)

;; sound
(setq visible-bell t)
(setq ring-bell-function 'ignore)

;; tab
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq-default basic-offset 2)
(setq-default c-basic-offset 2)

;; paren
(show-paren-mode t)
(setq show-paren-delay 0)
(setq show-paren-style 'expression)
(set-face-background 'show-paren-match-face nil)
(set-face-underline-p 'show-paren-match-face t)

;; if use mac
(when (eq window-system 'mac)
  (mac-key-mode t)
  (setq mac-control-modifier 'control)
  (setq mac-command-modifier 'alt)
  (setq mac-option-modifier 'meta)
  (setq mac-pass-control-to-system nil)
  (setq mac-pass-command-to-system nil)
  (setq mac-pass-option-to-system nil)
  (defun copy-current-dir ()
    (interactive)
    (shell-command-to-string "pwd | perl -pe 's/(\r|\n)//' | pbcopy"))
  (define-key global-map (kbd "C-x C-d") 'copy-current-dir)
  (defun copy-current-path ()
    (interactive)
    (shell-command-to-string (concat "echo " buffer-file-name " | pbcopy")))
  (define-key global-map (kbd "C-x C-p") 'copy-current-path)
  (defun open-terminal ()
    (interactive)
    (shell-command-to-string "open -a terminal"))
  (define-key global-map (kbd "C-x C-t") 'open-terminal)
  (defun open-echofon ()
    (interactive)
    (shell-command-to-string "open -a echofon"))
  (define-key global-map (kbd "A-C-e") 'open-echofon)
  (defun browse-url-default-macosx-browser (url &optional new-window)
    (interactive (browse-url-interactive-arg "URL: "))
    (start-process (concat "open " url) nil "open" url "-g")))

;; key
(defun indent-and-back-to-indentation ()
  (interactive)
  (indent-for-tab-command)
  (let ((point-of-indentation
         (save-excursion
           (back-to-indentation)
           (point))))
    (skip-chars-forward "\s " point-of-indentation)))

(defun other-window-or-split-vertically ()
  (interactive)
  (when (one-window-p)
    (split-window-vertically))
  (other-window 1))

(defun other-window-or-split-horizontally ()
  (interactive)
  (when (one-window-p)
    (split-window-horizontally))
  (other-window 1))

(defalias 'exit 'save-buffers-kill-emacs)
(defalias 'yes-or-no-p 'y-or-n-p)

(define-key global-map (kbd "C-m") 'newline-and-indent)
(define-key global-map (kbd "C-i") 'indent-and-back-to-indentation)
(define-key global-map (kbd "C-j") 'indent-new-comment-line)
(define-key global-map (kbd "C-h") 'delete-backward-char)
(define-key global-map (kbd "C-t") 'other-window-or-split-horizontally)
(define-key global-map (kbd "C-w") 'copy-region-as-kill)
(define-key global-map (kbd "C-^") 'enlarge-window)
(define-key global-map (kbd "M-a") 'beginning-of-defun)
(define-key global-map (kbd "M-e") 'end-of-defun)
(define-key global-map (kbd "M-f") 'forward-sexp)
(define-key global-map (kbd "M-b") 'backward-sexp)
(define-key global-map (kbd "M-v") 'scroll-other-window)
(define-key global-map (kbd "M-$") 'replace-string)
(define-key global-map (kbd "M-?") 'help-for-help)
(define-key global-map (kbd "M-!") 'multi-term)
(define-key global-map (kbd "M-o") 'occur-by-moccur)
(define-key global-map (kbd "M-k") 'kill-this-buffer)
(define-key global-map (kbd "M-p") 'point-undo)
(define-key global-map (kbd "M-n") 'point-redo)
(define-key global-map (kbd "M-t") 'delete-window)
(define-key global-map (kbd "M-w") 'kill-region)
(define-key global-map (kbd "C-M-a") 'backward-sentence)
(define-key global-map (kbd "C-M-e") 'forward-sentence)
(define-key global-map (kbd "C-M-f") 'forward-word)
(define-key global-map (kbd "C-M-b") 'backward-word)
(define-key global-map (kbd "C-M-_") 'redo)
(define-key global-map (kbd "C-M-v") 'scroll-down)
(define-key global-map (kbd "C-M-$") 'replace-regexp)
(define-key global-map (kbd "C-x f") 'anything-find-file)
(define-key global-map (kbd "C-x b") 'list-buffers)
(define-key global-map (kbd "C-x ^") 'enlarge-window-horizontally)
(define-key global-map (kbd "C-x %") 'query-replace-regexp)
(define-key global-map (kbd "C-x $") 'replace-regexp)
(define-key global-map (kbd "C-x C-.") 'auto-complete)
(define-key global-map (kbd "C-x C-a") 'anything-recentf)
(define-key global-map (kbd "C-x C-c") 'server-edit)
(define-key global-map (kbd "C-x C-f") 'anything)
(define-key global-map (kbd "C-x C-b") 'switch-to-buffer)
(define-key global-map (kbd "C-x C-i") 'indent-region)
(define-key global-map (kbd "C-c C-t") 'twittering-mode)
(define-key global-map (kbd "C-c C-u") 'twittering-update-status-interactive)
(define-key global-map (kbd "C-z C-z") 'suspend-emacs)
(define-key global-map (kbd "C-<tab>") 'elscreen-next)
(define-key global-map (kbd "C-S-<tab>") 'elscreen-previous)
(define-key global-map (kbd "A-]") 'elscreen-next)
(define-key global-map (kbd "A-[") 'elscreen-previous)
(define-key global-map (kbd "A-}") 'elscreen-next)
(define-key global-map (kbd "A-{") 'elscreen-previous)
(define-key global-map (kbd "A-n") 'elscreen-create)
(define-key global-map (kbd "A-k") 'elscreen-kill)

;; anything
;; (auto-install-batch "anything")
(add-to-list 'load-path "~/.emacs.d/elisp/anything")
(require 'anything-startup)

;; uniquify
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
(setq uniquify-ignore-buffers-re "*[^*]+*")

;; file
(setq require-final-newline t)
(setq kill-whole-line t)
(setq backup-inhibited t)
(setq delete-auto-save-files t)

;; wdired
(require 'wdired)
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)

;; recentf-ext
;; (install-elisp "http://www.emacswiki.org/cgi-bin/wiki/download/recentf-ext.el")
(setq recentf-auto-cleanup 'never)
(setq recentf-max-menu-items 10000)
(setq recentf-max-save-items 10000)
(setq recentf-max-saved-items 10000)
(require 'recentf-ext)

;; color-moccur and moccur edit
;; (install-elisp "http://www.emacswiki.org/emacs/download/color-moccur.el")
;; (install-elisp "http://www.emacswiki.org/emacs/download/moccur-edit.el")
(require 'color-moccur)
(require 'moccur-edit)
(setq moccur-split-word t)
(add-to-list 'dmoccur-exclusion-mask "\\.DS_Store")
(add-to-list 'dmoccur-exclusion-mask "^#.+#$")

;; igrep
;; (install-elisp "http://www.emacswiki.org/emacs/download/igrep.el")
(require 'igrep)

;; grep edit
;; (install-elisp "http://www.emacswiki.org/emacs/download/grep-edit.el")
(require 'grep-edit)

;; redo+
;; (install-elisp "http://www.emacswiki.org/emacs/download/redo+.el")
(require 'redo+)

;; point-undo
;; (install-elisp "http://www.emacswiki.org/cgi-bin/wiki/download/point-undo.el")
(require 'point-undo)

;; undo-tree
;; (install-elisp "http://www.dr-qubit.org/undo-tree/undo-tree.el")
(require 'undo-tree nil t)
(global-undo-tree-mode)

;; undohist
;; (install-elisp "http://cx4a.org/pub/undohist.el")
(require 'undohist)
(undohist-initialize)

;; tramp
(require 'tramp)

;; multi term
;; (install-elisp "http://www.emacswiki.org/emacs/download/multi-term.el")
(require 'multi-term)
(setq multi-term-program "/bin/bash")
(add-hook 'term-mode-hook
          '(lambda ()
             (add-to-list 'term-unbind-key-list (kbd "C-t"))))

;; egg
;; (install-elisp "http://github.com/byplayer/egg/raw/master/egg.el")
(require 'egg)

;; auto-install
;; (install-elisp "http://www.emacswiki.org/emacs/download/auto-install.el")
(require 'auto-install)
(setq auto-install-directory "~/.emacs.d/elisp/")
(auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup)

;; auto complete
;; $ cd
;; $ curl -O http://cx4a.org/pub/auto-complete/auto-complete-1.3.tar.bz2
;; $ tar -xvf auto-complete-1.3.tar.bz2
;; M-x load-file RET ~/auto-complete-1.3/etc/install.el RET
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elisp/ac-dict")
(ac-config-default)
(setq ac-ignore-case t)
(setq ac-use-menu-map t)
(define-key ac-menu-map (kbd "C-n") 'ac-next)
(define-key ac-menu-map (kbd "C-p") 'ac-previous)

;; textmate mode
;; $ cd
;; $ curl -O http://emacs-textmate.googlecode.com/files/emacs-textmate-0.1.tbz
;; $ tar zxvf emacs-textmate-0.1.tbz
;; $ mv emacs-textmate-0.1/textmate.el ~/.emacs.d/elisp/textmate-mode.el
(require 'textmate-mode)

;; lisp mode
(add-hook 'emacs-lisp-mode-hook
          '(lambda ()
             (setq ac-sources '(ac-source-words-in-same-mode-buffers ac-source-symbols))))

;; eldoc
;; (install-elisp "http://www.emacswiki.org/emacs/download/eldoc-extension.el")
(require 'eldoc-extension)
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)

;; js2 mode
;; (install-elisp "http://js2-mode.googlecode.com/files/js2-20090723b.el")
(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
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
             (define-key js2-mode-map (kbd "C-m") 'newline-and-indent)
             (define-key js2-mode-map (kbd "C-i") 'indent-and-back-to-indentation)))

;; gjslint
;; (install-elisp "http://gist.github.com/raw/561978/gjslint.el")
(require 'gjslint)
(add-hook 'js2-mode-hook
          '(lambda ()
             (flymake-mode t)))

;; html mode
(defvar html-mode-map (make-sparse-keymap))
(define-key html-mode-map (kbd "C-\\") 'php-mode)

;; php mode
;; (install-elisp "http://php-mode.svn.sourceforge.net/svnroot/php-mode/tags/php-mode-1.5.0/php-mode.el")
(require 'php-mode)
(add-hook 'php-mode-hook
          '(lambda()
             (textmate-mode t)
             (define-key php-mode-map (kbd "C-\\") 'html-mode)))

;; ruby mode
;; (install-elisp "http://svn.ruby-lang.org/cgi-bin/viewvc.cgi/trunk/misc/ruby-mode.el?view=co")
(require 'ruby-mode)
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.builder$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))
(add-hook 'ruby-mode-hook
          '(lambda ()
             (define-key ruby-mode-map (kbd "C-m") 'ruby-reindent-then-newline-and-indent)
             (define-key ruby-mode-map (kbd "M-a") 'ruby-beginning-of-defun)
             (define-key ruby-mode-map (kbd "M-e") 'ruby-end-of-defun)
             (define-key ruby-mode-map (kbd "M-f") 'ruby-forward-sexp)
             (define-key ruby-mode-map (kbd "M-b") 'ruby-backward-sexp)
             (define-key ruby-mode-map (kbd "C-M-a") 'backward-sentence)
             (define-key ruby-mode-map (kbd "C-M-e") 'forward-sentence)
             (define-key ruby-mode-map (kbd "C-M-f") 'forward-word)
             (define-key ruby-mode-map (kbd "C-M-b") 'backward-word)))

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
;; $ curl -O http://www.ruby-lang.org/ja/man/archive/ruby-refm-1.9.2-dynamic-20100929.zip
;; $ unzip ruby-refm-1.9.2-dynamic-20100929.zip
;; $ mv ruby-refm-1.9.2-dynamic-20100929 ~/dropbox/doc/refm/ruby-refm
(setq rsense-home (expand-file-name "~/.emacs.d/elisp/rsense"))
(add-to-list 'load-path (concat rsense-home "/etc"))
(require 'rsense)
(setq rsense-rurema-home "~/dropbox/doc/refm/ruby-refm")
(setq rsense-rurema-refe "refe-1_9_2")
(add-hook 'ruby-mode-hook
          '(lambda ()
             (add-to-list 'ac-sources 'ac-source-rsense-method)
             (add-to-list 'ac-sources 'ac-source-rsense-constant)
             (define-key ruby-mode-map (kbd "C-x C-.") 'ac-complete)))

;; scala mode
;; $ cp -r /opt/local/share/scala-2.8/misc/scala-tool-support/emacs ~/.emacs.d/elisp/scala
(add-to-list 'load-path "~/.emacs.d/elisp/scala")
(require 'scala-mode-auto)
(add-to-list 'auto-mode-alist '("\\.scala$" . scala-mode))

;; ensime
;; $ cd
;; $ curl -O http://cloud.github.com/downloads/aemoncannon/ensime/ensime_2.8.1.RC3-0.3.6.tar.gz
;; $ tar -xvf ensime_2.8.1.RC3-0.3.6.tar.gz
;; $ mv ensime_2.8.1.RC3-0.3.6 .emacs.d/elisp/ensime/
(add-to-list 'load-path "~/.emacs.d/elisp/ensime/elisp")
(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

;; yaml mode
;; (install-elisp "http://github.com/yoshiki/yaml-mode/raw/master/yaml-mode.el")
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

;; growl
(setq growl-program "/usr/local/bin/growlnotify")
(defun growl (title message &optional app)
  (start-process "Growl" "*Growl*" growl-program
                 "-t" title
                 "-m" message
                 "-a" app))

;; twittering mode
;; (install-elisp "http://github.com/hayamiz/twittering-mode/raw/master/twittering-mode.el")
(require 'twittering-mode)
(require 'twittering-account-config)
(setq twittering-status-format "%i @%s / %S %p: \n %T\n [%@]%r %R %f%L\n")
(setq twittering-retweet-format " RT @%s: %t")
(setq twittering-use-ssl nil)
(setq twittering-icon-mode nil)
(setq twittering-scroll-mode nil)
(setq twittering-convert-fix-size 48)
(setq twittering-timer-interval 60)
(setq twittering-update-status-function 'twittering-update-status-from-pop-up-buffer)
(add-hook 'twittering-mode-hook
          '(lambda ()
             (define-key twittering-mode-map (kbd "t") 'other-window-or-split-vertically)
             (define-key twittering-mode-map (kbd "^") 'enlarge-window)
             (define-key twittering-mode-map (kbd "F") 'twittering-favorite)
             (define-key twittering-mode-map (kbd "R") 'twittering-reply-to-user)
             (define-key twittering-mode-map (kbd "Q") 'twittering-organic-retweet)
             (define-key twittering-mode-map (kbd "T") 'twittering-native-retweet)
             (define-key twittering-mode-map (kbd "M") 'twittering-direct-message)
             (define-key twittering-mode-map (kbd "N") 'twittering-update-status-interactive)
             (define-key twittering-mode-map (kbd "<") 'beginning-of-buffer)
             (define-key twittering-mode-map (kbd ">") 'end-of-buffer)
             (define-key twittering-mode-map (kbd "C-c C-f") 'twittering-home-timeline)))
(add-hook 'twittering-new-tweets-hook
          '(lambda ()
             (let ((spec (car twittering-new-tweets-spec))
                   (title-format nil))
               (cond ((eq spec 'replies)
                      (setq title-format "%sから関連ツイート"))
                     ((eq spec 'direct_messages)
                      (setq title-format "%sから新規メッセージ")))
               (unless (eq title-format nil)
                 (dolist (el (reverse twittering-new-tweets-statuses))
                   (growl (format title-format (cdr (assoc 'user-screen-name el)))
                          (format "%s" (cdr (assoc 'text el)))
                          "Emacs")
                   (sleep-for 0 50))))))

;; evernote
;; $ cd
;; $ curl -O http://emacs-evernote-mode.googlecode.com/files/evernote-mode-0_13.zip
;; $ tar zxvf evernote-mode-0_13.zip
;; $ mv evernote-mode-0_13 ~/.emacs.d/elisp/evernote
;; $ cd ~/.emacs.d/elisp/evernote
;; $ ruby ruby/setup.rb
(add-to-list 'load-path "~/.emacs.d/elisp/evernote")
(require 'evernote-mode)
