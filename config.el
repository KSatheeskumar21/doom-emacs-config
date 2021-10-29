(setq user-full-name "Kishore S"
      user-mail-address "k.sath214@gmail.com")

(setq doom-theme 'doom-monokai-pro)

(setq doom-font (font-spec :family "JetBrains Mono" :size 14)
      doom-big-font (font-spec :family "JetBrains Mono" :size 20))

(setq org-directory "~/Projects/Org")

(setq evil-split-window-below t
      evil-vsplit-window-right t)

;;(setq fancy-splash-image (concat doom-private-dir ""))
(remove-hook '+doom-dashboard-functions #'doom-dashboard-widget-shortmenu)
