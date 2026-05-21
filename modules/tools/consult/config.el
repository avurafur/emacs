(use-package consult
  :defer t
  :load-path "~/.emacs.d/modules/tools/consult/packages/consult-2.9"
  :bind
  (("C-x b" . consult-buffer)
   ("C-S-s" . consult-grep)
   ("C-s" . consult-line)
  ("C-x f" . consult-find))
  :config
  (setq consult-preview-key nil))
