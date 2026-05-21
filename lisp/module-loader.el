(defun module! (category name)
  (let* ((base (expand-file-name
                (format "modules/%s/%s"
                        category
                        name)
                user-emacs-directory))
         (packages (expand-file-name
                    "packages"
                    base))
         (config (expand-file-name
                  "config.el"
                  base)))
    (add-to-list 'load-path packages)
    (load config nil t)))
