;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
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
     github
     ;;; langs
       python
       scala
       typescript
       purescript
       haskell
     ranger
     spell-checking (spell-checking :variables spell-checking-enable-by-default nil)
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
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
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
   ;; `recents' `bookmarks' `projects' `agenda' `todos'.
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
   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands.
   dotspacemacs-auto-generate-layout-names nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
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
   dotspacemacs-highlight-delimiters nil
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
   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   dotspacemacs-frame-title-format "%I@%S"
   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'trailing
   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil
   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  (setq-default theming-modifications
   '((darktooth
      ;; default
      (default :foreground "white" :background "black")
      ;; comments
      (font-lock-comment-face :foreground "grey50")
      (font-lock-doc-face :foreground "grey66")
      (link :foreground "grey66")
      ;; keywords
      (font-lock-keyword-face :foreground "#ca7dd4")
      ;; strings
      (font-lock-string-face :foreground "#87d47d")
      ;; variables
      (font-lock-function-name-face :foreground "#52cbff")
      (font-lock-variable-name-face :foreground "#52cbff")
      ;; builtins
      (font-lock-builtin-face :foreground "#ffa352")
      (font-lock-type-face :foreground "#ffa352")
      (font-lock-constant-face :foreground "#ffa352")
      (highlight-numbers-number :foreground "#ffa352")
      ;; modes
      (hl-line :background "black" :weight bold)
      (avy-lead-face :foreground "white")
      (avy-lead-face-0 :foreground "white")
      (avy-lead-face-1 :foreground "white")
      (avy-lead-face-2 :foreground "white")
      (magit-section-highlight :background "black")
      ))
   )
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  (require 'avy)
  (require 'magit)
  ;; Interim
  (defvar xged/goto-j-fp)
  (defvar xged/goto-f-fp)
  (defvar xged/goto-k-fp)
  (load-file "/home/xged/src/config/spacemacs/interim.el")

  ;;; Functions
  (defun defkeyevil-n (key def) (define-key evil-normal-state-map (kbd key) def))  ; xged/define-key-evil-n
  (defun defkeyevil-m (key def) (define-key evil-motion-state-map (kbd key) def))
  (defun defkeyevil-v (key def) (define-key evil-visual-state-map (kbd key) def))
  (defun defkeyevil-i (key def) (define-key evil-insert-state-map (kbd key) def))
  (defun defkeyevil-nm (key def)
    (defkeyevil-n key def)
    (defkeyevil-m key def))
  (defun defkeyevil-nv (key def)
    (defkeyevil-n key def)
    (defkeyevil-v key def))
  (defun defkeyevil-nmv (key def)
    (defkeyevil-n key def)
    (defkeyevil-m key def)
    (defkeyevil-v key def))
  (defun xged/current-local-map-symbol () (catch 'gotit (mapatoms (lambda (sym) (and
    (boundp sym) (eq (symbol-value sym) (current-local-map)) (not (eq sym '(current-local-map))) (throw 'gotit sym))))))

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
  (defun xged/goto-j () (interactive) (find-file xged/goto-j-fp))
  (defun xged/goto-f () (interactive) (find-file xged/goto-f-fp))
  (defun xged/goto-k () (interactive) (find-file xged/goto-k-fp))
  (defun xged/forward-paragraph () (interactive) (evil-a-paragraph) (back-to-indentation))
  (defun xged/backward-paragraph () (interactive) (previous-line) (backward-paragraph) (next-line) (back-to-indentation))
  (defun xged/paste () (interactive) (if (eq (evil-visual-type) 'line) (spacemacs/evil-mc-paste-after) (spacemacs/evil-mc-paste-before)))
  (defun xged/paste-primary-selection () (interactive) (kill-new (gui-get-primary-selection)) (xged/paste))
  (defun xged/insert-line-below () (interactive) (spacemacs/evil-insert-line-below 1) (evil-next-line))
  (defun xged/insert-line-above () (interactive) (spacemacs/evil-insert-line-above 1) (evil-previous-line))
  (defun xged/window-next () (interactive) (other-window 1) (scroll-right))
  (defun xged/goto-word-0-line-and-below (arg) (interactive "P")
         (avy-with avy-goto-word-0 (avy-goto-word-0 arg (line-beginning-position) (window-end (selected-window) t))))
  (defun xged/term-send-ret () (interactive) (term-send-raw-string "\n"))

  ;;; Key Bindings
  (defkeyevil-nmv "SPC" nil)
  (defkeyevil-nmv "m" nil)
  (defkeyevil-n "mm" 'magit-status)
  (defkeyevil-nv "mj" 'git-gutter+-next-hunk)
  (defkeyevil-nv "mk" 'git-gutter+-previous-hunk)
  (defkeyevil-n "mh" 'git-gutter+-show-hunk-inline-at-point)
  (defkeyevil-n "mH" 'git-gutter+-show-hunk)
  (defkeyevil-nv "ms" 'git-gutter+-stage-hunks)
  (defkeyevil-n "mS" 'magit-stage-file)  ; git-gutter+-stage-and-commit-whole-buffer
  (defkeyevil-n "mu" 'git-gutter+-unstage-whole-buffer)
  (defkeyevil-n "md" 'git-gutter+-revert-hunk)
  (defkeyevil-n "mD" 'git-gutter+-revert-hunks)
  (defkeyevil-n "mc" 'magit-commit)
  (defkeyevil-n "me" 'magit-commit-extend)
  (defkeyevil-n "mf" 'magit-commit-instant-fixup)
  (defkeyevil-n "mF" 'magit-commit-instant-squash)
  (defkeyevil-n "mr" 'magit-rebase-continue)
  (defkeyevil-n "mb" 'spacemacs/git-blame-micro-state)
  (defkeyevil-n "ml" 'magit-log-current)
  (defkeyevil-n "mt" 'spacemacs/time-machine-transient-state/body)
  (define-key magit-log-select-mode-map (kbd ",,") 'magit-log-select-pick)
  (define-key magit-log-select-mode-map (kbd ",k") 'magit-log-select-quit)
  (defkeyevil-nmv "c" 'avy-goto-word-or-subword-1)
  (defkeyevil-nm "SPC c" 'ace-link)
  (defkeyevil-v "f" 'er/expand-region)
  (defkeyevil-nm "f" 'evil-visual-char)
  (defkeyevil-v "F" 'er/contract-region)
  (defkeyevil-nv ":" 'xged/paste)
  (defkeyevil-nv "SPC :" 'xged/paste-primary-selection)
  (defkeyevil-n "C-:" 'counsel-yank-pop)
  (defkeyevil-n "p" 'sp-splice-sexp)
  (defkeyevil-v "p" 'evil-surround-region)
  (defkeyevil-nmv "SPC p" 'evil-jump-item)  ;| 'evilmi-jump-items
  (defkeyevil-nmv "a" 'evil-jump-backward)
  (defkeyevil-nmv "A" 'evil-jump-forward)
  (defkeyevil-nmv "C-a" 'goto-last-change)
  (defkeyevil-nmv "C-S-a" 'goto-last-change-reverse)
  (defkeyevil-nm "<escape>" 'spacemacs/alternate-buffer)
  (defkeyevil-nm "d" 'evil-visual-line)
  (defkeyevil-nmv "SPC v" 'evil-visual-block)
  (defkeyevil-nmv "v" 'mark-paragraph)
  (defkeyevil-nmv "e" 'sp-end-of-sexp)
  (defkeyevil-nmv "E" 'sp-beginning-of-sexp)
  (defkeyevil-nmv "w" 'subword-forward)
  (defkeyevil-nmv "W" 'subword-backward)
  (defkeyevil-nv "y" (kbd "i SPC <escape>"))
  (defkeyevil-nmv "SPC w" 'xged/window-next)
  (defkeyevil-v "i" 'evil-change)
  (defkeyevil-n "I" 'evil-append-line)
  (defkeyevil-nv "SPC i" 'evil-invert-char)
  (defkeyevil-nv "SPC I" 'upcase-dwim)
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
  (defkeyevil-v "d" 'evil-delete)
  (defkeyevil-nm "SPC d" 'spacemacs/kill-this-buffer)
  (defkeyevil-nm "SPC D" 'spacemacs/delete-current-buffer-file)
  (defkeyevil-nm "C-d" 'spacemacs/delete-window)
  (defkeyevil-nm "SPC f" 'counsel-find-file)
  (defkeyevil-nm "SPC F" 'counsel-recentf)
  (defkeyevil-nm "C-f" 'spacemacs/show-and-copy-buffer-filename)
  (defkeyevil-nm "C-S-f" 'spacemacs/rename-current-buffer-file )
  (defkeyevil-nmv "SPC h" 'back-to-indentation)
  (defkeyevil-nm "SPC l" 'end-of-line)
  (defkeyevil-v "SPC l" 'evil-last-non-blank)
  (defkeyevil-nmv "C-j" 'xged/forward-paragraph)
  (defkeyevil-nmv "C-k" 'xged/backward-paragraph)
  (defkeyevil-nmv "SPC j" 'xged/forward-paragraph)  ;\ visual line
  (defkeyevil-nmv "SPC k" 'xged/backward-paragraph)  ;\ visual line
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
  (evil-define-key 'normal emacs-lisp-mode-map ",r" 'dotspacemacs/sync-configuration-layers)
  (defkeyevil-nm "q" 'spacemacs/restart-emacs-resume-layouts)
  (defkeyevil-nm "SPC q" 'spacemacs/prompt-kill-emacs)
  (defkeyevil-nm "C-q" 'configuration-layer/update-packages)
  (defkeyevil-nm "x" 'counsel-M-x)
  (defkeyevil-i "M-a" (kbd "1"))
  (defkeyevil-i "M-s" (kbd "2"))
  (defkeyevil-i "M-d" (kbd "3"))
  (defkeyevil-i "M-f" (kbd "4"))
  (defkeyevil-i "M-g" (kbd "5"))
  (defkeyevil-i "M-h" (kbd "6"))
  (defkeyevil-i "M-j" (kbd "7"))
  (defkeyevil-i "M-k" (kbd "8"))
  (defkeyevil-i "M-l" (kbd "9"))
  (defkeyevil-i "M-:" (kbd "0"))
  (defkeyevil-n "SPC t" 'spacemacs/toggle-truncate-lines)  ;TODO v
  (defkeyevil-n "RET" 'xged/insert-line-below)
  (defkeyevil-v "RET" 'evil-exchange)
  (defkeyevil-n "S-<return>" 'xged/insert-line-above)
  (evil-define-key 'normal term-raw-map (kbd "RET") 'xged/term-send-ret)
  (defkeyevil-n "<" 'evil-shift-left-line)
  (defkeyevil-n ">" 'evil-shift-right-line)
  (defkeyevil-n "C-h SPC" 'ivy-spacemacs-help)

  ;;; Settings
  (setq-default avy-keys (append (list ?j ?f ?k ?d ?l ?s ?: ?a ?m ?c ?h ?g ?, ?x ?i ?r ?o ?e ?p ?w ?. ?z ?q)
                                 (list ?J ?F ?K ?D ?L ?S ?A ?M ?C ?< ?H ?G ?X ?I ?R ?O ?E ?P ?W ?> ?Z ?' ?Q)))
  (setq-default ac-ignore-case nil)  ;!
  (global-centered-cursor-mode)  ;\ needs dotspacemacs/sync-configuration-layers
  (spacemacs/toggle-camel-case-motion-on)  ;!
  (spacemacs/toggle-golden-ratio-on)
  (setq-default evil-escape-key-sequence "fj")
  (setq-default ivy-initial-inputs-alist nil)
  (add-to-list 'spacemacs-indent-sensitive-modes 'elisp-mode)  ;!
  (spacemacs/toggle-display-time-on) (setq-default display-time-24hr-format t)
  (setq-default git-magit-status-fullscreen t)
  (setq-default evil-surround-pairs-alist (cons '(?j "(" . ")") evil-surround-pairs-alist))
  (setq-default evil-surround-pairs-alist (cons '(?f "[" . "]") evil-surround-pairs-alist))
  (setq-default evil-surround-pairs-alist (cons '(?k "{" . "}") evil-surround-pairs-alist))
  (setq-default evil-surround-pairs-alist (cons '(?d "<" . ">") evil-surround-pairs-alist))
  (setq-default avy-case-fold-search t)
  (setq-default word-wrap t)
  (setq-default evil-ex-search-highlight-all nil)
  (setq-default evil-normal-state-cursor "white")
  (setq-default expand-region-fast-keys-enabled nil)
  (setq-default evil-move-beyond-eol t)
  (setq-default truncate-lines t)

  ;; Hooks
  (defadvice xged/goto-j (before other-window-now activate) (when buffer-file-name (save-buffer)))
  (defadvice xged/goto-f (before other-window-now activate) (when buffer-file-name (save-buffer)))
  (defadvice xged/goto-k (before other-window-now activate) (when buffer-file-name (save-buffer)))
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

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
