(setq user-full-name "Kishore S"
      user-mail-address "k.sath214@gmail.com")

(use-package doom-themes
  :ensure nil
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  (setq doom-theme 'doom-tokyo-night)
  (doom-themes-visual-bell-config)
  (doom-themes-neotree-config)
  (setq doom-themes-treemacs-theme "doom-atom")
  (doom-themes-treemacs-config)
  (doom-themes-org-config))

(setq doom-font (font-spec :family "Source Code Pro" :size 14)
      doom-big-font (font-spec :family "Mononoki Nerd Font" :size 20))
(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))
(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword-face :slant italic))

(set-face-attribute 'mode-line nil :font "Source Code Pro-13")
(setq doom-modeline-height 30
      doom-modeline-bar-width 5
      doom-modeline-persp-name t
      doom-modeline-persp-icon t)

(setq evil-split-window-below t
      evil-vsplit-window-right t)

(setq doom-fallback-buffer "*dashboard*")
(setq initial-buffer-choice (lambda () (get-buffer "*dashboard*")))

(use-package dashboard
  :init
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  ;;(setq dashboard-banner-logo-title "I have spent way too much time procrastinating")
  ;;(setq dashboard-startup-banner 'logo)
  (setq dashboard-startup-banner "~/.doom.d/emacs-dash.png")
  (setq dashboard-center-content t)
  (setq dashboard-recent-items '((recents . 3)
                                 (bookmarks . 3)
                                 (agenda . 3)
                                 (projects . 3)))
  :config
  (dashboard-setup-startup-hook)
  (dashboard-modify-heading-icons '((recents . "file-text")
                                    (bookmarks . "book"))))

(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)

(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(setq org-src-fontify-natively t
      org-src-tab-acts-natively t
      org-confirm-babel-evaluate nil
      org-edit-src-content-indentation 0)

(map! :leader
      (:prefix ("O" . "Org")
       :desc "Org Tangle" "t" #'org-babel-tangle
       :desc "Org Detangle" "d" #'org-babel-detangle
       :desc "Org Results" "r" #'org-babel-open-src-block-result))

(after! org
       (setq org-support-shift-select 'always)
       (setq org-directory "~/Projects/Org"
             org-agenda-files '("~/Projects/Org/agenda.org")
             org-default-notes-file (expand-file-name "notes.org" org-directory)
             org-todo-keywords
             '((sequence
                "TODO (t)"
                "PROJ (p)"
                "SCHL (s)"
                "WAIT (w)"
                "|"
                "DONE (d)"
                "CANCELLED (c)"))))

(after! org-roam
  (setq org-roam-directory "~/Projects/Org/Roam"))

;;(setq centaur-tabs-set-bar 'over
;;      centaur-tabs-set-icons t
;;      centaur-tabs-gray-out-icons 'buffer
;;      centaur-tabs-height 12
;;      centaur-tabs-set-modified-marker t
;;     centaur-tabs-style "bar"
;;      centaur-tabs-modified-marker "•")
;;(map! :leader
;;      :desc "Toggle tabs globally" "t c" #'centaur-tabs-mode
;;      :desc "Toggle tabs local display" "t C" #'centaur-tabs-local-mode)
;;(evil-define-key 'normal centaur-tabs-mode-map (kbd "g <right>") 'centaur-tabs-forward        ; default Doom binding is 'g t'
;;                                               (kbd "g <left>")  'centaur-tabs-backward       ; default Doom binding is 'g T'
;;                                               (kbd "g <down>")  'centaur-tabs-forward-group
;;                                               (kbd "g <up>")    'centaur-tabs-backward-group)

(setq ivy-posframe-display-functions-alist
      '((swiper                     . ivy-posframe-display-at-point)
        (complete-symbol            . ivy-posframe-display-at-point)
        (counsel-M-x                . ivy-display-function-fallback)
        (counsel-esh-history        . ivy-posframe-display-at-window-center)
        (counsel-describe-function  . ivy-display-function-fallback)
        (counsel-describe-variable  . ivy-display-function-fallback)
        (counsel-find-file          . ivy-display-function-fallback)
        (counsel-recentf            . ivy-display-function-fallback)
        (counsel-register           . ivy-posframe-display-at-frame-bottom-window-center)
        (nil                        . ivy-posframe-display))
      ivy-posframe-height-alist
      '((swiper . 20)
        (t . 10)))
(ivy-posframe-mode 1) ; 1 enables posframe-mode, 0 disables it.

;;(global-set-key (kbd "M-x") 'helm-M-x)
;;(helm-mode 1)

(require 'rust-mode)
(add-hook 'rust-mode-hook #'lsp
          (lambda () (setq indent-tabs-mode nil)))
(setq rust-format-on-save t)

(map! :leader
      (:prefix ("r" . "Rust")
       :desc "Rust Run" "r" #'rust-run))

(require 'haskell-mode-autoloads)

(map! :leader
      (:prefix ("H" . "Haskell")
       :prefix ("i" . "imports")
       :desc "Navigate to imports" "n" #'haskell-navigate-imports
       :desc "Sort imports" "s" #'haskell-sort-imports
       :desc "Align imports" "a" #'haskell-align-imports))

(define-globalized-minor-mode global-rainbow-mode rainbow-mode
  (lambda () (rainbow-mode 1)))
(global-rainbow-mode 1)

(add-hook 'org-mode-hook (lambda ()
  "Beautify Org Checkbox Symbol"
  (push '("[ ]" . "☐") pretiffy-symbols-alist)
  (push '("[X]" . "☑") pretiffy-symbols-alist)
  (push '("[-]" . "❍") pretiffy-symbols-alist)
  ("TODO" . "")
  ("WAIT" . "")
  ("#+BEGIN_SRC" . "")
  ("#+END_SRC" . "―")
  ("SCHEDULED:" . "")
  (pretiffy-symbols-mode)))

(defun org-icons ()
  "Beautify Org Checkbox Symbol"
  (setq prettify-symbols-alist '("[ ]" . "☐")
                                ("[X]" . "☑")
                                ("[-]" . "❍")
                                ("TODO" . "")
                                ("WAIT" . "")
                                ("#+BEGIN_SRC" . "")
                                ("#+END_SRC" . "―")
                                ("SCHEDULED:" . "")
                                (pretiffy-symbols-mode)))
