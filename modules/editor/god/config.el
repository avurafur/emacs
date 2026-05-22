(use-package god-mode
  :load-path "~/.emacs.d/modules/editor/god/packages/god-mode-2.19.0/"
  :config
  (god-mode-all)
  (define-key god-local-mode-map (kbd "i") #'god-local-mode)
  (global-set-key
   (kbd "<escape>")
   (lambda ()
     (interactive)
     (god-local-mode 1))))
