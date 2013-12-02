;; ===================================
;; Load .el from ~/.elisp and sub dirs
;; ===================================


;;(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
;;    (let* ((my-lisp-dir "~/.elisp/")
;;          (default-directory my-lisp-dir))
;;       (setq load-path (cons my-lisp-dir load-path))
;;       (normal-top-level-add-subdirs-to-load-path)))

;;(add-to-list 'load-path "~/.elisp/")

;; ============================
;; Key mappings
;; ============================

;; Set up C-x i to move BACKWARDS one window
(global-set-key "\C-xi"
                '(lambda () "Back one window" (interactive) (other-window -1)))

;; Map help to C-?
(keyboard-translate ?\C-h ?\C-?) ;why doesn't this work?

;; goto line function C-c C-g
(global-set-key [ (control c) (control g) ] 'goto-line)

;; use F1 key to go to a man page
(global-set-key [f1] 'man)

;; use F4 key to kill current buffer
(global-set-key [f4] 'kill-this-buffer)

;; use F5 key to evaluate last sexp (C-x C-e)
(global-set-key [f5] 'eval-last-sexp)

;; use F6 to open files in hex mode
(global-set-key [f6] 'hexl-find-file)

;; use F7 to get help (apropos)
;;(global-set-key [f7] 'apropos)
(global-set-key [f7] 'help-command)

;; use C-? to get help-for-help
;;(global-set-key "\C-?" 'help-for-help)

;; use M-? to get help
;;(global-set-key "\M-?" 'help-for-help) ;'help-command)


;; ==============================
;; Manage dot emacs file (.emacs)
;; ==============================

(defun edit-dot-emacs ()
  "Loads the file .emacs"
  (interactive)
  (find-file-other-frame "~/.emacs"))

(defun reload-dot-emacs ()
  "Checks to see if there is a buffer called .emacs, saves it, then
    loads from the .emacs file"
  (interactive)
  (if (bufferp (get-file-buffer '".emacs"))
      (save-buffer (get-buffer '".emacs")))
  (load-file "~/.emacs")
  (message ".emacs reloaded successfully"))

;; use F8 to edit .emacs
(global-set-key [f8] 'edit-dot-emacs)

;; use F9 to 
(global-set-key [f9] 'reload-dot-emacs)


;; ============================
;; Package Archives
;; ============================
(setq package-archives '(
			 ("ELPA" . "http://tromey.com/elpa/")
			 ("gnu" . "http://elpa.gnu.org/packages/")
			 ;;("marmalade" . "http://marmalade-repo.org/packages/")
			 ("melpa" . "http://melpa.milkbox.net/packages/")))

;; ============================
;; Behaviour
;; ============================

;; Turn on Font Lock (contextual coloring) in all modes that support it
(global-font-lock-mode 1)

;; turn off the alarm bell
(setq ring-bell-function 'ignore)

;; Make scripts executable on Save (saves having to do the chmod every time)
(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)

;; Put column number into modeline
(column-number-mode 1)

;; High light the current line the cursor is on
(hl-line-mode 0) ;; need to change line color

;; Stop the blinking cursor (make it solid)
;;(blink-cursor-mode nil)
(if (fboundp 'blink-cursor-mode) (blink-cursor-mode 0))

;; Always show line numbers
(global-linum-mode t)

;; Overwrite selected region with yank or typing
(delete-selection-mode 1)

;; Number of lines to leave for context when scrolling
(setq next-screen-context-lines 10)

;; one line at a time
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) 
    
;; don't accelerate scrolling
;(setq mouse-wheel-progressive-speed nil)

;; Keep cursor in same position while scrolling
;;(setq scroll-error-top-bottom t)

;; ============================
;; X Window only settings
;; ============================
(defun x-only-settings ()
  (interactive)
  
  ;; scrollbar
  (set-scroll-bar-mode 'right)

  ;; disable toolbar
  (tool-bar-mode -1)

  ;; Set the cursor type
  (set-default 'cursor-type 'box)

  ;; solarized
  (load-theme 'solarized-dark t))

;; Make minibuffer larger if there is more to see
;;(autoload 'resize-minibuffer-mode "rsz-minibuf" nil t)
;;(resize-minibuffer-mode)
;;(setq resize-minibuffer-window-exactly nil)

;; ============================
;; Console only settings
;; ============================
(defun console-only-settings () 
  (interactive)
  ;; Scroll wheel and mouse
  ;; but they only work in emacs 21 with these settings
  ;;(require 'xt-mouse)
  ;;(xterm-mouse-mode 1)
  ;;(mouse-wheel-mode 1)

  ;; does this work ?
  ;;(if (load "mwheel" t)
  ;;    (mwheel-install)
  
  ;; Disable the menu bar at the top of the screen
  (menu-bar-mode -1))

;; ============================
;; Load Console/Window settings
;; ============================
(if (null window-system) 
    (add-hook 'term-setup-hook 'console-only-settings) 
  (add-hook 'window-setup-hook 'x-only-settings))

;; ============================
;; Miranda
;; ============================
;;(setq auto-mode-alist (cons '("\\.m\$" . miranda-mode) auto-mode-alist))
;;(setq completion-ignored-extensions (cons ".x" completion-ignored-extensions))

;;(autoload 'miranda-mode "miranda-mode"
;;                        "Major mode for editing Miranda scripts" t nil)
;;(setq miranda-mode-hook
;;      '(lambda ()
;;         (mira-auto-fill-mode 1)))
;;(autoload 'run-mira "miranda-mode" "Run an inferior Miranda session" t nil)
;;(autoload 'mira-man "miranda-mode" "Access on-line Miranda manual" t nil)

;; ============================
;; csoundx
;; ============================
;;(require 'stef-elisp)
;;(add-to-list 'same-window-buffer-names "*Csound Log*") ; open output in same frame

;; ============================
;; mmm-mode
;; ============================
;;(require 'mmm-auto)
;;(setq mmm-global-mode 'maybe)

