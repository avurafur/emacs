(load (expand-file-name "lisp/module-loader.el" user-emacs-directory))

(load-theme 'modus-vivendi t)
(set-face-background 'line-number "#000000")
(set-face-background 'line-number-current-line "#000000")
(set-face-background 'fringe "#000000")

(module! "editor" "god")

(module! "editor" "multiple-cursors")
(module! "editor" "expand-region")
(module! "editor" "marginalia")
(module! "editor" "rainbow-delimiters")
(module! "modelines" "prot-modeline")

(module! "lang" "web")
(module! "lang" "odin")
(module! "lang" "rust")
(module! "lang" "zig")

(module! "tools" "lsp")
(module! "tools" "compile")
(module! "completion" "vertico")
(module! "completion" "corfu")
