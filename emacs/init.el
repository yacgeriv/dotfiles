(setq make-backup-files nil)
(set-frame-font "consolas 15")
(load-theme 'vs-dark t)
(menu-bar-mode -1)
(tool-bar-mode -1)

(require 'package)

(setq package-archives
      '(("gnu" . "https://elpa.gnu.org/packages/")
        ("gnu-devel" . "https://elpa.gnu.org/devel/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")
        ("melpa" . "https://melpa.org/packages/")))

(when (< emacs-major-version 27)
  (package-initialize))

(add-hook 'c++-mode-hook 'display-line-numbers-mode)
(add-hook 'c-mode-hook 'display-line-numbers-mode)
(setq linum-format "%3d ")

(setq c-default-style "linux")
(defun my-c-mode-hook ()
  (setq indent-tabs-mode t)
  (setq tab-width 4))
(add-hook 'c-mode-hook 'my-c-mode-hook)

(setq split-width-threshold nil)

(set-frame-parameter nil 'alpha-background 100)
(add-to-list 'default-frame-alist '(alpha-background . 100))

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(defun compile-c-program ()
  (interactive)
  (defvar foo)
  (if (eq system-type 'gnu/linux)
      (setq foo (concat "sh compile.sh"))
    )
    (if (eq system-type 'windows-nt)
      (setq foo (concat "compile.bat"))
    )
  
  (shell-command foo))
 
(global-set-key [C-f1] 'compile-c-program)
(global-set-key (kbd "C-,") 'duplicate-line)

(require 'dashboard)
(setq dashboard-startup-banner "~/.emacs.d/pfp.jpg")
(dashboard-setup-startup-hook)

(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook (
         (XXX-mode . lsp)
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

(use-package lsp-ui :commands lsp-ui-mode)
(use-package helm-lsp :commands helm-lsp-workspace-symbol)
(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

(use-package dap-mode)

(use-package which-key
    :config
    (which-key-mode))

(setq lsp-diagnostics-provider :none)
(setq lsp-ui-sideline-show-diagnostics nil)
(setq lsp-headerline-breadcrumb-enable nil)

(add-hook 'c-mode-hook 'lsp-mode)
(add-hook 'c++-mode-hook 'lsp-mode)

(electric-pair-mode t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("8529b6ff705d30e6df50734db169b376e9de050ed56ce4e59ff98d774a710847"
     "e4a702e262c3e3501dfe25091621fe12cd63c7845221687e36a79e17cf3a67e0"
     "0d2c5679b6d087686dcfd4d7e57ed8e8aedcccc7f1a478cd69704c02e4ee36fe"
     "93011fe35859772a6766df8a4be817add8bfe105246173206478a0706f88b33d"
     "d481904809c509641a1a1f1b1eb80b94c58c210145effc2631c1a7f2e4a2fdf4"
     "0325a6b5eea7e5febae709dab35ec8648908af12cf2d2b569bedc8da0a3a81c1"
     "01a9797244146bbae39b18ef37e6f2ca5bebded90d9fe3a2f342a9e863aaa4fd"
     "32fbecf5323ac72f1e55a2bbee83f3d919d9037236f0d957664f8920e047b5e3"
     default))
 '(package-selected-packages
   '(## ahungry-theme almost-mono-themes auto-complete
	auto-complete-c-headers auto-complete-clang badger-theme
	badwolf-theme catppuccin-theme cmake-ide company
	company-c-headers dap-mode dashboard doom-themes eziam-themes
	flycheck gruber-darker-theme helm-lsp helm-xref inkpot-theme
	lsp-mode lsp-ui minimal-theme mpv org-bullets projectile
	vs-dark-theme which-key yasnippet)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
