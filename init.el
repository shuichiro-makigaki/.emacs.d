(set-face-attribute 'default nil
                    :family "Ricty"
                    :height 140)

(setq-default indent-tabs-mode nil)
(show-paren-mode t)
(set-scroll-bar-mode 'right)
(setq scroll-step 1)
(setq make-backup-files nil)
(setq completion-ignore-case t)
(icomplete-mode t)
(iswitchb-mode t)
(which-function-mode t)
(column-number-mode t)
(setq x-select-enable-clipboard t)
(recentf-mode t)
(tool-bar-mode 0)
(global-set-key "\C-m" 'newline-and-indent)
(global-set-key "\C-x\C-b" 'bs-show)

(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/auto-complete")
(add-to-list 'load-path "~/.emacs.d/anthy")
(add-to-list 'load-path "~/.emacs.d/apel")
(add-to-list 'load-path "~/.emacs.d/color-theme")
(add-to-list 'load-path "~/.emacs.d/perltidy-mode")

(load "brackets")
(load "leim-list")

(require 'auto-install)
(require 'eldoc)
(require 'eldoc-extension)
(require 'c-eldoc)
(require 'auto-complete-config)
(require 'color-theme)
(require 'perltidy-mode)
(require 'perl-completion)



;; ispell
(setq ispell-program-name "aspell")
(setq ispell-dictionary "en")



;; color-theme
(if (window-system)
    (progn
      (color-theme-initialize)
      (color-theme-dark-laptop)
      (woman-default-faces)
      (custom-set-faces
       '(woman-addition
         ((t (:inherit font-lock-builtin-face :foreground "deep sky blue"))))
       '(woman-bold ((t (:inherit bold :foreground "dodger blue"))))
       '(woman-italic ((t (:inherit italic :underline t :weight bold)))))))



;; dired
(put 'dired-find-alternate-file 'disabled nil)
(define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)
(define-key dired-mode-map "a" 'dired-advertised-find-file)



;; auto-complete
(add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete/dict")
(ac-config-default)
(setq ac-ignore-case t)
(setq ac-menu-height 20)



;; anthy
(setq default-input-method "japanese-anthy")
(setq anthy-wide-space " ")



;;; cperl-mode is preferred to perl-mode
;;; "Brevity is the soul of wit" <foo at acm.org>                               
(defalias 'perl-mode 'cperl-mode)
(setq cperl-indent-level 4
      cperl-continued-statement-offset 4
      cperl-highlight-variables-indiscriminately t)
;; perltidy-mode
(setq perltidy-bin "perltidy -pbp -q")
;; perl-completion-mode
(add-hook 'cperl-mode-hook
          (lambda ()
            (perl-completion-mode t)
            (setq ac-sources
                  '(ac-source-perl-completion))))
;; flymake for perl
(add-hook 'cperl-mode-hook (lambda () (flymake-mode t)))
;; Makes perltidy-mode automatic for cperl-mode
(add-hook 'cperl-mode-hook (lambda () (perltidy-mode t)))
;; flyspell for cperl-mode
(add-hook 'cperl-mode-hook 'flyspell-prog-mode)



;; for C
(setq c-basic-offset 8)
;; flyspell for C and C++ mode
(add-hook 'c-mode-hook 'flyspell-prog-mode)
(add-hook 'c++-mode-hook 'flyspell-prog-mode)
;; c-eldoc
(add-hook 'c-mode-hook 'c-turn-on-eldoc-mode)
(add-hook 'c++-mode-hook 'c-turn-on-eldoc-mode)
;; hideshow and hideif
(add-hook 'c-mode-hook 'hs-minor-mode)
(add-hook 'c++-mode-hook 'hs-minor-mode)
(add-hook 'c-mode-hook 'hide-ifdef-mode)
(add-hook 'c++-mode-hook 'hide-ifdef-mode)
;; cedet
(setq semantic-load-turn-useful-things-on t)
(setq semantic-load-turn-everything-on t)
(setq semantic-default-submodes
      '(global-semanticdb-minor-mode
        global-semantic-idle-scheduler-mode
        global-semantic-idle-summary-mode
        global-semantic-decoration-mode
        global-semantic-highlight-func-mode))
(setq semantic-idle-work-update-headers-flag t)
(require 'cedet)
(global-ede-mode 1)
(semantic-mode 1)
(setq semanticdb-project-roots '("~/"))
(semantic-gcc-setup)
(setq ac-sources (append ac-sources '(ac-source-semantic)))
(setq ac-sources (append ac-sources '(ac-source-semantic-raw)))



;; flyspell for git commit
(add-to-list 'auto-mode-alist '("COMMIT_EDITMSG$" . flyspell-mode))



(load "myconf.el")
