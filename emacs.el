(setq inhibit-default-init t)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

(define-key global-map (kbd "RET") 'reindent-then-newline-and-indent)

(custom-set-faces
 '(flymake-errline ((((class color)) (:background "#5F0000"))))
 '(flymake-warnline ((((class color)) (:background "SkyBlue3")))))

(require 'color-theme)
(color-theme-initialize)

;(add-to-list 'load-path "~/.emacs.d/color-themes")
;(load-file "~/.emacs.d/color-theme-railscasts/color-theme-railscasts.el")
;(color-theme-railscasts)

;(add-to-list 'load-path "~/.emacs.d/color-theme-solarized")
;(require 'color-theme-solarized)
;(color-theme-solarized-light)

;(load-file "~/.emacs.d/twilight-emacs/color-theme-twilight.el")
;(color-theme-twilight)

(load-file "~/.emacs.d/color-themes/color-theme-tomorrow.el")
(color-theme-tomorrow-night)

(global-hl-line-mode 1)
(set-face-background 'hl-line "grey15")

(add-to-list 'load-path
             "~/.emacs.d/yasnippet")
(require 'yasnippet)
(setq yas/snippet-dirs "~/.emacs.d/yasnippet/snippets")
(yas/initialize)
(yas/load-directory "~/.emacs.d/yasnippets-rails/rails-snippets")
(setq yas/prompt-functions '(yas/ido-prompt))

(require 'ido)
(ido-mode t)

;; Rinari
(add-to-list 'load-path "~/.emacs.d/rinari")
(require 'rinari)

;; RHTML
(add-to-list 'load-path "~/.emacs.d/rhtml")
(require 'rhtml-mode)
(add-hook 'rhtml-mode-hook
          (lambda () (rinari-launch)))

;; Gist
(add-to-list 'load-path "~/.emacs.d/gist.el")
(require 'gist)

;; Flymake :D
(require 'flymake)
(add-hook 'find-file-hook 'flymake-find-file-hook)
(add-to-list 'load-path "~/.emacs.d")
(require 'flymake-cursor)
(global-set-key [f11] 'flymake-goto-prev-error)
(global-set-key [f12] 'flymake-goto-next-error)

; PHP Specific stuff.
(defconst fb-php-style
  '((c-basic-offset . 2)
;    (add-hook 'before-save-hook 'delete-trailing-whitespace)
;    (setq indent-tabs-mode nil)
    (c-offsets-alist . (
;                        (arglist-cont-nonempty . c-lineup-math)
                        (arglist-intro . +)
                        (case-label . +)
                        (arglist-close . c-lineup-close-paren)
                        )))
  "Facebook's PHP Programming style"
)
(c-add-style "fb-php-style" fb-php-style)

(add-hook 'php-mode-hook
          (lambda ()
            (c-set-style "fb-php-style")
            ))

;; Io Language
(add-to-list 'load-path "~/.emacs.d/io-mode")
(require 'io-mode)

(custom-set-variables
 '(column-number-mode t))

(fset 'perl-mode 'cperl-mode)
(setq cperl-indent-level 2
      cperl-close-paren-offset -2
      cperl-continued-statement-offset 2
      cperl-indent-parens-as-block t
      cperl-tab-always-indent t)

(require 'sql)
(defalias 'sql-get-login 'ignore)
(put 'upcase-region 'disabled nil)

(add-to-list 'load-path "~/.emacs.d/android-mode")
(require 'android-mode)
;(defcustom android-mode-sdk-dir "~/devel/android_sdk")
;(setq android-mode-sdk-dir "~/devel/android_sdk")

; Fix annoying Control-Z == suspend emacs.
(global-unset-key "\C-z")

; A nice-ety...
(global-set-key (kbd "C-x O") 'previous-multiframe-window)

; Sass CSS.
(add-to-list 'auto-mode-alist '("\\.scss$" . css-mode))

; So we can emacsclient...
(server-start)
(xterm-mouse-mode)

; YAML
(add-to-list 'load-path "~/.emacs.d/yaml-mode")
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

; Disable bars.
(tool-bar-mode -1)
(menu-bar-mode -1)
;(toggle-scroll-bar -1)

; Fix OS X Weirdness with delete key acting as backspace
(global-set-key [kp-delete] 'delete-char)
