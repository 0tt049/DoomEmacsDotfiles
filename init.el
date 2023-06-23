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
       (spell +aspell +flyspell)
       syntax

       :tools
       biblio
       direnv
       (eval +overlay)
       lookup
       lsp
       magit
       make
       pdf
       rgb
       tree-sitter
       taskrunner

       :os
       tty

       :lang
       (cc +lsp)
       (csharp +dotnet +lsp +tree-sitter +unity)
       emacs-lisp
       (go +lsp +tree-sitter)
       (javascript +lsp +tree-sitter)
       (java +lsp +tree-sitter)
       (json +lsp)
       (latex +cdlatex +fold +lsp)
       (haskell +lsp +tree-sitter)
       lua
       (markdown +grip)
       (org +hugo +journal +pandoc +present +pretty)
       (python +lsp +tree-sitter +pyenv)
       qt
       (ruby +rails +lsp +rbenv +tree-sitter)
       (rust +lsp +tree-sitter)
       sh
       (web +lsp +tree-sitter)
       (yaml +lsp)
       (faust)

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
