;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; refresh' after modifying this file!


;; These are used for a number of things, particularly for GPG configuration,
;; some email clients, file templates and snippets.

(setq user-full-name "Björn Erlwein"
      user-mail-address "bjoern.erlwein@empiriecom.com")

(setq doom-font (font-spec :family "Hack" :size 13))

(setq org-directory "~/Documents/org/"
      org-agenda-files '("~/Documents/org-agenda/"))

(setq display-line-numbers-type t)

(setq projectile-project-search-path '("~/random programmier zeug/" "~/emma/"))

(add-hook 'before-save-hook #'delete-trailing-whitespace)

(use-package! lsp-java
  :config
  (setq lsp-java-java-path "/Users/bjoernerlwein/.asdf/installs/java/adoptopenjdk-12.0.2+10.1/bin/java")
  )

(setq! evil-escape-key-sequence "jj")

(setq ns-right-option-modifier 'none ;; default emacs
      ns-right-command-modifier 'none ;; default emacs
      mac-right-option-modifier 'none ;; emacs mac port
      mac-right-option-modifier 'none ;; emacs mac port
      mac-option-modifier 'meta
      ns-use-native-fullscreen t)

(use-package! vcl-mode
  :config
  (add-to-list 'auto-mode-alist (cons (purecopy "\\.vtc\\'") 'vcl-mode)))

(use-package! yaml-mode
  :config
  (add-to-list 'auto-mode-alist (cons (purecopy "\\.yml\\'") 'yaml-mode)))

(use-package! web-mode
  :config
  (add-to-list 'auto-mode-alist (cons (purecopy "\\.isml\\'") 'web-mode)))

(use-package! vcl-mode
  :config
  (add-to-list 'auto-mode-alist (cons (purecopy "\\.vtc\\'") 'vcl-mode)))

(add-hook! web-mode 'add-node-modules-path)
(add-hook! js2-mode 'add-node-modules-path)
(add-hook! typescript-mode 'add-node-modules-path)
(add-hook! yaml-mode 'add-node-modules-path)

(add-hook! web-mode 'prettier-js-mode)
(add-hook! js2-mode 'prettier-js-mode)
(add-hook! typescript-mode 'prettier-js-mode)
(add-hook! yaml-mode 'prettier-js-mode)

(use-package! lsp-treemacs
  :config (lsp-treemacs-sync-mode 1))

(use-package! ejira
  :init
  (setq org-id-track-globally t
        jiralib2-url              "https://jira.empirie.com"
        jiralib2-auth             'basic
        jiralib2-user-login-name  "berlwein"
        jiralib2-token            nil

        ejira-org-directory       "~/Documents/jira"
        ejira-main-project        "NCO"
        ejira-projects            '("NCO" "RMK" "HDR"))
  :config
  (setq ejira-epic-field 'customfield_1006
        ejira-sprint-field 'customfield_10005
        ejira-epic-summary-field 'customfield_10007)
  ;; Make the issues visisble in your agenda by adding `ejira-org-directory'
  ;; into your `org-agenda-files'.
  (add-to-list 'org-agenda-files ejira-org-directory)
  (require 'ejira-agenda))
