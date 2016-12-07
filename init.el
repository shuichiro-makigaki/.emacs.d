(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(set-face-attribute 'default nil
                    :family "Inconsolata"
                    :height 140)

(if (not (eq window-system nil))
    (set-scroll-bar-mode 'right))

;; color-theme
(if (and (> emacs-major-version 23) (not (eq window-system nil)))
    (progn (load-theme 'solarized t)
           (set-frame-parameter nil 'background-mode 'dark)
           (enable-theme 'solarized)))

(show-paren-mode t)
(setq scroll-step 1)
(setq make-backup-files nil)
(setq completion-ignore-case t)
(icomplete-mode t)
(which-function-mode t)
(column-number-mode t)
(setq x-select-enable-clipboard t)
(recentf-mode t)
(global-auto-revert-mode 1)
(setq-default indent-tabs-mode nil) 
(electric-indent-mode 0)
(setq custom-file (locate-user-emacs-file "custom.el"))

;; bs-show
(global-set-key "\C-x\C-b" 'bs-show)

;; ispell
(setq ispell-program-name "aspell")
(setq ispell-dictionary "en")
(add-to-list 'auto-mode-alist '("COMMIT_EDITMSG$" . flyspell-mode))

;; cedet
(require 'cedet)
(global-ede-mode t)
(semantic-mode t)
(semantic-gcc-setup)
(setq stack-trace-on-error t)

;; auto-complete
(require 'auto-complete-config)
(ac-config-default)
(ac-flyspell-workaround)
(setq ac-use-menu-map t)

;; mozc
(require 'mozc)
(setq default-input-method "japanese-mozc")
(require 'mozc-popup)
(setq mozc-candidate-style 'popup)

;; markdown-mode
(require 'markdown-mode)
(add-to-list 'auto-mode-alist '("\\.md$" . gfm-mode))

;; yaml-mode
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

;; show diff by git-gutter
(require 'git-gutter)
(global-git-gutter-mode +1)

;; flycheck
(require 'flycheck)
(setq flycheck-gcc-include-path
      (list "/usr/local/include"
            "$HOME/include"))

;; cscope
(require 'xcscope)
(cscope-setup)
(setq cscope-do-not-update-database t)
(add-hook 'c-mode-hook (function cscope-minor-mode))
(add-hook 'c++-mode-hook (function cscope-minor-mode))
(add-hook 'python-mode-hook (function cscope-minor-mode))

;; highlight-symbol
(require 'highlight-symbol)
(add-hook 'c-mode-hook 'highlight-symbol-mode)
(add-hook 'c++-mode-hook 'highlight-symbol-mode)
(add-hook 'python-mode-hook 'highlight-symbol-mode)
(add-hook 'ruby-mode-hook 'highlight-symbol-mode)

;; smart-parens
(require 'smartparens)

;; jinja2 mode
(require 'jinja2-mode)
(add-to-list 'auto-mode-alist '("\\.j2" . jinja2-mode))

;; PDB mode
(require 'pdb-mode)
(add-to-list 'auto-mode-alist '("\\.pdb$" . pdb-mode))
(add-to-list 'auto-mode-alist '("\\.ent$" . pdb-mode))

;; Ansible mode
(require 'ansible)
(add-hook 'yaml-mode-hook 'ansible)

;; Ansible doc
(require 'ansible-doc)
(add-hook 'ansible-hook 'ansible-doc-mode)
