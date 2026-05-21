(require 'org)
(require 'ob)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)))

(defun m/setup-org-mode()
  "things that run after org mode loads"
  ())

(use-package org
  :hook (org-mode . m/setup-org-mode)
  :mode ("\\.org\\'" . org-mode)
  :config
  (setq org-startup-folded 'content
        org-hide-block-startup t
        org-src-fontify-natively t
        org-src-tab-acts-natively t
        org-edit-src-content-indentation 0))

(use-package org-bullets
  :load-path "~/.emacs.d/modules/emacs/org/packages/"
  :after org
  :hook (org-mode . org-bullets-mode))
