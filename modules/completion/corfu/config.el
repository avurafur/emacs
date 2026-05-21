(defun m/corfu-complete()
        (corfu-next)
        (corfu-complete))

(use-package corfu
  :defer t
  :load-path "~/.emacs.d/modules/completion/corfu/packages/corfu-2.4/"
  :custom
  (corfu-cycle t)
  (corfu-auto t)
  (corfu-quit-at-boundary 'separator)
  (corfu-auto-prefix 1)
  (corfu-auto-delay 0.0)
  (corfu-popupinfo-delay '(0.3 . 0.2))
  (corfu-echo-documentation 0.25)
  (corfu-preview-current 'insert)
  (corfu-preselect 'prompt)
  (corfu-on-exact-match nil)
  :bind (:map corfu-map
              ("M-SPC"      . corfu-insert-separator)
              ("<down>"        . corfu-next)
              ("<up>"      . corfu-previous)
              ("TAB"        . #'m/corfu-complete)
              ("S-<return>" . corfu-insert)
              ("RET"        . nil))
  :init
  (require 'corfu)
  (global-corfu-mode)
  :config
  (require 'corfu-history)
  (require 'corfu-popupinfo)
  (corfu-history-mode)
  (corfu-popupinfo-mode))
