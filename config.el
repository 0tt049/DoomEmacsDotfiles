;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(load (expand-file-name "modules/editor.el" doom-user-dir))
(load (expand-file-name "modules/ruby.el" doom-user-dir))
(load (expand-file-name "modules/ruby-autocomplete.el" doom-user-dir))
(load (expand-file-name "modules/term.el" doom-user-dir))
(load (expand-file-name "modules/lsp.el" doom-user-dir))
(load (expand-file-name "modules/autocomplete.el" doom-user-dir))

(setq projectile-project-search-path '("~/code"))

(setq user-full-name "Otavio Coelho"
      user-mail-address "otavio.gmcoelho@gmail.com")

(setq doom-theme 'doom-flatwhite)
(setq doom-font (font-spec :family "Monoid Nerd Font" :size 13 :weight 'regular))
(setq display-line-numbers-type 'relative)

(setq org-directory "~/org/")


(setq standard-indent 2)
(global-visual-line-mode t)
(global-visual-fill-column-mode t)
(setq visual-fill-column-width 80)
(setq-default visual-fill-column-center-text t)
(adaptive-wrap-prefix-mode t)
