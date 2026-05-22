(defvar loaded-modules nil)

(defun module-path (category name)
  (expand-file-name
   (format "modules/%s/%s"
           category
           name)
   user-emacs-directory))

(defun module-key (category name)
  (format "%s/%s" category name))

(defun module! (category name)
  (let ((key (module-key category name)))
    (unless (member key loaded-modules)

      (push key loaded-modules)

      (let* ((base (module-path category name))
             (packages (expand-file-name
                        "packages"
                        base))
             (config (expand-file-name
                      "config.el"
                      base)))

        (when (file-directory-p packages)
          (add-to-list 'load-path packages))

        (when (file-exists-p config)
          (load config nil t))))))
