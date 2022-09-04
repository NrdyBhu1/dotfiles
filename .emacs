(require 'package)
;; (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(atom-one-dark))
 '(custom-safe-themes
   '("37046960cf667c5ab3b76235d35a5db4763c531e706502a9067fa78db5a775c0" default))
 '(inhibit-startup-screen t)
 '(package-selected-packages
   '(doom-modeline magit projectile all-the-icons tree-sitter-langs tree-sitter dashboard-ls dashboard badwolf-theme atom-one-dark-theme cargo lusty-explorer fzf company rust-mode lsp-ui typescript-mode ts lsp-mode exwm)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "JetBrainsMono NF" :foundry "JB  " :slant normal :weight normal :height 120 :width normal)))))
(menu-bar-mode -1)
(menu-bar-showhide-tool-bar-menu-customize-disable)
(ido-mode)
(global-linum-mode)
(scroll-bar-mode -1)
;; treesitter emacs

(require 'tree-sitter)
(require 'tree-sitter-langs)
(global-tree-sitter-mode)

;; all the icons
(require 'all-the-icons)
(require 'doom-modeline)
(doom-modeline-mode 1)
;; Or if you use use-package
;; (use-package dashboard
;;   :ensure t
;;   :config
;;   (dashboard-setup-startup-hook))
;; (require 'dashboard-ls
;; (setq dashboard-items '((ls-directories . 5)
;; (ls-files . 5)))

(setq dashboard-set-heading-icons t)
(setq dashboard-set-file-icons t)
(require 'dashboard)
(dashboard-setup-startup-hook)

(require 'lusty-explorer)
