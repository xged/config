;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ivy
     auto-completion
     better-defaults
     emacs-lisp
     git
     markdown
     org
     shell (shell :variables shell-default-height 100 shell-default-full-span nil)
     syntax-checking (syntax-checking :variables syntax-checking-enable-by-default nil)
     version-control
     ;;; langs
       python
       github
       scala
       typescript
       purescript
       haskell
     ranger
     spell-checking (spell-checking :variables spell-checking-enable-by-default nil)
     ycmd
     theming
     colors
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '()
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(evil-search-highlight-persist)  ;!
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non-nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(darktooth spacemacs-dark)
   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 17
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "M-SPC"
   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-SPC"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-SPC"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non-nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, `J' and `K' move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non-nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts t
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'original
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non-nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non-nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non-nil the paste micro-state is enabled. When enabled pressing `p'
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state t
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil
   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup t
   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non-nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'trailing
   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil
   truncate-lines t
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  (setq theming-modifications
        '((darktooth
           (default :foreground "grey88" :background "black")
           (font-lock-comment-face :foreground "grey50")
           (font-lock-keyword-face :foreground "#9f9fdf")
           (font-lock-string-face :foreground "#00a8a8")
           (font-lock-function-name-face :foreground "#c2c200") (font-lock-variable-name-face :foreground "#c2c200")
           (font-lock-builtin-face :foreground "#ff8080" :background "#140000") (font-lock-type-face :foreground "#ff8080")
           (font-lock-constant-face :foreground "#9f609f" :weight bold) (highlight-numbers-number :foreground "#9f609f" :weight bold)
           (font-lock-doc-face :foreground "#609f60") (link :foreground "#609f60")
           ;; modes
           (hl-line :background "black" :weight bold)
           (avy-lead-face :foreground "white") (avy-lead-face-0 :foreground "white") (avy-lead-face-1 :foreground "white") (avy-lead-face-2 :foreground "white")
           (magit-section-highlight :background "black")
    )))
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  (require 'avy)

  ;;; Functions
  (defun defkeyevil-nmv (key def)  ; xged/define-key-evil-nmv
    (define-key evil-normal-state-map (kbd key) def)
    (define-key evil-visual-state-map (kbd key) def)
    (define-key evil-motion-state-map (kbd key) def))
  (defun defkeyevil-nm (key def)
    (define-key evil-normal-state-map (kbd key) def)
    (define-key evil-motion-state-map (kbd key) def))
  (defun defkeyevil-nv (key def)
    (define-key evil-normal-state-map (kbd key) def)
    (define-key evil-visual-state-map (kbd key) def))
  (defun defkeyevil-n (key def) (define-key evil-normal-state-map (kbd key) def))
  (defun defkeyevil-m (key def) (define-key evil-motion-state-map (kbd key) def))
  (defun defkeyevil-v (key def) (define-key evil-visual-state-map (kbd key) def))
  (defun xged/current-local-map-symbol () (catch 'gotit (mapatoms (lambda (sym) (and
    (boundp sym) (eq (symbol-value sym) (current-local-map)) (not (eq sym '(current-local-map))) (throw 'gotit sym))))))
  (defun xged/auto-save-on-switch ()
    (defadvice spacemacs/alternate-buffer (before save-buffer-now activate) (when buffer-file-name (save-buffer)))
    (defadvice next-buffer (before other-window-now activate) (when buffer-file-name (save-buffer)))
    (defadvice previous-buffer (before other-window-now activate) (when buffer-file-name (save-buffer)))
    (defadvice ivy-switch-buffer (before other-window-now activate) (when buffer-file-name (save-buffer)))
    (defadvice spacemacs/kill-this-buffer (before other-window-now activate) (when buffer-file-name (save-buffer)))
    (defadvice other-window (before other-window-now activate) (when buffer-file-name (save-buffer)))
    (defadvice magit-status (before other-window-now activate) (when buffer-file-name (projectile-save-project-buffers)))
    (defadvice spacemacs/switch-to-messages-buffer (before other-window-now activate) (when buffer-file-name (save-buffer)))
    (defadvice remember-notes (before other-window-now activate) (when buffer-file-name (save-buffer)))
    (defadvice org-projectile/goto-todos (before other-window-now activate) (when buffer-file-name (save-buffer)))
    (defadvice spacemacs/switch-to-scratch-buffer (before other-window-now activate) (when buffer-file-name (save-buffer)))
    (defadvice spacemacs/default-pop-shell (before other-window-now activate) (when buffer-file-name (save-buffer)))
    (defadvice spacemacs/find-dotfile (before other-window-now activate) (when buffer-file-name (save-buffer)))
    )

  ;;; Commands
  (defun xged/transform-into-foreign-letter-lt () (interactive)
         (cond ((equal (following-char) ?A) (progn (delete-char 1) (insert-char ?Ą) (backward-char)))
               ((equal (following-char) ?C) (progn (delete-char 1) (insert-char ?Č) (backward-char)))
               ((equal (following-char) ?E) (progn (delete-char 1) (insert-char ?Ė) (backward-char)))
               ((equal (following-char) ?Ė) (progn (delete-char 1) (insert-char ?Ę) (backward-char)))
               ((equal (following-char) ?I) (progn (delete-char 1) (insert-char ?Į) (backward-char)))
               ((equal (following-char) ?S) (progn (delete-char 1) (insert-char ?Š) (backward-char)))
               ((equal (following-char) ?U) (progn (delete-char 1) (insert-char ?Ū) (backward-char)))
               ((equal (following-char) ?Ū) (progn (delete-char 1) (insert-char ?Ų) (backward-char)))
               ((equal (following-char) ?Z) (progn (delete-char 1) (insert-char ?Ž) (backward-char)))
               ((equal (following-char) ?a) (progn (delete-char 1) (insert-char ?ą) (backward-char)))
               ((equal (following-char) ?c) (progn (delete-char 1) (insert-char ?č) (backward-char)))
               ((equal (following-char) ?e) (progn (delete-char 1) (insert-char ?ė) (backward-char)))
               ((equal (following-char) ?ė) (progn (delete-char 1) (insert-char ?ę) (backward-char)))
               ((equal (following-char) ?i) (progn (delete-char 1) (insert-char ?į) (backward-char)))
               ((equal (following-char) ?s) (progn (delete-char 1) (insert-char ?š) (backward-char)))
               ((equal (following-char) ?u) (progn (delete-char 1) (insert-char ?ū) (backward-char)))
               ((equal (following-char) ?ū) (progn (delete-char 1) (insert-char ?ų) (backward-char)))
               ((equal (following-char) ?z) (progn (delete-char 1) (insert-char ?ž) (backward-char)))
               )
         )
  (defun xged/forward-paragraph () (interactive) (next-line) (forward-paragraph) (previous-line) (evil-first-non-blank))
  (defun xged/backward-paragraph () (interactive) (previous-line) (backward-paragraph) (next-line) (evil-first-non-blank))
  (defun xged/paste-primary-selection () (interactive) (kill-new (gui-get-primary-selection)) (xged/paste))
  (defun xged/insert-line-below () (interactive) (spacemacs/evil-insert-line-below 1) (evil-next-line))
  (defun xged/insert-line-above () (interactive) (spacemacs/evil-insert-line-above 1) (evil-previous-line))
  (defun xged/window-next () (interactive) (other-window 1) (scroll-right))
  (defun xged/paste () (interactive) (when (not (bolp)) (evil-backward-char)) (spacemacs/evil-mc-paste-after))
  (defun xged/forward-word-mid () (interactive) (evil-forward-end 'word) (evil-forward-char))
  (defun xged/goto-word-0-line-and-below (arg) (interactive "P")
         (avy-with avy-goto-word-0 (avy-goto-word-0 arg (line-beginning-position) (window-end (selected-window) t))))
  (defun xged/term-send-ret () (interactive) (term-send-raw-string "\n"))

  ;;; Key Bindings: prefix
  (defkeyevil-nmv "SPC" nil)
  (defkeyevil-nmv "t" nil)
  ;;; Key Bindings
  (defkeyevil-nmv "c" 'avy-goto-word-or-subword-1)
  ;; (defkeyevil-nmv "c" 'xged/goto-word-0-line-and-below)
  (defkeyevil-nm "C-c" 'ace-link)
  (defkeyevil-nmv "f" 'er/expand-region)
  (defkeyevil-nmv "F" 'er/contract-region)
  (defkeyevil-n ":" 'sp-splice-sexp)
  (defkeyevil-v ":" 'evil-surround-region)
  (defkeyevil-nmv "SPC ;" 'evilmi-jump-items)
  (defkeyevil-nmv "SPC :" 'evil-jump-item)
  (defkeyevil-nmv "a" 'evil-jump-backward)
  (defkeyevil-nmv "A" 'evil-jump-forward)
  (defkeyevil-nmv "C-a" 'goto-last-change)
  (defkeyevil-nmv "C-S-a" 'goto-last-change-reverse)
  (defkeyevil-v "v" 'evil-exchange)
  (defkeyevil-nm "<escape>" 'spacemacs/alternate-buffer)
  (defkeyevil-nm "d" 'evil-visual-line)
  (defkeyevil-v "d" 'evil-delete)
  (defkeyevil-nmv "SPC v" 'mark-paragraph)
  (defkeyevil-nmv "e" 'xged/forward-word-mid)
  (defkeyevil-v "i" 'evil-change)
  (defkeyevil-n "I" 'evil-append-line)
  (defkeyevil-nmv "m" 'magit-status)
  (defkeyevil-nmv "SPC m" 'git-gutter+-revert-hunk)
  (defkeyevil-nmv "SPC M" 'git-gutter+-revert-hunks)
  (defkeyevil-nmv "SPC SPC m" 'spacemacs/git-blame-micro-state)
  (defkeyevil-nmv "w" 'ethio-insert-space)
  (defkeyevil-n "p" 'xged/paste)
  (defkeyevil-v "p" 'spacemacs/evil-mc-paste-after)
  (defkeyevil-nv "SPC p" 'xged/paste-primary-selection)
  (defkeyevil-n "C-p" 'counsel-yank-pop)
  (defkeyevil-nmv "r" 'evil-iedit-state/iedit-mode)
  (defkeyevil-nv "SPC r" 'replace-regexp)
  (defkeyevil-nm "s" 'swiper)
  (evil-define-key '(visual operator) evil-surround-mode-map "s" 'evil-visualstar/begin-search-forward)
  (evil-define-key '(visual operator) evil-surround-mode-map "S" 'spacemacs/swiper-region-or-symbol)  ;\
  (defkeyevil-nm "SPC s" 'counsel-imenu)
  (defkeyevil-nm "\"" 'spacemacs/comment-or-uncomment-lines)
  (defkeyevil-v "u" 'undo)  ;\
  (defkeyevil-nv "U" 'undo-tree-redo)
  (defkeyevil-v "y" 'evil-yank)
  (defkeyevil-nm "C-y" 'ace-swap-window)
  (defkeyevil-nm "SPC d" 'spacemacs/kill-this-buffer)
  (defkeyevil-nm "SPC D" 'spacemacs/delete-current-buffer-file)
  (defkeyevil-nm "C-d" 'spacemacs/delete-window)
  (defkeyevil-nm "SPC f" 'counsel-find-file)
  (defkeyevil-nm "SPC F" 'counsel-recentf)
  (defkeyevil-nm "C-f" 'spacemacs/show-and-copy-buffer-filename)
  (defkeyevil-nm "C-S-f" 'spacemacs/rename-current-buffer-file )
  (defkeyevil-nv "SPC c" 'evil-invert-char)
  (defkeyevil-nv "SPC C" 'upcase-dwim)
  (defkeyevil-nmv "SPC h" 'evil-first-non-blank)
  (defkeyevil-nm "SPC l" 'end-of-line)
  (defkeyevil-v "SPC l" 'evil-last-non-blank)
  (defkeyevil-nmv "SPC j" 'xged/forward-paragraph)  ;\ visual line
  (defkeyevil-nmv "SPC k" 'xged/backward-paragraph)
  (defkeyevil-nmv "C-j" 'evil-scroll-page-down)
  (defkeyevil-nmv "C-k" 'evil-scroll-page-up)
  (defkeyevil-nm "b" 'ivy-switch-buffer)
  (defkeyevil-nm "SPC b" 'previous-buffer)
  (defkeyevil-nm "SPC B" 'next-buffer)
  (defkeyevil-nm "gs" 'spacemacs/default-pop-shell)
  (defkeyevil-nm "gS" 'spacemacs/switch-to-scratch-buffer)
  (defkeyevil-nm "gt" 'org-projectile/goto-todos)
  (defkeyevil-nm "gn" 'remember-notes)
  (defkeyevil-nm "gm" 'spacemacs/switch-to-messages-buffer)
  (defkeyevil-nm "ge" 'spacemacs/find-dotfile)
  (defkeyevil-nm "gj" 'xged/goto-j)
  (defkeyevil-nm "gf" 'xged/goto-f)
  (defkeyevil-nm "gk" 'xged/goto-k)
  (defkeyevil-nm "C-h t" 'which-key-show-top-level)
  (evil-define-key 'normal emacs-lisp-mode-map ",r" 'dotspacemacs/sync-configuration-layers)
  (defkeyevil-nm "q" 'xged/window-next)
  (defkeyevil-nm "SPC q" 'spacemacs/restart-emacs-resume-layouts)
  (defkeyevil-nm "SPC Q" 'spacemacs/prompt-kill-emacs)
  (defkeyevil-nm "C-q" 'configuration-layer/update-packages)
  (defkeyevil-nm "x" 'counsel-M-x)
  (defkeyevil-nm "ta" '(lambda () (interactive) (insert "0")))
  (defkeyevil-nm "ts" '(lambda () (interactive) (insert "1")))
  (defkeyevil-nm "td" '(lambda () (interactive) (insert "2")))
  (defkeyevil-nm "tf" '(lambda () (interactive) (insert "3")))
  (defkeyevil-nm "tg" '(lambda () (interactive) (insert "4")))
  (defkeyevil-nm "th" '(lambda () (interactive) (insert "5")))
  (defkeyevil-nm "tj" '(lambda () (interactive) (insert "6")))
  (defkeyevil-nm "tk" '(lambda () (interactive) (insert "7")))
  (defkeyevil-nm "tl" '(lambda () (interactive) (insert "8")))
  (defkeyevil-nm "t:" '(lambda () (interactive) (insert "9")))
  (defkeyevil-n "SPC t" 'spacemacs/toggle-truncate-lines)  ;TODO v
  (defkeyevil-n "RET" 'xged/insert-line-below)
  (defkeyevil-n "S-<return>" 'xged/insert-line-above)
  (evil-define-key 'normal term-raw-map (kbd "RET") 'xged/term-send-ret)

  ;;; Settings
  (setq-default ac-ignore-case nil)  ;!
  (setq-default evil-move-cursor-back nil)
  (setq-default scroll-conservatively 101 scroll-margin 16 scroll-preserve-screen-position 't)
  (spacemacs/toggle-camel-case-motion-on)  ;!
  (spacemacs/toggle-golden-ratio-on)
  (setq-default fringe-indicator-alist (assq-delete-all 'truncation fringe-indicator-alist))
  (setq-default evil-escape-key-sequence "fj")
  (setq-default ivy-initial-inputs-alist nil)
  (add-to-list 'spacemacs-indent-sensitive-modes 'elisp-mode)  ;!
  (xged/auto-save-on-switch)
  (spacemacs/toggle-display-time-on) (setq-default display-time-24hr-format t)
  (setq-default git-magit-status-fullscreen t)
  (setq-default evil-normal-state-cursor "#b2b2b2")
  (setq-default evil-surround-pairs-alist (cons '(?j "(" . ")") evil-surround-pairs-alist))
  (setq-default evil-surround-pairs-alist (cons '(?f "[" . "]") evil-surround-pairs-alist))
  (setq-default evil-surround-pairs-alist (cons '(?k "{" . "}") evil-surround-pairs-alist))
  (setq-default evil-surround-pairs-alist (cons '(?d "<" . ">") evil-surround-pairs-alist))
  (setq-default expand-region-reset-fast-key nil)  ;! needs sync-configuration
  (setq-default avy-keys (append (list ?j ?f ?k ?d ?l ?s ?: ?a ?m ?c ?h ?g ?, ?x ?i ?r ?o ?e ?p ?w ?. ?z ?q)
                                 (list ?J ?F ?K ?D ?L ?S ?A ?M ?C ?< ?H ?G ?X ?I ?R ?O ?E ?P ?W ?> ?Z ?' ?Q)))
  (setq-default avy-case-fold-search t)
  ;; (add-hook 'magit-status-sections-hook 'magit-insert-tags-header)

  (load-file "/home/xged/src/config/spacemacs/goto-file-shortcuts.el")
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(avy-all-windows (quote all-frames) t)
 '(avy-background t t)
 '(package-selected-packages
   (quote
    (psc-ide org-brain evil-org let-alist password-generator evil-lion editorconfig dante ghub+ apiwrap ghub browse-at-remote helm intero hlint-refactor hindent haskell-snippets flycheck-haskell company-ghci company-ghc ghc haskell-mode company-cabal cmm-mode tide typescript-mode flycheck-ycmd company-ycmd ycmd request-deferred deferred wgrep smex ivy-purpose ivy-hydra counsel-projectile counsel swiper ivy powerline spinner alert log4e gntp hydra parent-mode window-purpose imenu-list request gitignore-mode fringe-helper git-gutter+ git-gutter gh marshal logito pcache ht pos-tip pkg-info epl flx magit-popup with-editor iedit anzu goto-chg undo-tree highlight diminish bind-map bind-key pythonic f dash s avy async auto-complete popup geeknote meghanada groovy-mode groovy-imports gradle-mode sbt-mode scala-mode company-emacs-eclim eclim packed anaconda-mode smartparens evil flycheck yasnippet company helm-core markdown-mode projectile magit git-commit ranger zenburn-theme yapfify xterm-color ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package unfill toc-org spaceline solarized-theme smeargle shell-pop restart-emacs rainbow-delimiters pyvenv pytest pyenv-mode py-isort popwin pip-requirements persp-mode pcre2el paradox orgit org-projectile org-present org-pomodoro org-plus-contrib org-download org-bullets open-junk-file noflet neotree mwim multi-term move-text monokai-theme mmm-mode markdown-toc magithub magit-gitflow magit-gh-pulls macrostep lorem-ipsum live-py-mode linum-relative link-hint info+ indent-guide hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-pydoc helm-purpose helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gnuplot github-search github-clone github-browse-file gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gist gh-md fuzzy flycheck-pos-tip flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu eshell-z eshell-prompt-extras esh-help ensime elisp-slime-nav dumb-jump diff-hl define-word cython-mode company-statistics company-anaconda column-enforce-mode clean-aindent-mode auto-yasnippet auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(avy-lead-face ((t (:background "#293239" :foreground "#b2b2b2")))))
)
