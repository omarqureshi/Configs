(fset 'insertPound
   "#")
(global-set-key (kbd "M-3") 'insertPound)

(add-to-list 'load-path "~/.emacs.d/color-theme")
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-hober)))


(defun fontify-frame (frame)
(set-frame-parameter frame 'font "-apple-Pragmata-medium-normal-normal-*-14-*-*-*-p-0-iso10646-1"))
(fontify-frame nil)
(push 'fontify-frame after-make-frame-functions)


(add-to-list 'load-path "~/.emacs.d/maxframe")
(require 'maxframe)
(add-hook 'window-setup-hook 'maximize-frame t)


(global-set-key (kbd "s-SPC") 'set-mark-command)
(global-set-key (kbd "<backspace>") 'delete-backward-char)
(global-set-key (kbd "<kp-delete>") 'delete-char)
(delete-selection-mode t)
(setq make-backup-files nil)

;; Stop ruby-mode from automatically adding coding: utf-8 lines to
;; source files with non-ascii characters
(setq ruby-insert-encoding-magic-comment nil)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(blink-cursor-mode t)
 '(inhibit-startup-screen t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
