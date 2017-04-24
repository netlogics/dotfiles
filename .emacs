(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(custom-enabled-themes (quote (deeper-blue)))
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (rspec-mode evil-tabs evil-leader projectile-rails evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; enable global-evil-leader-mode before you enable evil-mode,
;; otherwise evil-leader won’t be enabled in initial buffers (*scratch*, *Messages*, …).
(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader ",")
(evil-leader/set-key
  "e" 'find-file
  "b" 'switch-to-buffer
  "k" 'kill-buffer
  "m" 'projectile-rails-find-model
  "c" 'projectile-rails-find-controller
  "v" 'projectile-rails-find-view
  "l" 'projectile-rails-find-lib
  "h" 'projectile-rails-find-helper
  "s" 'projectile-rails-find-spec
  "t" 'projectile-rails-find-test
  "n" 'projectile-rails-find-migration
  "j" 'projectile-rails-find-javascript 
  "h" 'projectile-rails-find-stylesheet
  "i" 'projectile-rails-find-initializer
  "a" 'projectile-rails-find-locale
  "@" 'projectile-rails-find-mailer
  "y" 'projectile-rails-find-layout
  "r" 'projectile-rails-find-rake-task
  "o" 'projectile-rails-find-job
  "q" 'projectile-rails-goto-routes
  "g" 'projectile-rails-goto-gemfile
  "E" 'projectile-rails-find-environment
  "C" 'projectile-rails-console
  "S" 'projectile-rails-server
  "R" 'projectile-rails-rake
  "<" 'simpleclip-get-contents
  ">" 'simpleclip-set-contents)

(require 'evil)
(evil-mode 1)

(projectile-rails-global-mode)

(add-to-list 'load-path
              "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(setq yas-snippet-dirs
      '("~/.emacs.d/plugins/yasnippet"))
(yas-global-mode 1)

(add-to-list 'load-path
	     (expand-file-name "~/.emacs.d/plugins/rspec-mode"))
(require 'rspec-mode)
(eval-after-load 'rspec-mode
 '(rspec-install-snippets))
(add-hook 'after-init-hook 'inf-ruby-switch-setup)

(add-to-list 'load-path
	     (expand-file-name "~/.emacs.d/plugins/rbenv.el"))
(require 'rbenv)
(global-rbenv-mode)
