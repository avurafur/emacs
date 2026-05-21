(load (expand-file-name "lisp/module-loader.el" user-emacs-directory))
(load-theme 'nord t)

(module! "lang" "web")
(module! "lang" "odin")
(module! "lang" "rust")
(module! "lang" "zig")
(module! "lang" "go")
(module! "lang" "lua")

(module! "editor" "multiple-cursors")
(module! "editor" "expand-region")
(module! "editor" "marginalia")
(module! "editor" "rainbow-delimiters")

(module! "tools" "lsp")
(module! "completion" "vertico")
(module! "completion" "corfu")
