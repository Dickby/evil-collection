;;; evil-rtags.el --- Evil bindings for `rtags'. -*- lexical-binding: t -*-

;; Copyright (C) 2017 James Nguyen

;; Author: James Nguyen <james@jojojames.com>
;; Maintainer: James Nguyen <james@jojojames.com>
;; Pierre Neidhardt <ambrevar@gmail.com>
;; URL: https://github.com/jojojames/evil-collection
;; Version: 0.0.1
;; Package-Requires: ((emacs "25.1"))
;; Keywords: evil, rtags, tools

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;;; Evil bindings for `rtags'.

;;; Code:
(require 'evil)
(require 'rtags nil t)

(defvar rtags-mode-map)
(defvar rtags-dependency-tree-mode-map)
(defvar rtags-references-tree-mode-map)
(defvar rtags-location-stack-visualize-mode-map)

(defun evil-rtags-setup ()
  "Set up `evil' bindings for `rtags'."
  (evil-set-initial-state 'rtags-mode 'normal)
  (evil-set-initial-state 'rtags-dependency-tree-mode 'normal)
  (evil-set-initial-state 'rtags-references-tree-mode 'normal)
  (evil-set-initial-state 'rtags-location-stack-visualize-mode 'normal)

  (evil-define-key 'normal rtags-mode-map
    ;; open
    (kbd "<return>") 'rtags-select
    (kbd "S-<return>") 'rtags-select-other-window
    (kbd "M-<return>") 'rtags-show-in-other-window
    (kbd "go") 'rtags-select-other-window
    (kbd "gO") 'rtags-show-in-other-window
    [mouse-1] 'rtags-select-other-window
    [mouse-2] 'rtags-select-other-window
    "s" 'rtags-show-in-other-window ; TODO: Remove this binding?

    "c" 'rtags-select-caller
    "C" 'rtags-select-caller-other-window
    "x" 'rtags-select-and-remove-rtags-buffer
    "q" 'rtags-call-bury-or-delete)

  (evil-define-key 'normal rtags-dependency-tree-mode-map
    (kbd "TAB") 'rtags-dependency-tree-toggle-current-expanded
    (kbd "E") 'rtags-dependency-tree-expand-all
    (kbd "c") 'rtags-dependency-tree-collapse-all
    (kbd "-") 'rtags-dependency-tree-collapse-current
    (kbd "+") 'rtags-dependency-tree-expand-current
    "P" 'rtags-dependency-tree-find-path
    "gf" 'rtags-dependency-tree-find-path

    "gj" 'rtags-dependency-tree-next-level
    "gk" 'rtags-dependency-tree-previous-level

    (kbd "C-j") 'rtags-dependency-tree-next-level
    (kbd "C-k") 'rtags-dependency-tree-previous-level
    "]" 'rtags-dependency-tree-next-level
    "[" 'rtags-dependency-tree-previous-level

    ;; open
    (kbd "<return>") 'rtags-select
    (kbd "S-<return>") 'rtags-select-other-window
    (kbd "M-<return>") 'rtags-show-in-other-window
    (kbd "go") 'rtags-select-other-window
    (kbd "gO") 'rtags-show-in-other-window
    [mouse-1] 'rtags-select-other-window
    [mouse-2] 'rtags-select-other-window
    "s" 'rtags-show-in-other-window

    "x" 'rtags-select-and-remove-rtags-buffer
    "q" 'rtags-call-bury-or-delete)

  (evil-define-key 'normal rtags-references-tree-mode-map
    (kbd "TAB") 'rtags-references-tree-toggle-current-expanded

    (kbd "E") 'rtags-references-tree-expand-all
    (kbd "c") 'rtags-references-tree-collapse-all
    (kbd "-") 'rtags-references-tree-collapse-current
    (kbd "+") 'rtags-references-tree-expand-current

    "gj" 'rtags-references-tree-next-level
    "gk" 'rtags-references-tree-previous-level

    (kbd "C-j") 'rtags-references-tree-next-level
    (kbd "C-k") 'rtags-references-tree-previous-level

    "]" 'rtags-references-tree-next-level
    "[" 'rtags-references-tree-previous-level

    ;; open
    (kbd "<return>") 'rtags-select
    (kbd "S-<return>") 'rtags-select-other-window
    (kbd "M-<return>") 'rtags-show-in-other-window
    (kbd "go") 'rtags-select-other-window
    (kbd "gO") 'rtags-show-in-other-window
    [mouse-1] 'rtags-select-other-window
    [mouse-2] 'rtags-select-other-window
    "s" 'rtags-show-in-other-window

    "x" 'rtags-select-and-remove-rtags-buffer
    "q" 'rtags-call-bury-or-delete)

  (evil-define-key 'normal rtags-location-stack-visualize-mode-map
    ;; open
    (kbd "<return>") 'rtags-select
    (kbd "S-<return>") 'rtags-select-other-window
    (kbd "M-<return>") 'rtags-show-in-other-window
    (kbd "go") 'rtags-select-other-window
    (kbd "gO") 'rtags-show-in-other-window
    [mouse-1] 'rtags-select-other-window
    [mouse-2] 'rtags-select-other-window
    "s" 'rtags-show-in-other-window

    "x" 'rtags-select-and-remove-rtags-buffer
    "q" 'rtags-call-bury-or-delete))

(provide 'evil-rtags)
;;; evil-rtags.el ends here
