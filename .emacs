(add-to-list 'load-path "~/.emacs.d/vendor/textmate.el")
(require 'textmate)
(add-to-list 'load-path "~/.emacs.d/vendor/")
(require 'peepopen)
(textmate-mode)
(add-to-list 'load-path "~/.emacs.d/vendor/spiffy-elisp")
(require 'spiffy-textmate-mode)
(spiffy-textmate-mode t)
(add-to-list 'load-path "~/.emacs.d/vendor/markdown-mode")
(autoload 'markdown-mode "markdown-mode.el"
   "Major mode for editing Markdown files" t)
(require 'textile-mode)
(add-to-list 'auto-mode-alist '("\\.textile\\'" . textile-mode))
(add-to-list 'load-path "~/.emacs.d/ruby-mode")
(require 'ruby-mode)

(require 'pretty-mode)
(global-pretty-mode 1)
(global-linum-mode)

(setq ns-pop-up-frames nil)

 ;;; nxml (HTML ERB template support)
(load "~/.emacs.d/nxhtml/autostart.el")

(setq
 mumamo-chunk-coloring 'submode-colored
 nxhtml-skip-welcome t
 rng-nxml-auto-validate-flag nil
 nxml-degraded t)
(add-to-list 'auto-mode-alist '("\\.html\\.erb$" . eruby-nxhtml-mumamo-mode)) 

(fset 'insertPound
   "#")
(global-set-key (kbd "M-3") 'insertPound)

(add-to-list 'load-path "~/.emacs.d/color-theme")
(require 'color-theme)
(load "~/.emacs.d/color-theme/themes/solarized")
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-solarized-dark)))


(defun fontify-frame (frame)
(set-frame-parameter frame 'font "-apple-Pragmata-medium-normal-normal-*-18-*-*-*-p-0-iso10646-1"))
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

(add-hook 'isearch-mode-hook
	  (lambda ()
	    (define-key isearch-mode-map (kbd "<backspace>") 'isearch-del-char)
	    )
	  )

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


(defun autocompile nil
  "compile itself if ~/.emacs"
  (interactive)
  (require 'bytecomp)
  (if (string= (buffer-file-name) (expand-file-name (concat
default-directory ".emacs")))
      (byte-compile-file (buffer-file-name))))

(add-hook 'after-save-hook 'autocompile)
