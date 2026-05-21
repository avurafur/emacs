(use-package web-mode
  :defer t
  :load-path "~/.emacs.d/modules/lang/web/packages"
  :mode (("\\.tsx\\'" . web-mode)
         ("\\.jsx\\'" . web-mode)))
