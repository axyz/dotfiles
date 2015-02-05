(scroll-bar-mode -1)

(add-to-list 'auto-mode-alist '("\\.php$" . web-mode))

(custom-set-variables
 '(haskell-process-type 'cabal-repl)
  '(js2-basic-offset 2)
  '(js2-bounce-indent-p t)
  '(web-mode-markup-indent-offset 2)
  '(web-mode-css-indent-offset 2)
  '(web-mode-code-indent-offset 2)
  '(web-mode-sql-indent-offset 2))
