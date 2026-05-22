(add-to-list 'load-path
             "~/.emacs.d/deps/reformatter")

(use-package zig-mode
  :load-path ("~/.emacs.d/deps/reformatter"
              "~/.emacs.d/modules/lang/zig/packages")
  :defer t
  :mode "\\.zig\\'")
