;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-G


;; Appearance

(setq doom-theme 'doom-one)

(setq doom-font (font-spec :family "Maple Mono NF" :size 12))

(set-frame-parameter (selected-frame) 'alpha '(90 . 90))

(add-to-list 'default-frame-alist '(alpha . (90 . 90)))

(setq org-src-fontify-natively t
      org-src-tab-acts-natively t
      org-hide-block-startup nil
      org-src-preserve-indentation nil
      org-edit-src-content-indentation 0)


;; Evil Mode

(after! evil
  (modify-syntax-entry ?- "w" (standard-syntax-table))
  (modify-syntax-entry ?- "w" (syntax-table)))

(after! evil
  (setq evil-symbol-word-search t))

(define-key evil-insert-state-map (kbd "C-c") 'evil-normal-state)

(setq display-line-numbers-type t)

(setq org-directory "~/org/")


;; FZF integration

(use-package fzf
  :commands (fzf fzf-git fzf-grep fzf-git-grep)
  :init
  (setq fzf/args "-x --print-query --margin=1,0 --no-hscroll"
        fzf/executable "fzf"
        fzf/git-grep-args "-i --line-number %s"
        fzf/grep-command "rg --no-heading -nH"
        fzf/position-bottom t
        fzf/window-height 15))


;; Completion

(setq completion-styles '(orderless)
      completion-category-defaults nil
      completion-category-overrides '((file (styles . (orderless)))))

(setq consult-fd-args "fd --color=never --type f --hidden --follow --exclude .git")


;; Custom functions

(defvar my/base-dir (getenv "HOME")
  "Base directory for project-wide grep-like commands.")

(defun my/set-base-dir ()
  "Set the root directory for consult-ripgrep."
  (interactive)
  (let ((dir (read-directory-name "Set base directory: " my/base-dir)))
    (setq my/base-dir dir)
    (message "Search root set to: %s" dir)))

(defun my/consult-ripgrep-base ()
  "Run consult-ripgrep from the custom base dir."
  (interactive)
  (consult-ripgrep my/base-dir))

(defun my/consult-ripgrep-symbol-base ()
  "Search for symbol at point from custom base dir."
  (interactive)
  (let ((sym (thing-at-point 'symbol t)))
    (consult-ripgrep my/base-dir sym)))

(defun my/consult-fd ()
  "Run consult-fd from the custom base dir."
  (interactive)
  (let ((default-directory my/base-dir))
    (consult-fd)))

(defun my/fzf-find-files ()
  "Fuzzy find files in base dir using fzf."
  (interactive)
  (let ((default-directory my/base-dir))
    (fzf)))

(defun my/fzf-base-dir ()
  "FZF using files in `my/base-dir` via fd."
  (interactive)
  (let ((process-environment
         (cons (format "FZF_DEFAULT_COMMAND=fd --type f --hidden --follow --exclude .git . %s" my/base-dir)
               process-environment))
        (default-directory my/base-dir))
    (fzf)))

(defun my/consult-fd-doom ()
  "Run consult-fd in ~/.config/doom"
  (interactive)
  (let ((default-directory "~/.config/doom"))
    (consult-fd)))

(defun my/fzf-doom-config ()
  "Fuzzy find files in ~/.config/doom using fzf."
  (interactive)
  (let ((default-directory "/home/wiktor/.config/doom"))
    (fzf)))

(defun my/fzf-home ()
  "Fuzzy find files in ~/.config/doom using fzf."
  (interactive)
  (let ((default-directory "/home/wiktor/dotfiles"))
    (fzf)))


;; org-mode enhancements

(use-package org-fancy-priorities
  :ensure t
  :hook
  (org-mode . org-fancy-priorities-mode)
  :config
  (setq org-fancy-priorities-list '("⚑" "▲" "»")))

(after! (dired evil-collection)
  (require 'dired-aux)
  (map! :map dired-mode-map
        :n "."   #'dired-create-empty-file
        :n "g ." #'dired-clean-directory))

(defun wiktor/eshell-here ()
  (interactive)
  (let ((default-directory (or (and (buffer-file-name)
        (file-name-directory (buffer-file-name)))
        default-directory)))
        (eshell)))


;; Keybinds

(map! :leader
      (:prefix ("f" . "file/find")
       :desc "ripgrep from base dir"       "g" #'my/consult-ripgrep-base
       :desc "Find file from base dir"     "f" #'my/consult-fd
       :desc "Find buffer"                 "b" #'consult-buffer
       :desc "ripgrep symbol from base"    "s" #'my/consult-ripgrep-symbol-base
       :desc "Find Doom config via fzf"    "i" #'my/fzf-doom-config
       :desc "Find Recent files"           "o" #'consult-recent-file)
      (:prefix ("c" . "custom")
       :desc "Set base directory" "r" #'my/set-base-dir
       :desc "Dired at current file" "d"
       (lambda ()
         (interactive)
         (dired (file-name-directory (or buffer-file-name default-directory)))))
      (:prefix ("b" . "buffers")
       :desc "Buffer menu" "m" #'ibuffer)
      (:prefix ("t" . "terminal")
      :desc "Terminal here (eshell)" "o" #'wiktor/eshell-here)
)

(map! :n "gr" #'+lookup/references)


;; org Superstar

(setq org-agenda-files '("~/repos/agendas/private.org"))

(after! org
  (add-hook 'org-mode-hook #'org-superstar-mode)

  (setq org-superstar-headline-bullets-list
        '("◉" "●" "○" "◆" "●" "○" "◆")))
