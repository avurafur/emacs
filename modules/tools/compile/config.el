(require 'compile)
(load (expand-file-name "emm-project.el"
                        (file-name-directory load-file-name)))

(setq compilation-scroll-output t)
(defvar last-compile-command nil)
(defvar last-compile-tests-command nil)

(defun get-common-project-compile-command(root)
  "get the project common compile command"
  (cond
   ((file-exists-p (expand-file-name "build.bat" root)) "build.bat")
   ((file-exists-p (expand-file-name "build.sh" root))
    (if (eq system-type 'windows-nt) ".\\build.bat" "bash build.sh"))
   ((file-exists-p (expand-file-name "Cargo.toml" root)) "cargo run")
   ((file-exists-p (expand-file-name ".venv" root))
    (if (eq system-type 'windows-nt) "python main.py" "python3 main.py"))
   ((directory-files root nil "\\.nimble\\'") "nimble run")
   ((directory-files root nil "\\.ninja\\'") "ninja")
   ((file-exists-p (expand-file-name "package.json" root)) "npm run dev")
   ((file-exists-p (expand-file-name "go.mod" root)) "go run ")
   ((file-exists-p (expand-file-name "build.zig" root)) "zig build run")
   ((file-exists-p (expand-file-name "build.c" root)) "build")
   ((file-exists-p (expand-file-name "Makefile" root))
    (if (eq system-type 'windows-nt) "mingw32-make" "make"))
   ((file-exists-p (expand-file-name "CMakeLists.txt" root)) "cmake -S .")
   ((directory-files root nil "\\.asd\\'") "sbcl ")
   ((file-exists-p (expand-file-name "premake5.lua" root)) "premake5 gmake")
   ((file-exists-p (expand-file-name "project.json" root)) "")
   ((file-exists-p (expand-file-name "project.janet" root)) "jpm run")
   ((file-exists-p (expand-file-name "project.clj" root)) "lein run")
   ((file-exists-p (expand-file-name "deps.edn" root)) "")
   ((file-exists-p (expand-file-name "v.mod" root)) "v run .")
   (t nil)))

(defun get-common-project-compile-tests-command(root)
  "get the project common compile command"
  (cond
   ((file-exists-p (expand-file-name "Cargo.toml" root)) "cargo test")
   ((file-exists-p (expand-file-name "package.json" root)) "npm test")
   ((file-exists-p (expand-file-name ".venv" root))
    (if (eq system-type 'windows-nt) "python -m unittest tests/" "python3 -m unittest tests/"))
   ((file-exists-p (expand-file-name "go.mod" root)) "go test")
   ((file-exists-p (expand-file-name "build.zig" root)) "zig test tests/")
   (t nil)))

(defun compile-root-wo-prompt()
  "Run `compile` without command prompt."
  (interactive)
  (let ((default-directory (or (find-project-root-dir) default-directory)))
    (cond 
     ((null last-compile-command) (compile-root-w-prompt))
    (t (compile last-compile-command)))))

(defun compile-root-w-prompt()
  "Prompt for a compile command and run it from the project root."
  (interactive)
  (let* ((root (or (find-project-root-dir) default-directory))
         (default-command (or last-compile-command (get-common-project-compile-command root)))
         (command (read-shell-command "compile: " default-command)))
    (setq last-compile-command command)
    (let ((default-directory root))
      (compile command))))

(defun compile-root-tests-w-prompt()
  "Prompt for a compile command and run it from the project root."
  (interactive)
  (let* ((root (or (find-project-root-dir) default-directory))
         (default-command (or last-compile-tests-command (get-common-project-compile-tests-command root)))
         (command (read-shell-command "tests: " default-command)))
    (setq last-compile-tests-command command)
    (let ((default-directory root))
      (compile command))))

(defun compile-root-tests-wo-prompt()
  "Run `compile` without command prompt."
  (interactive)
  (let ((default-directory (or (find-project-root-dir) default-directory)))
    (cond 
     ((null last-compile-tests-command) (compile-root-tests-w-prompt))
    (t (compile last-compile-tests-command)))))

(defun goto-project-root()
  (interactive)
  (let ((dir (find-project-root-dir)))
    (if dir
        (progn
          (find-file (expand-file-name dir)))
      (message "[INFO] No markers were found for the project"))))

(global-set-key (kbd "C-c C") 'compile-root-w-prompt)
(global-set-key (kbd "C-c C-c") 'compile-root-wo-prompt)
(global-set-key (kbd "C-c T") 'compile-root-tests-w-prompt)
(global-set-key (kbd "C-c C-t") 'compile-root-tests-wo-prompt)

(keymap-global-set "C-c C-j" #'goto-project-root)
