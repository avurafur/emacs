(use-package multiple-cursors
  :load-path "~/.emacs.d/modules/editor/multiple-cursors/packages/multiple-cursors-1.5.0"
  :bind
  ("C->" . 'mc/mark-next-like-this)
  ("C-<" . 'mc/mark-previous-like-this)
  ("C-c C-<" . 'mc/mark-all-like-this))
