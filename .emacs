(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files '("~/dev/memo/functional.org"))
 '(package-selected-packages
   '(lsp-mode yasnippet lsp-treemacs helm-lsp projectile hydra flycheck company avy which-key helm-xref dap-mode))
 '(safe-local-variable-values '((flycheck-gcc-language-standard . c++17))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 200 :width normal :foundry "nil" :family "Monaco")))))

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(use-package try :ensure t)
(use-package which-key :ensure t :config (which-key-mode))

(load-theme 'railscast t t)
(enable-theme 'railscast)

(require 'yasnippet)
(yas-global-mode 1)
(package-install 'flycheck)

;;스플래시 화면을 끔 (다시 켜려면 t를 0으로 변경)
(setq inhibit-splash-screen t)

;;문법 강조를 활성화
(global-font-lock-mode t)
(transient-mark-mode 1)

;;;;org-mode 설정
;;org-mode 활성화
(require 'org)
;;org-mode를 .org로 끝나는 파일에서 활성화
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

(global-flycheck-mode)
(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)
    ))

(package-install 'exec-path-from-shell)
(exec-path-from-shell-initialize)

(use-package modern-cpp-font-lock
  :ensure t)

(use-package magit
  :ensure t
  :init
  (progn
    (bind-key "C-x g" 'magit-status)))

;;; cpp lsp config
(setq package-selected-packages '(lsp-mode yasnippet lsp-treemacs helm-lsp
    projectile hydra flycheck company avy which-key helm-xref dap-mode))

(when (cl-find-if-not #'package-installed-p package-selected-packages)
  (package-refresh-contents)
  (mapc #'package-install package-selected-packages))

;; sample `helm' configuration use https://github.com/emacs-helm/helm/ for details
(helm-mode)
(require 'helm-xref)
(define-key global-map [remap find-file] #'helm-find-files)
(define-key global-map [remap execute-extended-command] #'helm-M-x)
(define-key global-map [remap switch-to-buffer] #'helm-mini)

(which-key-mode)
(add-hook 'c-mode-hook 'lsp)
(add-hook 'c++-mode-hook 'lsp)

(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      treemacs-space-between-root-nodes nil
      company-idle-delay 0.0
      company-minimum-prefix-length 1
      lsp-idle-delay 0.01)  ;; clangd is fast

(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)
  (require 'dap-cpptools)
  (yas-global-mode))

(defun code-compile ()
  (interactive)
  (unless (file-exists-p "Makefile")
    (set (make-local-variable 'compile-command)
	 (let ((file (file-name-nondirectory buffer-file-name)))
	   (format "%s -std=c++17 -g -o %s %s"
		   (if  (equal (file-name-extension file) "cpp") "g++" "gcc" )
		   (file-name-sans-extension file)
		   file)))
    (compile compile-command)))

(global-set-key [f9] 'code-compile)
(defun astyle-this-buffer (pmin pmax)
  (interactive "r")
  (shell-command-on-region pmin pmax
                           "astyle" ;; add options here...
                           (current-buffer) t
			   (get-buffer-create "*Astyle Errors*") t))

;;; rust config
(require 'rust-mode)
(with-eval-after-load 'rust-mode
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

(add-hook 'rust-mode-hook
          (lambda () (setq indent-tabs-mode nil)))
(setq rust-format-on-save t)

(define-key rust-mode-map (kbd "C-c C-c") 'rust-run)

(use-package exec-path-from-shell
  :ensure
  :init (exec-path-from-shell-initialize))

(use-package dap-mode
  :ensure
  :config
  (dap-ui-mode)
  (require 'dap-lldb)
  (require 'dap-gdb-lldb)
  ;; installs .extension/vscode
  (dap-gdb-lldb-setup)
  (dap-register-debug-template "Rust::LLDB Run Configuration"
                               (list :type "lldb"
                                     :request "launch"
                                     :name "LLDB::Run"
				     :gdbpath "rust-lldb"
                                     :target "${workspaceFolder}/target/debug/${workspaceFolderBasename}"
                                     :cwd "${workspaceFolder}"))
  (dap-register-debug-template "Rust::GDB Run Configuration"
                               (list :type "gdb"
                                     :request "launch"
                                     :name "GDB::Run"
				     :gdbpath "rust-gdb"
                                     :target "${workspaceFolder}/target/debug/${workspaceFolderBasename}"
                                     :cwd "${workspaceFolder}")))

;;; lsp config rust
(add-hook 'rust-mode-hook 'lsp)

(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      treemacs-space-between-root-nodes nil
      company-idle-delay 0.0
      company-minimum-prefix-length 1
      lsp-idle-delay 0.1)
(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)
  (require 'dap-gdb-lldb)
  (yas-global-mode))


;;; lsp config java
(require 'lsp-java)
(add-hook 'java-mode-hook #'lsp)
(condition-case nil
    (require 'use-package)
  (file-error
   (require 'package)
   (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
   (package-initialize)
   (package-refresh-contents)
   (package-install 'use-package)
   (setq use-package-always-ensure t)
   (require 'use-package)))

(use-package projectile)
(use-package flycheck)
(use-package yasnippet :config (yas-global-mode))
(use-package lsp-mode :hook ((lsp-mode . lsp-enable-which-key-integration))
  :config (setq lsp-completion-enable-additional-text-edit nil))
(use-package hydra)
(use-package company)
(use-package lsp-ui)
(use-package which-key :config (which-key-mode))
(use-package lsp-java :config (add-hook 'java-mode-hook 'lsp))
(use-package dap-mode :after lsp-mode :config (dap-auto-configure-mode))
(use-package dap-java :ensure nil)
(use-package helm-lsp)
(use-package helm
  :config (helm-mode))
(use-package lsp-treemacs)
(require 'lsp-java-boot)

;;; To Enable Key Mapping On Lsp-Ui
(define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
(define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)

;;; to enable the lenses
(add-hook 'lsp-mode-hook #'lsp-lens-mode)
(add-hook 'java-mode-hook #'lsp-java-boot-lens-mode)



;;; global key mapping
(global-set-key (kbd "<S-return>") (kbd "C-e C-m"))
(global-set-key (kbd "s-.") 'lsp-ui-sideline-apply-code-actions)

(setq mac-right-command-modifier 'super)
(setq mac-option-modifier 'super)

(require 'multiple-cursors)

(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
