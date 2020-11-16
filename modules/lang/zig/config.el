;;; lang/zig/config.el -*- lexical-binding: t; -*-

(use-package! zig-mode
  :hook (zig-mode-local-vars . lsp!)
  :config
  (setq zig-format-on-save nil))

(after! lsp-mode
  (add-to-list 'lsp-language-id-configuration '(zig-mode . "zig"))
  (lsp-register-client
   (make-lsp-client
    :new-connection (lsp-stdio-connection "zls")
    :major-modes '(zig-mode)
    :priority -1
    :server-id 'zls
    )))
