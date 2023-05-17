(setq inhibit-startup-message t)

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tooltip-mode 1)

;; set transparency
;; (set-frame-parameter (selected-frame) 'alpha '(85 85))
;; (add-to-list 'default-frame-alist '(alpha 85 85))

;; ;;;; fonts and stuff

(defvar runemacs/default-font-size 150)

;;(set-face-attribute 'default nil :font "monospace" :height runemacs/default-font-size)

;; Set the fixed pitch face
(set-face-attribute 'default nil :font "Hack Nerd Font" :height 150)
;;(set-face-attribute 'fixed-pitch nil :font "Hack Nerd Font" :height 150)

;; Set the variable pitch face
(set-face-attribute 'variable-pitch nil :font "Cantarell" :height 120 :weight 'regular)

(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
 (package-refresh-contents))


;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
   (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)	
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

(use-package swiper :ensure t)

(use-package php-mode :ensure t)

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
;;  :custom ((doom-modeline-height 25))
  )

(use-package all-the-icons
  :ensure t)

;; (use-package intellij-theme)
  ;;(use-package kaolin-themes)
  ;;(use-package zenburn-theme)
;;  (use-package spacemacs-theme)
;; (use-package ewal-spacemacs-themes)
(use-package ubuntu-theme)

(use-package doom-themes
          :ensure t
          :config
          ;; Global settings (defaults)
          (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
                doom-themes-enable-italic t) ; if nil, italics is universally disabled
      ;;    (load-theme ' spacemacs-dark t)
         ;; (load-theme ' kaolin-dark t)
        (load-theme 'doom-Iosvkem t)
;;        (load-theme 'ubuntu t)
  ;;        (load-theme 'doom-solarized-dark t)


          ;; Enable flashing mode-line on errors
          (doom-themes-visual-bell-config)
          ;; Enable custom neotree theme (all-the-icons must be installed!)
          (doom-themes-neotree-config)
          ;; or for treemacs users
          (setq doom-themes-treemacs-theme "doom-atom") ; use "doom-colors" for less minimal icon theme
          (doom-themes-treemacs-config)
          ;; Corrects (and improves) org-mode's native fontification.
          (doom-themes-org-config)
          )

;;(use-package rainbow-delimiters
;;  :hook (prog-mode , rainbow-delimiters-mode ))

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.3))

(use-package ivy-rich
 :init (ivy-rich-mode 1))

(use-package counsel
  :bind (("M-x" . counsel-M-x)
;;       	 ("C-x b" . counsel-ibuffer)
       	 ("C-x b" . counsel-switch-buffer)
       	 ("C-x v" . counsel-describe-variable)
       	 ("C-x f" . counsel-describe-function)
	 ("C-x C-f" . counsel-find-file)
	 :map minibuffer-local-map
	  ("C-r" . 'counsel-minibuffer-history)))

;;  (use-package pdf-tools
;;    :ensure t
;;    :defer t
;;    :commands (pdf-view-mode pdf-tools-install)
;;    :mode ("\\.[pP][dD][fF]\\" . pdf-view-mode)
;;    :config (pdf-tools-install)
;;    (define-pdf-cache-function pagelabels)
;;    :hook ((pdf-view-mode-hook . (lambda () (display-line-numbers-mode -q)))
;;           (pdf-view-mode-hook . pdf-tools-enable-minor-modes)))

(use-package howdoyou
  :ensure t)

(use-package evil
  :ensure t
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil) ;; initiall nil
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil) ;; initially nil
;;  (setq evil-respect-visual-line-mode t)
  :config
  (evil-set-undo-system 'undo-tree) 
  (evil-mode 1)  
  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))
;; yay goddamit , it is vim now . finally , i am back home .
;; das ist sehr gut damn vim ist uber alles editors 
;; now for evil collection

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

;; undo tree to make C-r in evil mode redo
(use-package undo-tree
  :ensure t
  :config
  (global-undo-tree-mode 1))

;; auto complete and stuff
(use-package auto-complete
  :ensure t
;;  :config
;;  (require 'auto-complete-config)
;;;   (ac-config-default)
  )

(use-package company
  :after lsp-mode
  :hook (lsp-mode . company-mode)
  :bind (:map company-active-map
         ("<tab>" . company-complete-selection))
        (:map lsp-mode-map
         ("<tab>" . company-indent-or-complete-common))
	:custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.1))

(use-package company-box
  :hook (company-mode . company-box-mode))

(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1)
  (add-hook 'prog-mode-hook 'yas-minor-mode)
  )

(use-package vterm
 :ensure t)

(use-package beacon)

;;  (beacon-mode 1)

(use-package neotree
  :ensure t)

(use-package helpful
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package markdown-mode 
  :ensure t)

(use-package simple-httpd
  :ensure t)

;; Configure Elfeed
(use-package elfeed
  :ensure t
  :config
  (setq elfeed-db-directory (expand-file-name "elfeed" user-emacs-directory)
        elfeed-show-entry-switch 'display-buffer)

  (setq elfeed-search-filter "@6-months-ago +unread -lowy")
  )

(setq elfeed-feeds (quote(
("https://archlinux.org/feeds/news/" linux arch news official)
)))
;; you can put your subs here like this

(defun my/get-youtube-channel-rss-feed (link-to-channel-homepage)
  "this takes the link to channel home page and spits out the rss feed"
  (setq my-youtube-command (concat "curl -s " link-to-channel-homepage " | grep -oP '(?<=title\=\"RSS\" href\=\").*?(?=\")' "))
  (setq my-shell-output
        (substring 
         (shell-command-to-string my-youtube-command )
         0 -1))
  my-shell-output
  )

;; (dolist (mode '(elfeed-show-mode-hook
;;                 elfeed-search-mode-hook))
;;   (add-hook mode (lambda () (turn-off-evil-mode))))

(defun my/elfeed-open-link-in-mpv()
  "open link in elfeed using mpv"
  (interactive)
  (let ((link (elfeed-entry-link elfeed-show-entry)))
    (when link
      (message "Sent to mpv: %s" link)
      (async-shell-command (concat "mpv \"" link "\"")))))

(add-to-list 'evil-motion-state-modes 'elfeed-search-mode)
(add-to-list 'evil-motion-state-modes 'elfeed-show-mode)

(evil-define-key* 'motion elfeed-search-mode-map
  "gb" #'elfeed-search-browse-url
  "gr" #'elfeed-search-update--force
  "gR" #'elfeed-search-fetch)

(evil-define-key* 'motion elfeed-show-mode-map
  "gb" #'elfeed-show-visit
  "gy" #'my/elfeed-open-link-in-mpv
  "gj" #'elfeed-show-next
  "gk" #'elfeed-show-prev)

(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode)
  :custom ((projectile-completion-system 'ivy))
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  ;; ;; NOTE: Set this to the folder where you keep your Git repos!
  ;; (when (file-directory-p "~/Projects/Code")
  ;;   (setq projectile-project-search-path '("~/Projects/Code")))
  ;; (setq projectile-switch-project-action #'projectile-dired)
)

(use-package counsel-projectile
  :config (counsel-projectile-mode))

(use-package web-mode
  :ensure t)

(use-package typescript-mode
  :mode "\\.ts\\'"
  :hook (typescript-mode . lsp-deferred)
  :config
  (setq typescript-indent-level 2))

(use-package flycheck
  :ensure t)

(use-package magit
  :ensure t)

(use-package gnuplot-mode)
(use-package gnuplot)

(use-package rainbow-mode
  :ensure t
  :init (rainbow-mode 1))

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))

(setq dashboard-center-content t)

(setq dashboard-set-heading-icons t)
(setq dashboard-set-file-icons t)

(add-hook 'dashboard-mode-hook (lambda ()
                                 (local-set-key (kbd "C-c C-r ") 'dashboard-refresh-buffer)))

(setq initial-buffer-choice (lambda () (get-buffer-create "*dashboard*")))

(use-package all-the-icons-dired
  :ensure t
  :hook (dired-mode . all-the-icons-dired-mode)
  )

(use-package auctex
  :ensure t
  :defer t
  :hook (LaTeX-mode .
                    (lambda ()
                      (push (list 'output-pdf "Zathura")
                            TeX-view-program-selection))))

(defun lsp-mode-setup ()
  (setq lsp-headerline-breadcrumb-segments '(path-up-to-project file symbols))
  (lsp-headerline-breadcrumb-mode))

(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :hook (lsp-mode . lsp-mode-setup)
  :init
  (setq lsp-keymap-prefix "C-c l")  ;; Or 'C-l', 's-l'
  :config
  (lsp-enable-which-key-integration t))

(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode)
  :custom
  (lsp-ui-doc-position 'bottom))

(use-package lsp-treemacs
  :ensure t
  :after lsp)

(use-package lsp-ivy
  :ensure t)

(defun efs/org-mode-setup ()
  (org-indent-mode)
  (variable-pitch-mode 1)
  (visual-line-mode 1))



(defun efs/org-font-setup ()
  ;; Replace list hyphen with dot
  (font-lock-add-keywords 'org-mode
                          '(("^ *\\([-]\\) "
                             (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

  ;; Set faces for heading levels
  (dolist (face '((org-level-1 . 1.2)
                  (org-level-2 . 1.1)
                  (org-level-3 . 1.05)
                  (org-level-4 . 1.0)
                  (org-level-5 . 1.1)
                  (org-level-6 . 1.1)
                  (org-level-7 . 1.1)
                  (org-level-8 . 1.1)))
    (set-face-attribute (car face) nil :font "Hack" :weight 'regular :height (cdr face)))



  ;; Ensure that anything that should be fixed-pitch in Org files appears that way
  (set-face-attribute 'org-block nil :foreground nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-code nil   :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-table nil   :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-checkbox nil :inherit 'fixed-pitch))

(use-package org
  :hook (org-mode . efs/org-mode-setup)
  :config
  (setq org-ellipsis " ▾")
  (efs/org-font-setup))


(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode)
  ;; :custom
  ;;  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●"))
  )

(defun efs/org-mode-visual-fill ()
  (setq visual-fill-column-width 100
        visual-fill-column-center-text t)
  (visual-fill-column-mode 1))

(use-package visual-fill-column
  :hook (org-mode . efs/org-mode-visual-fill))

;;  (use-package org-pdftools
 ;;   :hook (org-load-hook . org-pdftools-setup-link))

(use-package ox-reveal
  :ensure t)

(defun my/set_latex_math_size (size)
  "set the required size of your math equations"
    (interactive "sSize:")
    (setq org-format-latex-options (plist-put org-format-latex-options :scale (string-to-number size)))
    (message (concat "size is set to: " size)))

(use-package flycheck-rust
  :ensure t)

;; (defun rk/rustic-mode-hook ()
;;   ;; so that run C-c C-c C-r works without having to confirm, but don't try to
;;   ;; save rust buffers that are not file visiting. Once
;;   ;; https://github.com/brotzeit/rustic/issues/253 has been resolved this should
;;   ;; no longer be necessary.
;;   (when buffer-file-name
;;     (setq-local buffer-save-without-query t)))

(use-package rustic
  :ensure
  :bind (:map rustic-mode-map
              ("M-j" . lsp-ui-imenu)
              ("M-?" . lsp-find-references)
              ("C-c C-c l" . flycheck-list-errors)
              ("C-c C-c a" . lsp-execute-code-action)
              ("C-c C-c r" . lsp-rename)
              ("C-c C-c q" . lsp-workspace-restart)
              ("C-c C-c Q" . lsp-workspace-shutdown)
              ("C-c C-c s" . lsp-rust-analyzer-status))
  :config
  ;; uncomment for less flashiness
  ;; (setq lsp-eldoc-hook nil)
  ;; (setq lsp-enable-symbol-highlighting nil)
  ;; (setq lsp-signature-auto-activate nil)
  ;; comment to disable rustfmt on save
  (setq rustic-format-on-save t)
  ;;(add-hook 'rustic-mode-hook 'lsp)
  ;;(add-hook 'rustic-mode-hook 'electric-part-local-mode)
  )

(defun my/ide()
  "Get a modern IDE layout"
  (interactive)
  (evil-window-split)
  (evil-window-down 1)
  (evil-window-decrease-height 10)
  (vterm)
  (neotree)
  (evil-window-right 1)
  (lsp)
  )

(global-set-key (kbd "C-h j") 'howdoyou-query)

(defun my/run-the-c-code()
  "run the c code via gcc"
  (interactive)
  (eshell-command (concat "gcc " (buffer-file-name) " && ./a.out"))
  )
(defun my/make()
  "run the c code via gcc"
  (interactive)
  (eshell-command "make")
  )


(add-hook 'c-mode-common-hook (lambda()
                                (local-set-key (kbd "C-c C-r C-c") 'my/run-the-c-code)
                                (local-set-key (kbd "C-c C-r C-m") 'my/make)
                                ))
;;(add-hook 'c-mode-common-hook (local-set-key (kbd "C-c C-r") (eshell-command (concat "gcc " (buffer-file-name) " && ./a.out") )))

(defun my/run-the-bash-code()
  "run the bash code, NOTE: it gives executable permissions to the file (oviously)"
  (interactive)
  (eshell-command (concat "chmod +x " (buffer-file-name) " && bash " (buffer-file-name)))
  )
(add-hook 'sh-mode-hook (lambda() (local-set-key (kbd "C-c C-r")
                                                 'my/run-the-bash-code
                                                 )))

(add-hook 'prog-mode-hook (lambda () (electric-pair-local-mode 1)))

(add-hook 'emacs-lisp-mode-hook (lambda ()
                                  (company-mode 1)))

(defun my/goto-thing ()
  "put cursor to the string <+_+> and replace it"
  (interactive)
  (if (search-forward "<+_+>") (delete-backward-char 5) (message "pattern <+_+> not found"))
  )

(global-set-key (kbd "C-c C-SPC") 'my/goto-thing)

(defun my/copy-all-and-kill()
    (interactive)
    (kill-region 1 (buffer-size))
    (kill-buffer-and-window)
  )

(defun my/open-latex-buffer ()
  (interactive)
  (split-window)
  (switch-to-buffer "*org-latex-thingy*")
  (latex-mode)
  (local-set-key (kbd "C-C C-;") 'my/copy-all-and-kill ))

(add-hook 'org-mode-hook (lambda()
                           (local-set-key (kbd "C-c C-.") 'my/open-latex-buffer)))

(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (C . t)
   (emacs-lisp . t)
   (python . t)
   )
 )
;; custom keybindings

;; (switch-to-buffer "orgscratch")
;; (org-mode)
;; (text-scale-adjust 2)
;; (display-line-numbers-mode 0)
;; (insert "* Notes")
;; (switch-to-buffer "*scratch*")
