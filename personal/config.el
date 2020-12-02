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

(provide 'config)
;;; config.el ends here
