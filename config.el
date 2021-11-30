(setq user-full-name "Kishore S"
      user-mail-address "k.sath214@gmail.com")

;;(setq doom-theme 'doom-monokai-pro)
(setq doom-theme 'doom-one)

(setq doom-font (font-spec :family "Source Code Pro" :size 14)
      doom-big-font (font-spec :family "Source Code Pro" :size 20))
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

(setq org-support-shift-select 'always)

(setq org-directory "~/Projects/Org")

(setq evil-split-window-below t
      evil-vsplit-window-right t)

(setq fancy-splash-image (concat doom-private-dir "link.jpg"))
(remove-hook '+doom-dashboard-functions #'doom-dashboard-widget-shortmenu)

(setq doom-fallback-buffer "*dashboard*")

(setq dashboard-startup-banner 'logo)
(setq dashboard-center-content t)
(setq dashboard-items '((recents . 5)
                        (agenda . 5)
                        (bookmarks . 3)
                        (projects . 3)))

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

(setq centaur-tabs-set-bar 'over
      centaur-tabs-set-icons t
      centaur-tabs-gray-out-icons 'buffer
      centaur-tabs-height 24
      centaur-tabs-set-modified-marker t
      centaur-tabs-style "bar"
      centaur-tabs-modified-marker "•")
(map! :leader
      :desc "Toggle tabs globally" "t c" #'centaur-tabs-mode
      :desc "Toggle tabs local display" "t C" #'centaur-tabs-local-mode)
(evil-define-key 'normal centaur-tabs-mode-map (kbd "g <right>") 'centaur-tabs-forward        ; default Doom binding is 'g t'
                                               (kbd "g <left>")  'centaur-tabs-backward       ; default Doom binding is 'g T'
                                               (kbd "g <down>")  'centaur-tabs-forward-group
                                               (kbd "g <up>")    'centaur-tabs-backward-group)

;;(setq ivy-posframe-display-functions-alist
;;      '((swiper                     . ivy-posframe-display-at-point)
;;        (complete-symbol            . ivy-posframe-display-at-point)
;;        (counsel-M-x                . ivy-display-function-fallback)
;;        (counsel-esh-history        . ivy-posframe-display-at-window-center)
;;        (counsel-describe-function  . ivy-display-function-fallback)
;;        (counsel-describe-variable  . ivy-display-function-fallback)
;;        (counsel-find-file          . ivy-display-function-fallback)
;;        (counsel-recentf            . ivy-display-function-fallback)
;;        (counsel-register           . ivy-posframe-display-at-frame-bottom-window-center)
;;        (nil                        . ivy-posframe-display))
;;      ivy-posframe-height-alist
;;      '((swiper . 20)
;;        (t . 10)))
;;(ivy-posframe-mode 1) ; 1 enables posframe-mode, 0 disables it.

(global-set-key (kbd "M-x") 'helm-M-x)
(helm-mode 1)

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
