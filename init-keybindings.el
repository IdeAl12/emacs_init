
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)
(global-set-key (kbd "C-h l") 'counsel-find-library)

(global-set-key (kbd "<f2>") 'open-my-init-file)

(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)
(global-set-key (kbd "s-/") 'hippie-expand)


(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

(global-set-key (kbd "C-c r") 'org-capture)

(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-n") #'company-select-previous))



;;删除前一个单词
(global-set-key (kbd "C-w") 'backward-kill-word)

;;(global-set-key (kbd "C-z") 'evil-set-toggle-key)

(provide 'init-keybindings)
