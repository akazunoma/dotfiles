;; twittering mode
;; (install-elisp "http://github.com/hayamiz/twittering-mode/raw/master/twittering-mode.el")
(require 'twittering-mode)
(setq twittering-status-format "%i @%s: %T [%@]")
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
