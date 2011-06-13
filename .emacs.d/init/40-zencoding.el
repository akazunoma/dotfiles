;; zencoding mode
;; (install-elisp "https://raw.github.com/rooney/zencoding/master/zencoding-mode.el")
(require 'zencoding-mode)
(setq zencoding-indentation 2)
(add-hook 'html-mode-hook 'zencoding-mode)
(add-hook 'sgml-mode-hook 'zencoding-mode)
(add-hook 'text-mode-hook 'zencoding-mode)
