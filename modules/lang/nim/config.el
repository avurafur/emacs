(use-package nim-mode
  :load-path ("~/.emacs.d/deps/commenter"
              "~/.emacs.d/modules/lang/nim/packages/nim-mode-0.4.2")
  :defer t
  :mode (("\\.nim\\'" . nim-mode)
         ("\\.nims\\'" . nim-mode)
         ("\\.nimble\\'" . nim-mode)))
