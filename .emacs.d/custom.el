(load-theme 'solarized-dark t)
(set-default-font "Sauce Code Powerline")

;; <C-x r j e> opens emacs customization file 
(set-register ?e '(file . "~/.emacs.d/custom.el"))

;; <C-x r j i> opens ideas file
(set-register ?i '(file . "~/org/ideas.org"))

(load (expand-file-name "~/quicklisp/slime-helper.el"))
(setq inferior-lisp-program "sbcl")

(global-set-key (kbd "<f5>") 'axyz-layout-1)
(global-set-key (kbd "<f6>") 'axyz-layout-2)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; CUSTOM AXYZ FUNCTIONS ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun axyz-layout-1 ()
  (interactive)
  (delete-other-windows)
  (split-window)
  (enlarge-window 15)
  (other-window 1)
  (shell)
  (other-window 1))

(defun axyz-layout-2 ()
  (interactive)
  (delete-other-windows)
  (split-window)
  (enlarge-window 15)
  (split-window-horizontally)
  (other-window 2)
  (shell)
  (split-window-horizontally)
  (other-window 1)
  (eshell)
  (other-window 1))
