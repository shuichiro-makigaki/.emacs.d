(set-face-attribute 'default nil
                    :family "Inconsolata"
                    :height 110)
;; (set-fontset-font "fontset-default"
;;                   'japanese-jisx0208
;;                   '("IPAexゴシック" . "jisx0208.*"))
;; (set-fontset-font "fontset-default"
;;                   'katakana-jisx0201
;;                   '("IPAexゴシック" . "jisx0201.*"))
(set-fontset-font "fontset-default"
                  'japanese-jisx0208
                  '("モトヤLシータ゛3等幅" . "jisx0208.*"))
(set-fontset-font "fontset-default"
                  'katakana-jisx0201
                  '("モトヤLシータ゛3等幅" . "jisx0201.*"))
;; (set-fontset-font "fontset-default"
;;                   'japanese-jisx0208
;;                   '("モトヤLマルベリ3等幅" . "jisx0208.*"))
;; (set-fontset-font "fontset-default"
;;                   'katakana-jisx0201
;;                   '("モトヤLマルベリ3等幅" . "jisx0201.*"))

(setq-default indent-tabs-mode nil)
(show-paren-mode t)
(set-scroll-bar-mode 'right)
(setq scroll-step 1)
(setq make-backup-files nil)
(setq completion-ignore-case t)
(icomplete-mode t)
(iswitchb-mode t)
(which-function-mode t)
(global-hl-line-mode t)
(column-number-mode t)
(setq x-select-enable-clipboard t)
(recentf-mode t)
(tool-bar-mode nil)
(global-set-key "\C-m" 'newline-and-indent)

(set-frame-parameter nil 'fullscreen 'maximized)

(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/twittering-mode")
(add-to-list 'load-path "~/.emacs.d/elscreen")
(add-to-list 'load-path "~/.emacs.d/auto-complete")
(add-to-list 'load-path "~/.emacs.d/riece/lisp")
(add-to-list 'load-path "~/.emacs.d/anthy")
(add-to-list 'load-path "~/.emacs.d/apel")

(require 'flymake)
(require 'auto-install)
(require 'twittering-mode)
(require 'riece)
(require 'eldoc)
(require 'eldoc-extension)
(require 'c-eldoc)
(require 'auto-complete-config)
(require 'elscreen)
(require 'elscreen-gf)
(require 'elscreen-dnd)
(require 'elscreen-dired)
(require 'elscreen-speedbar)

(load "brackets.elc")
(load "leim-list.el")

;; auto-complete
(add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete/dict")
(ac-config-default)

;; anthy
(setq default-input-method "japanese-anthy")
(setq anthy-wide-space " ")

;;; cperl-mode is preferred to perl-mode
;;; "Brevity is the soul of wit" <foo at acm.org>                               
(defalias 'perl-mode 'cperl-mode)
(setq cperl-indent-level 4
      cperl-continued-statement-offset 4
      cperl-highlight-variables-indiscriminately t)

;;; perl-tidy
(defun perltidy-region ()
  "Run perltidy on the current region."
  (interactive)
  (save-excursion
    (shell-command-on-region (point) (mark) "perltidy -q" nil t)))
(defun perltidy-defun ()
  "Run perltidy on the current defun."
  (interactive)
  (save-excursion (mark-defun) (perltidy-region)))

;;; brackets for perl
(add-hook 'cperl-mode-hook
          '(lambda()
             (progn
               (define-key cperl-mode-map "{" 'insert-braces)
               (define-key cperl-mode-map "(" 'insert-parens)
               (define-key cperl-mode-map "\"" 'insert-double-quotation)
               (define-key cperl-mode-map "'" 'insert-single-quotation)
               (define-key cperl-mode-map "[" 'insert-brackets)
               (define-key cperl-mode-map "\C-c}" 'insert-braces-region)
               (define-key cperl-mode-map "\C-c)" 'insert-parens-region)
               (define-key cperl-mode-map "\C-c]" 'insert-brackets-region)
               (define-key cperl-mode-map "\C-c\""
                 'insert-double-quotation-region))))

;;; flymake for perl
(defun flymake-perl-load () (flymake-mode t))
(add-hook 'cperl-mode-hook 'flymake-perl-load)

;; twittering-mode
(setq twittering-icon-mode t)
(setq twittering-use-master-password t)
(setq twittering-retweet-format " RT @%s: %t")
(setq twittering-status-format
      "%i %S (%s), %@ from %f%L%r%R\n%FILL[  ]{%T}\n")
(setq twittering-number-of-tweets-on-retrieval 190)

;; elscreen
(elscreen-set-prefix-key "\C-t")

;; c-eldoc
(add-hook 'c-mode-hook 'c-turn-on-eldoc-mode)
(add-hook 'c++-mode-hook 'c-turn-on-eldoc-mode)

(load "myconf.el")
