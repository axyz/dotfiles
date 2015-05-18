;;; packages.el --- trello Layer packages File for Spacemacs
;;
;; Copyright (c) 2012-2014 Sylvain Benner
;; Copyright (c) 2014-2015 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defvar trello-packages
  '(
    org-trello
    )
  "List of all packages to install and/or initialize. Built-in packages
which require an initialization must be listed explicitly in the list.")

(defvar trello-excluded-packages '()
  "List of packages to exclude.")

;; For each package, define a function trello/init-<package-trello>
;;
(defun trello/init-org-trello ()
  (use-package org-trello
    :commands (org-trello/version
               org-trello/install-key-and-token
               org-trello/install-board-metadata
               org-trello/sync-card
               org-trello/sync-buffer
               org-trello/assign-me
               org-trello/check-setup
               org-trello/delete-setup
               org-trello/create-board-and-install-metadata
               org-trello/kill-entity
               org-trello/kill-cards
               org-trello/archive-card
               org-trello/archive-cards
               org-trello/jump-to-trello-card
               org-trello/jump-to-trello-board
               org-trello/add-card-comments
               org-trello/show-card-comments
               org-trello/show-card-labels
               org-trello/update-board-metadata
               org-trello/help-describing-bindings
               )
    :init
    ;; org-trello major mode for all .trello files
    (add-to-list 'auto-mode-alist '("\\.trello$" . org-mode))

    ;; add a hook function to check if this is trello file, then activate the org-trello minor mode.
    (add-hook 'org-mode-hook
              (lambda ()
                (let ((filename (buffer-file-name (current-buffer))))
                  (when (and filename (string= "trello" (file-name-extension filename)))
                    (org-trello-mode)))))

    :config
    (progn
      (evil-leader/set-key
        "ots" 'org-trello/sync-buffer
        "otc" 'org-trello/sync-card
        ))))
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package


