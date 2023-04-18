;; init.el -*- lexical-binding: t; -*-

(doom! :input

       :completion
       company
       vertico

       :ui
       doom
       doom-dashboard
       doom-quit
       hl-todo
       hydra
       indent-guides
       ligatures
       modeline
       nav-flash
       neotree
       ophints
       (popup +defaults)
       unicode
       vc-gutter
       workspaces
       zen

       :editor
       (evil +everywhere)
       file-templates
       fold
       format
       multiple-cursors
       rotate-text
       snippets
       word-wrap

       :emacs
       dired
       electric
       vc
       (undo + tree)

       :term
       vterm

       :checkers
       (spell +flyspell)
       syntax

       :tools
       biblio
       (eval +overlay)
       lookup
       lsp
       magit
       make
       pdf
       rgb
       taskrunner

       :os
       tty

       :lang
       (cc +lsp)
       emacs-lisp
       (go +lsp +tree-sitter)
       (javascript +lsp +tree-sitter)
       (json +lsp)
       latex
       lua
       markdown
       (org +hugo +journal +pandoc +present +pretty +roam)
       (python +lsp +pyright +pyenv)
       qt
       (ruby +rails +lsp +rbenv)
       rust
       sh
       (web +lsp +tree-sitter)
       (yaml +lsp)

       :email

       :app
       calendar
       emms
       everywhere
       irc
       (rss +org)
       twitter

       :config
       (default +bindings +smartparens))
