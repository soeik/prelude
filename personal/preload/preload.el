;;; Code:

;; Set default theme
(setq prelude-theme 'moe-light)

;; Set font
(add-to-list 'default-frame-alist '(font . "Source Code Pro Light" ))

;; Set font and line-spacing
(set-face-attribute 'default nil :height 160)
(setq-default line-spacing 0.5)

;; Maximize on startup
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Add some fancy transparency
(set-frame-parameter (selected-frame) 'alpha '(100 .  90))
(add-to-list 'default-frame-alist '(alpha . (100 . 90)))

(provide 'preload)
