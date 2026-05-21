(use-package rainbow-delimiters
  :defer t
  :load-path "~/.emacs.d/modules/editor/rainbow-delimiters/packages"
  :init
  (require 'rainbow-delimiters)
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))
