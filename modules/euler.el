;;; euler.el --- Description -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2023 Otavio Coelho
;;
;; Author: Otavio Coelho <otavio.gmcoelho@gmail.com>
;; Maintainer: Otavio Coelho <otavio.gmcoelho@gmail.com>
;; Created: junho 01, 2023
;; Modified: junho 01, 2023
;; Version: 0.0.1
;; Keywords: convenience games tools
;; Homepage: https://github.com/0tt049/euler
;; Package-Requires: ((emacs "24.3"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;; Fetch project euler problem into Ruby file.
;;
;; the new Ruby file is named with problem number like `problem-1.rb`.
;;
;; Usage:
;;
;; run `euler-fetch-problem` with problem number.
;;
;;; Code:

(defgroup euler nil
  "Customization group for `euler' package."
  :group 'applications)

(defcustom euler-default-file-suffix ".rb"
  "File suffix for new file.
Default is ruby language suffix `.rb'."
  :type 'string
  :group 'euler)

(defcustom euler-default-file-header "#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

"
  "File header for new file."
  :type 'string
  :group 'euler)

(defcustom euler-default-comment "#"
  "Default Ruby comment."
  :type 'string
  :group 'euler)

;;;; Variables
(defvar euler-file-suffix euler-default-file-suffix
  "Initial file suffix for new file.")

(defvar euler-file-header euler-default-file-header
  "Initial file header for new file.")

(defvar euler-comment euler-default-comment
  "Default comment.")

;;;; Functions
(defun euler-get-problem-title ()
  "Get problem title."
  (goto-char (point-min))
  (re-search-forward "<h2>\\([^>]+?\\)</h2>" nil t)
  (match-string 1))

(defun euler-get-problem-info ()
  "Get problem info."
  (goto-char (point-min))
  (re-search-forward "<h3>\\([^>]+?\\)</h3>" nil t)
  (match-string 1))

(defun euler-get-problem-content ()
  "Get problem content into a list."
  (let ((content nil))
    (goto-char (point-min))
    (while (re-search-forward "<p[^>]*>\\(.*\\)</p>" nil t)
      (setq content (append content (list (match-string 1)))))
    content))

(defun euler-build-filename (euler-problem-info)
  "Build a file name with EULER-PROBLEM-INFO."
  (concat (replace-regexp-in-string " " "_" (downcase euler-problem-info))
          euler-file-suffix))

(defun euler-build-problem-string (euler-problem-title euler-problem-content)
  "Build a string for problem. EULER-PROBLEM-TITLE, EULER-PROBLEM-CONTENT."
  (concat euler-file-header
          euler-comment  "\n"
          euler-comment  " " euler-problem-title "\n"
          (mapconcat 'identity
                     (mapcar (lambda  (s)
                               (concat euler-comment  "\n"
                                       euler-comment  " " s))
                             euler-problem-content)
                     "\n")
          "\n" euler-comment  "\n"))

(defun euler-create-file (euler-problem-title euler-problem-info euler-problem-content)
  "File in dir. EULER-PROBLEM-TITLE EULER-PROBLEM-INFO EULER-PROBLEM-CONTENT."
  (append-to-file (euler-build-problem-string euler-problem-title euler-problem-content)
                  nil (euler-build-filename euler-problem-info)))

(defun euler-open-file (euler-problem-info)
  "Open euler problem file of EULER-PROBLEM-INFO."
  (find-file (euler-build-filename euler-problem-info)))

;;;; Interactive functions
;;;###autoload
(defun euler-fetch-problem (euler-problem-number)
  "Fetch euler problem of EULER-PROBLEM-NUMBER."
  (interactive "nProblem Number: ")
  (let ((url (concat "https://projecteuler.net/problem=" (number-to-string euler-problem-number))))
    (with-current-buffer (url-retrieve-synchronously url)
      (let ((euler-problem-info (euler-get-problem-info)))
        (euler-create-file (euler-get-problem-title) euler-problem-info (euler-get-problem-content))
        (euler-open-file euler-problem-info)
        (goto-char (point-max)))
      (message "Fetch Success!"))))

(provide 'euler)
;;; euler.el ends here
