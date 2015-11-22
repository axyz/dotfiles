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
               simplenote2-filter-note-by-tag
               simplenote2-add-tag
               simplenote2-delete-tag
               simplenote2-set-pinned
               simplenote2-set-markdown
               )

    :init
    (defun helm-simplenote-open (note)
      (simplenote2--open-note (concat simplenote2-directory "notes/" note)))

    (defun simplenote-get-notes-id ()
      (cddr (directory-files (concat simplenote2-directory "notes/"))))

    (defun simplenote-get-notes ()
      (mapcar (lambda (note)
                (with-temp-buffer
                  (insert-file-contents
                   (concat simplenote2-directory "notes/" note))
                  (cons (car (split-string (buffer-string) "\n" t)) note)))
              (simplenote-get-notes-id)))

    (defun simplenote-get-titles ()
      (mapcar (lambda (el) (car el)) (simplenote-get-notes)))

    (setq helm-source-simplenote
          '((name . "Notes")
            (candidates . simplenote-get-titles)
            (action . (lambda (candidate)
                        (helm-simplenote-open (cdr (assoc candidate (simplenote-get-notes))))))))

    (defun helm-simplenote ()
      (interactive)
      (helm :sources '(helm-source-simplenote)
            :buffer "*helm-simplenote*"))

    (defun helm-simplenote-ag ()
      (interactive)
      (helm-do-ag (concat simplenote2-directory "notes/")))

    (add-hook 'simplenote2-note-mode-hook 'org-mode)

    :config
    (progn
      (evil-leader/set-key
        "os" 'helm-simplenote
        "on/" 'helm-simplenote-ag
        "onl" 'simplenote2-browse
        "onc" 'simplenote2-create-note-from-buffer
        "ons" 'simplenote2-sync-notes
        "onp" 'simplenote2-push-buffer
        "onP" 'simplenote2-set-pinned
        "onM" 'simplenote2-set-markdown
        "onTa" 'simplenote2-add-tag
        "onTd" 'simplenote2-delete-tag
        "ont" 'simplenote2-filter-note-by-tag))))
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
