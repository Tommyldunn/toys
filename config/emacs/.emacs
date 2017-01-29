(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("38e64ea9b3a5e512ae9547063ee491c20bd717fe59d9c12219a0b1050b439cdd" "d5b121d69e48e0f2a84c8e4580f0ba230423391a78fcb4001ccb35d02494d79e" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "39dd7106e6387e0c45dfce8ed44351078f6acd29a345d8b22e7b8e54ac25bac4" "1e67765ecb4e53df20a96fb708a8601f6d7c8f02edb09d16c838e465ebe7f51b" "83faf27892c7119f6016e3609f346d3dae3516dede8fd8a5940373d98f615b4e" "01ce486c3a7c8b37cf13f8c95ca4bb3c11413228b35676025fdf239e77019ea1" default)))
 '(package-selected-packages
   (quote
    (cyberpunk-theme blackboard-theme color-theme-sanityinc-tomorrow monochrome-theme flycheck powerline paganini-theme evil-leader labburn-theme reykjavik-theme golden-ratio rust-mode helm evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(require 'evil)
(evil-mode 1)
(global-linum-mode t)

(require 'helm-config)

(require 'golden-ratio)
(golden-ratio-mode 1)

(load-file "~/.emacs.d/my-paganini-theme.el")
(load-theme 'my-paganini t)

(menu-bar-mode -1)

(global-evil-leader-mode)

(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
  "o" 'helm-for-files
  "b" 'switch-to-buffer
  "\\" 'split-window-horizontally
  "-" 'split-window-vertically
  "l" 'windmove-right
  "h" 'windmove-left
  "j" 'windmove-down
  "k" 'windmove-up
  "w" 'save-buffer
  "q" 'delete-window
  "<SPC>" 'evil-visual-line
  "TAB" 'indent-rigidly-right
  "k" 'kill-buffer)

(setq c-basic-indent 2)
(setq tab-width 2)
(setq indent-tabs-mode nil)

(require 'key-chord)
(key-chord-mode 1)

(key-chord-define evil-normal-state-map ",," 'evil-force-normal-state)
(key-chord-define evil-visual-state-map ",," 'evil-change-to-previous-state)
(key-chord-define evil-insert-state-map ",," 'evil-normal-state)
(key-chord-define evil-replace-state-map ",," 'evil-normal-state)

(require 'powerline)
(powerline-default-theme)

(global-flycheck-mode)

(setq linum-format "%d ")

(unless window-system
  (add-hook 'linum-before-numbering-hook
	    (lambda ()
	      (setq-local linum-format-fmt
			  (let ((w (length (number-to-string
					    (count-lines (point-min) (point-max))))))
			    (concat " %" (number-to-string w) "d "))))))

(defun linum-format-func (line)
  (concat
   (propertize (format linum-format-fmt line) 'face 'linum)
   (propertize " " 'invisible 'mode-line)))

(unless window-system
  (setq linum-format 'linum-format-func))
