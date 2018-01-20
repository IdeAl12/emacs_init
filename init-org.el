(setq org-src-fontify-natively t)

(with-eval-after-load 'org
  (setq org-agenda-files '("~/.emacs.d"))
  (global-set-key (kbd "C-c a") 'org-agenda)
  (setq org-capture-templates
	'(("t" "Todo" entry (file+headline "~/.emacs.d/gtd.org" "工作安排")
	   "* TODO [#B] %?\n %i\n"
	   :empty-icon 1)))
  )



(defun my-org-mode ()
  (setq truncate-lines nil)
  )
(add-hook 'org-mode-hook 'my-org-mode)

(setq org-latex-pdf-process '("xelatex -interaction nonstopmode %f"
			      "xelatex -interaction nonstopmode %f"))


(setq org-indent-mode t)


(provide 'init-org)
