;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

(setq
 projectile-project-search-path '("~/random programmier zeug/" "~/emma/")
 ns-right-option-modifier 'none ;; default emacs
 ns-right-command-modifier 'none ;; default emacs
 mac-right-option-modifier 'none ;; emacs mac port
 mac-right-option-modifier 'none ;; emacs mac port
 mac-option-modifier 'meta
 ;; ns-use-native-fullscreen t
 )

(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3") ;; fix package download issues on ELPA

(setq ns-use-native-fullscreen t)

(add-hook! web-mode 'add-node-modules-path)
(add-hook! js2-mode 'add-node-modules-path)
(add-hook! typescript-mode 'add-node-modules-path)
(add-hook! web-mode 'prettier-js-mode)
(add-hook! js2-mode 'prettier-js-mode)
(add-hook! typescript-mode 'prettier-js-mode)

;; (setq doom-theme 'doom-spacegrey)

(add-hook 'before-save-hook #'delete-trailing-whitespace)
;; (add-to-list 'auto-mode-alist (cons (purecopy "\\.vtc\\'") 'vcl-mode))

(def-package! vcl-mode
  :config
  (add-to-list 'auto-mode-alist (cons (purecopy "\\.vtc\\'") 'vcl-mode)))

(def-package! yaml-mode
  :config
  (add-to-list 'auto-mode-alist (cons (purecopy "\\.yml\\'") 'yaml-mode)))
