

(when (>= emacs-major-version 24)
    (require 'package)
    (package-initialize)
    (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
    )
(require 'cl)

;;add whatever packages you want here
(defvar lixiang/packages '(
			   company
			   list-processes+
			   monokai-theme
			   hungry-delete
			   swiper
			   counsel
			   smartparens
			   js2-mode
			   exec-path-from-shell
			   elpy
			   epc
			   flycheck
			   better-defaults
			   popwin
			   reveal-in-osx-finder
			   window-numbering
			   solarized-theme
			   spacemacs-theme
			   )  "Default packages")
(setq package-selected-packages 'lixiang/packages)

(defun lixiang/packages-installed-p ()
    (loop for pkg in lixiang/packages
          when (not (package-installed-p pkg)) do (return nil)
          finally (return t)))

(unless (lixiang/packages-installed-p)
    (message "%s" "Refreshing package database...")
    (package-refresh-contents)
    (dolist (pkg lixiang/packages)
      (when (not (package-installed-p pkg))
        (package-install pkg))))

(defvar myPackages
  '(better-defaults
    ein
    elpy
    flycheck
    material-theme
    py-autopep8))

(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      myPackages)
(require 'elpy)

(setq elpy-rpc-python-command "python3")
(setq python-shell-interpreter "python3")
(setq pyvenv-virtualenvwrapper-python "/usr/local/lib/python3.6")


;; PYTHON CONFIGURATION
;; --------------------------------------

(elpy-enable)

;; use flycheck not flymake with elpy
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; enable autopep8 formatting on save
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

(require 'hungry-delete)
(global-hungry-delete-mode)

(require 'popwin)
(popwin-mode t)

;;config for js files
(setq auto-mode-alist
      (append
       '(("\\.js" . js2-mode))
       auto-mode-alist))




(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

(load-theme 'spacemacs-light t)
;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)
(sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)

;; python environment                                    
(autoload 'jedi:setup "jedi" nil t)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:setup-keys t) ; optional                 
(setq jedi:complete-on-dot t) ;optional
(global-auto-complete-mode 1)

(global-company-mode t)

(provide 'init-packages)
