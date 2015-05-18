;;; packages.el --- simplenote Layer packages File for Spacemacs
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

(defvar simplenote-packages
  '(
    simplenote2
    )
  "List of all packages to install and/or initialize. Built-in packages
which require an initialization must be listed explicitly in the list.")

(defvar simplenote-excluded-packages '()
  "List of packages to exclude.")

;; For each package, define a function simplenote/init-<package-simplenote>
;;
(defun simplenote/init-simplenote2 ()
  (use-package simplenote2
    :commands (simplenote2-browse
               simplenote2-sync-notes
               simplenote2-create-note-from-buffer
               simplenote2-push-buffer
               simplenote2-pull-buffer
               simplenote2-filter-notes-by-tag
               simplenote2-filter-note-tag-list
               simplenote2-add-tag
               simplenote2-delete-tag
               simplenote2-set-pinned
               simplenote2-set-markdown
               )
    :init
    :config
    (progn
      (evil-leader/set-key
        "onl" 'simplenote2-browse))))
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
