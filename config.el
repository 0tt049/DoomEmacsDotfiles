;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(load (expand-file-name "modules/editor.el" doom-user-dir))
(load (expand-file-name "modules/ruby.el" doom-user-dir))
(load (expand-file-name "modules/ruby-autocomplete.el" doom-user-dir))
(load (expand-file-name "modules/term.el" doom-user-dir))
(load (expand-file-name "modules/lsp.el" doom-user-dir))
(load (expand-file-name "modules/autocomplete.el" doom-user-dir))
(load (expand-file-name "modules/euler.el" doom-user-dir))

(setq projectile-project-search-path '("~/code"))

(setq user-full-name "Otavio Coelho"
      user-mail-address "otavio.gmcoelho@gmail.com")

(setq doom-theme 'doom-flatwhite)
(setq doom-font (font-spec :family "Monoid Nerd Font" :size 13 :weight 'regular))
(setq display-line-numbers-type 'relative)

(setq org-directory "~/org/")

;; (defun set-bigger-spacing ()
;;   (setq-local default-text-properties '(line-spacing 0.2 line-height 1.2)))
;; (add-hook 'text-mode-hook 'set-bigger-spacing)
;; (add-hook 'prog-mode-hook 'set-bigger-spacing)

(add-to-list 'load-path "/usr/bin/asy")
(autoload 'asy-mode "asy-mode.el" "Asymptote major mode." t)
(autoload 'lasy-mode "asy-mode.el" "hybrid Asymptote/Latex major mode." t)
(autoload 'asy-insinuate-latex "asy-mode.el" "Asymptote insinuate LaTeX." t)
(add-to-list 'auto-mode-alist '("\\.asy$" . asy-mode))
(org-babel-do-load-languages
 'org-babel-load-languages
 '((asymptote . t)))
(setq org-babel-asy-command "/usr/bin/asy ")

(autoload 'po-mode "po-mode.el"
  "Major mode for translators to edit PO files" t)
(setq auto-mode-alist (cons '("\\.po$" . po-mode)
                            auto-mode-alist))

(setq lsp-rust-analyzer-binding-mode-hints t)
(setq lsp-rust-analyzer-display-parameter-hints t)
(setq lsp-rust-analyzer-cargo-watch-command "clippy")
(setq lsp-eldoc-render-all t)
(setq lsp-idle-delay 0.6)
(setq lsp-rust-analyzer-server-display-inlay-hints t)
(setq lsp-rust-analyzer-display-lifetime-elision-hints-enable "skip_trivial")
(setq lsp-rust-analyzer-display-chaining-hints t)
(setq lsp-rust-analyzer-display-lifetime-elision-hints-use-parameter-names nil)
(setq lsp-rust-analyzer-display-closure-return-type-hints t)
(setq lsp-rust-analyzer-display-parameter-hints nil)
(setq lsp-rust-analyzer-display-reborrow-hints nil)
(setq lsp-ui-peek-always-show t)
(setq lsp-ui-sideline-show-hover t)
(setq lsp-ui-doc-enable nil)

(map! :map rustic-mode-map
      :localleader
      (:prefix ("b" . "build")
               :desc "cargo Toml file"  "t" #'lsp-rust-analyzer-open-cargo-toml
))

(map! :leader :desc "Save buffer" "ç" #'save-buffer)

(setq leetcode-prefer-language "ruby")
(setq leetcode-prefer-sql "SQLite")
(setq leetcode-save-solutions t)
(setq leetcode-directory "~/code/Leetcode")

(use-package! ox-moderncv
  :load-path "~/.doom.d/modules/org-cv/"
  :init (require 'ox-moderncv))
