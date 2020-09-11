;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; refresh' after modifying this file!


;; These are used for a number of things, particularly for GPG configuration,
;; some email clients, file templates and snippets.
(setq user-full-name "Björn Erlwein"
      user-mail-address "bjoern.erlwein@empiriecom.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
                                        ;(setq doom-font (font-spec :family "monospace" :size 14)
                                        ;      doom-variable-pitch-font (font-spec :family "sans"))
(setq doom-font (font-spec :family "Roboto Mono" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. These are the defaults.
(setq doom-theme 'doom-one)

;; If you intend to use org, it is recommended you change this!
(setq org-directory "~/org/")

;; If you want to change the style of line numbers, change this to `relative' or
;; `nil' to disable it:
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', where Emacs
;;   looks when you load packages with `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.

(setq
 projectile-project-search-path '("~/random programmier zeug/" "~/emma/")
 ns-right-option-modifier 'none ;; default emacs
 ns-right-command-modifier 'none ;; default emacs
 mac-right-option-modifier 'none ;; emacs mac port
 mac-right-option-modifier 'none ;; emacs mac port
 mac-option-modifier 'meta
 ;; ns-use-native-fullscreen t
 org-agenda-files '("~/Documents/org-agenda/")
 )
;; enable pretty font rendering or something
                                        ; (mac-auto-operator-composition-mode)
                                        ; (setq doom-font (font-spec :family "Fira Code" :size 13))

(setq! evil-escape-key-sequence "jj")

(setq ns-use-native-fullscreen t)

(add-hook! web-mode 'add-node-modules-path)
(add-hook! js2-mode 'add-node-modules-path)
(add-hook! typescript-mode 'add-node-modules-path)
(add-hook! yaml-mode 'add-node-modules-path)
(add-hook! web-mode 'prettier-js-mode)
(add-hook! js2-mode 'prettier-js-mode)
(add-hook! typescript-mode 'prettier-js-mode)
(add-hook! yaml-mode 'prettier-js-mode)

;;(setq doom-theme 'doom-gruvbox)

(add-hook 'before-save-hook #'delete-trailing-whitespace)
;; (add-to-list 'auto-mode-alist (cons (purecopy "\\.vtc\\'") 'vcl-mode))

(use-package! vcl-mode
  :config
  (add-to-list 'auto-mode-alist (cons (purecopy "\\.vtc\\'") 'vcl-mode)))

(use-package! yaml-mode
  :config
  (add-to-list 'auto-mode-alist (cons (purecopy "\\.yml\\'") 'yaml-mode)))

(use-package! web-mode
  :config
  (add-to-list 'auto-mode-alist (cons (purecopy "\\.isml\\'") 'web-mode)))

(defun toggle-fullscreen ()
  "Toggle full screen"
  (interactive)
  (set-frame-parameter
   nil 'fullscreen
   (when (not (frame-parameter nil 'fullscreen)) 'fullboth)))

(use-package! lsp-treemacs
  :config (lsp-treemacs-sync-mode 1))
