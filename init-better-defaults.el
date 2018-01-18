

(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ("8lx" "lixiang")
					    ))



(setq make-backup-files nil)
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)



(delete-selection-mode t)

;;(setq initial-frame-alist (quote ((fullscreen . maximized))))

(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  (cond ((looking-at-p "\\s(") (funcall fn))
	(t (save-excursion
	     (ignore-errors (backward-up-list))
	     (funcall fn)))))

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)


(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(defun indent-buffer()
  (interactive)
  (indent-rSpacemacsegion (point-min) (point-max)))
(defun indent-region-or-buffer()
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "Indented selected region."))
      (progn
	(indent-buffer)
	(message "Indented buffer.")))))

(setq hippie-expand-try-functions-list '(try-expand-dabbrev
					 try-expand-dabbrev-all-buffers
					 try-expand-dabbrev-from-kill
					 try-complete-file-name-partially
					 try-complete-file-name
					 try-expand-all-abbrevs
					 try-expand-list
					 try-expand-line
					 try-complete-lisp-symbol-partially
					 try-complete-lisp-symbol))

(fset 'yes-or-no-p 'y-or-n-p)
(setq dired-recursive-copies 'always)
(setq dired-recursive-deletes 'always)

(put 'dired-find-alternate-file 'disabled nil)

(require 'dired-x)

(setq dired-dwim-target t)
(provide 'init-better-defaults)
