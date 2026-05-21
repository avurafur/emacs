(setq gc-cons-percentage 1.0)

(if noninteractive
    (setq gc-cons-threshold 134217728) ; 128mb
  (setq gc-cons-threshold most-positive-fixnum)
  (setq load-prefer-newer nil))

(setq tramp-mode nil)
(setq tool-bar-mode nil)
(setq menu-bar-mode nil)
(setq scroll-bar-mode nil)

(when (fboundp 'aggressive-indent-mode)
  (aggressive-indent-mode -1))
(setq use-dialog-box nil)
(setq file-name-handler-alist nil)
(set-face-attribute 'default nil :height 170)

(mapc #'disable-theme custom-enabled-themes)
(setq custom-file (locate-user-emacs-file "theme-gen.el"))
(load custom-file 'noerror)
