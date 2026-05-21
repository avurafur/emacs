(use-package expand-region
  :load-path "~/.emacs.d/modules/editor/expand-region/packages/expand-region-1.0.0"
  :bind
  ("C--" . #'er/contract-region)
  ("C-=" . #'er/expand-region))
