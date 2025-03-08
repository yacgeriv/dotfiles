(setq make-backup-files nil)
(set-frame-font "Iosevka 15")
(load-theme 'gruber-darker t)
(menu-bar-mode -1)
(tool-bar-mode -1)

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)

(add-hook 'c++-mode-hook 'display-line-numbers-mode)
(add-hook 'c-mode-hook 'display-line-numbers-mode)
(setq linum-format "%3d ")

(setq c-default-style "linux")
(defun my-c-mode-hook ()
  (setq indent-tabs-mode t)
  (setq tab-width 8))
(add-hook 'c-mode-hook 'my-c-mode-hook)

(setq split-width-threshold nil)

(set-frame-parameter nil 'alpha-background 70)
(add-to-list 'default-frame-alist '(alpha-background . 70))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(gruber-darker-theme yasnippet which-key projectile minimal-theme lsp-ui inkpot-theme helm-xref helm-lsp flycheck eziam-themes dap-mode company catppuccin-theme badwolf-theme badger-theme almost-mono-themes ahungry-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
