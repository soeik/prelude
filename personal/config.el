;;; config.el --- Personal configuration
;;
;; Copyright (c) 2020 Kirill Stepanov
;;
;; Author: Kirill Stepanov
;; URL: https://github.com/soeik
;; Version: 1.0.0
;; Keywords: convenience

;; This file is not part of GNU Emacs.

;;; Commentary:

;; This file extends prelude's setup

;;; Code:


;; Add necessaray packages
(prelude-require-packages '(rjsx-mode
                            typescript-mode
                            tide
                            ace-jump-mode
                            moe-theme))

;; Unbind right option key
(setq mac-command-key-is-meta nil
      mac-command-modifier nil)
(setq mac-option-key-is-meta t
      mac-option-modifier 'meta
      mac-right-option-modifier nil)

;; Disable themes on load
(defun disable-all-themes ()
  "disable all active themes."
  (dolist (i custom-enabled-themes)
    (disable-theme i)))

(defadvice load-theme (before disable-themes-first activate)
  (disable-all-themes))

;; Typescript and TSX support
(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

(setq company-tooltip-align-annotations t)
(add-hook 'before-save-hook 'tide-format-before-save)
(add-hook 'typescript-mode-hook #'setup-tide-mode)

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "tsx" (file-name-extension buffer-file-name))
              (setup-tide-mode))))
;; enable typescript-tslint checker
(flycheck-add-mode 'typescript-tslint 'web-mode)

;; JSX mode
(add-to-list 'auto-mode-alist '("\\.jsx?$" . web-mode)) ;; auto-enable for .js/.jsx files
(setq web-mode-content-types-alist '(("jsx" . "\\.js[x]?\\'")))

(provide 'config)
;;; config.el ends here
