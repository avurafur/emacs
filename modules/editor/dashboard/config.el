(use-package dashboard
  :load-path "~/.emacs.d/modules/editor/dashboard/packages/dashboard-1.9.0"
  :init
  (dashboard-open)
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-banner-logo-title "The one true editor Emacs")
  (setq dashboard-center-content t)
  (setq dashboard-vertically-center-content t)
  :bind
  ("C-x C-'" . dashboard-open))
