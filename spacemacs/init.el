;; -*- mode: emacs-lisp; lexical-binding: t -*-
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
     ivy (ivy :variables ivy-initial-inputs-alist nil)
     auto-completion
     ;; better-defaults
     emacs-lisp
     git
     markdown
     multiple-cursors
     treemacs
     org
     shell (shell :variables shell-default-height 100 shell-default-full-span nil)
     spell-checking (spell-checking :variables spell-checking-enable-by-default nil)
     syntax-checking
     version-control

     ;; langs
     python
     typescript
     haskell
     java (java :variables eclim-eclipse-dirs '("~/.eclipse") eclim-executable "~.eclipse/eclim")
     yaml

     github
     ranger
     colors
     html
     )

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   ;; To use a local version of a package, use the `:location' property:
   ;; '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
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
   ;; If non-nil then enable support for the portable dumper. You'll need
   ;; to compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; File path pointing to emacs 27.1 executable compiled with support
   ;; for the portable dumper (this is currently the branch pdumper).
   ;; (default "emacs-27.0.50")
   dotspacemacs-emacs-pdumper-executable-file "emacs-27.0.50"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=~/.emacs.d/.cache/dumps/spacemacs.pdmp
   ;; (default spacemacs.pdmp)
   dotspacemacs-emacs-dumper-dump-file "spacemacs.pdmp"

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default nil)
   dotspacemacs-verify-spacelpa-archives nil

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

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

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(darktooth spacemacs-dark)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 17
                               :weight normal
                               :width normal)

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "C-SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts t
   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location nil

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil

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

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
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

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server nil

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

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
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )

(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."

  (require 'avy)
  (require 'magit)
  (require 'evil-surround)
  (require 'git-gutter+)
  (require 'highlight-numbers)
  (require 'rainbow-delimiters)

  ;; Functions
  (defun xged/kb-n (key def) (define-key evil-normal-state-map (kbd key) def))
  (defun xged/kb-m (key def) (define-key evil-motion-state-map (kbd key) def))
  (defun xged/kb-v (key def) (define-key evil-visual-state-map (kbd key) def))
  (defun xged/kb-i (key def) (define-key evil-insert-state-map (kbd key) def))
  (defun xged/kb-nm (key def) (xged/kb-n key def) (xged/kb-m key def))
  (defun xged/kb-nv (key def) (xged/kb-n key def) (xged/kb-v key def))
  (defun xged/kb-nmv (key def) (xged/kb-n key def) (xged/kb-m key def) (xged/kb-v key def))

  ;; Commands
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
  (defun xged/forward-paragraph () (interactive) (evil-a-paragraph) (back-to-indentation))
  (defun xged/backward-paragraph () (interactive) (previous-line) (backward-paragraph) (next-line) (back-to-indentation))
  (defun xged/insert-line-below () (interactive) (spacemacs/evil-insert-line-below 1) (evil-next-line))
  (defun xged/insert-line-above () (interactive) (spacemacs/evil-insert-line-above 1) (evil-previous-line))
  (defun xged/window-next () (interactive) (other-window 1) (scroll-right))
  (defun xged/goto-word-0-line-and-below (arg) (interactive "P")
         (avy-with avy-goto-word-0 (avy-goto-word-0 arg (line-beginning-position) (window-end (selected-window) t))))
  (defun xged/term-send-ret () (interactive) (term-send-raw-string "\n"))
  (defun xged/save-buffer () (interactive) (if (and (buffer-file-name) (buffer-modified-p)) (save-buffer)))
  (defun xged/paste () (interactive) (if (eq (evil-visual-type) 'line) (evil-paste-after 1) (evil-paste-before 1)))

  ;; Key Bindings
  (xged/kb-nmv "SPC" nil)
  (xged/kb-nmv "m" nil)
  (xged/kb-v "i" 'evil-change) (xged/kb-n "I" 'evil-append-line)

  ;; Key Bindings: Select
  (xged/kb-nv "f" 'er/expand-region) (xged/kb-v "F" 'er/contract-region)
  (xged/kb-nm "d" 'evil-visual-line)
  (xged/kb-nmv "SPC v" 'mark-paragraph)

  ;; Key Bindings: Navigate
  (xged/kb-nmv "c" 'avy-goto-word-1)
  (xged/kb-nmv "a" 'evil-jump-backward) (xged/kb-nmv "A" 'evil-jump-forward)
  (xged/kb-nmv "SPC a" 'goto-last-change)
  (xged/kb-nmv "e" 'subword-forward) (xged/kb-nmv "E" 'subword-backward)
  (xged/kb-nmv "w" 'evil-jump-item) (xged/kb-nmv "W" 'evil-jump-out-args)
  (xged/kb-nmv "SPC h" 'back-to-indentation) (xged/kb-nm "SPC l" 'end-of-line) (xged/kb-v "SPC l" 'evil-last-non-blank)
  (xged/kb-nmv "C-j" 'xged/forward-paragraph) (xged/kb-nmv "C-k" 'xged/backward-paragraph)

  ;; Key Bindings: Manage
  (xged/kb-nm "<escape>" 'spacemacs/alternate-buffer)
  (xged/kb-nm "SPC d" 'kill-this-buffer)
  (xged/kb-nm "SPC D" 'spacemacs/delete-current-buffer-file)
  (xged/kb-nmv "SPC w" 'xged/window-next)
  (xged/kb-nm "C-d" 'delete-other-windows)  ;\
  (xged/kb-nm "C-D" 'delete-window)
  (xged/kb-nm "SPC f" 'counsel-find-file)
  (xged/kb-nm "C-f" 'spacemacs/rename-current-buffer-file)
  (xged/kb-nm "b" 'ivy-switch-buffer)
  (xged/kb-nm "q" 'previous-buffer) (xged/kb-nm "Q" 'next-buffer)
  (xged/kb-nm "SPC q" 'save-buffers-kill-emacs)
  (xged/kb-nm "C-q" 'spacemacs/restart-emacs-resume-layouts)
  ;; Key Bindings: Manage: goto
  (xged/kb-nm "gs" 'spacemacs/default-pop-shell)
  (xged/kb-nm "gS" 'spacemacs/switch-to-scratch-buffer)
  (xged/kb-nm "gn" (lambda () (interactive) (find-file "/home/xged/src/config/Notes.yaml")))
  (xged/kb-nm "gm" 'spacemacs/switch-to-messages-buffer)
  (xged/kb-nm "ge" 'spacemacs/find-dotfile)
  ;; Key Bindings: Manage: Git
  (xged/kb-n "mm" 'magit-status)
  (xged/kb-nv "mj" 'git-gutter+-next-hunk) (xged/kb-nv "mk" 'git-gutter+-previous-hunk)
  (xged/kb-n "mh" 'git-gutter+-show-hunk-inline-at-point)
  (xged/kb-n "mH" 'git-gutter+-show-hunk)
  (xged/kb-nv "ms" 'git-gutter+-stage-hunks)
  (xged/kb-n "mS" 'magit-stage-file)
  (xged/kb-n "mu" 'git-gutter+-unstage-whole-buffer)
  (xged/kb-n "md" 'git-gutter+-revert-hunk)
  (xged/kb-n "mc" 'magit-commit-create)
  (xged/kb-n "mf" 'magit-commit-fixup)
  (xged/kb-n "mr" 'magit-commit-instant-fixup)  ; rebase
  (xged/kb-n "mR" 'magit-commit-extend)
  (xged/kb-n "mb" 'spacemacs/git-blame-micro-state)
  (xged/kb-n "mt" 'spacemacs/time-machine-transient-state/body)
  (xged/kb-n "ml" 'magit-log-current)
  (define-key magit-log-select-mode-map (kbd ",,") 'magit-log-select-pick)
  (define-key magit-log-select-mode-map (kbd ",k") 'magit-log-select-quit)

  ;; Key Bindings: Insert
  (xged/kb-nv ":" 'xged/paste)
  (xged/kb-nv "SPC :" 'counsel-yank-pop)
  (xged/kb-nv "C-:" (lambda () (interactive) (kill-new (gui-get-primary-selection)) (xged/paste)))
  (xged/kb-v "y" 'evil-yank)
  (xged/kb-n "y" (kbd "i SPC <escape>"))
  (xged/kb-nm "\"" 'spacemacs/comment-or-uncomment-lines)
  (xged/kb-v "u" 'undo) (xged/kb-nv "U" 'undo-tree-redo)
  (xged/kb-v "d" 'evil-delete)
  (xged/kb-nm "<backspace>" 'evil-delete-char)
  (xged/kb-i "M-a" (kbd "1")) (xged/kb-i "M-s" (kbd "2")) (xged/kb-i "M-d" (kbd "3")) (xged/kb-i "M-f" (kbd "4")) (xged/kb-i "M-g" (kbd "5")) (xged/kb-i "M-h" (kbd "6")) (xged/kb-i "M-j" (kbd "7")) (xged/kb-i "M-k" (kbd "8")) (xged/kb-i "M-l" (kbd "9")) (xged/kb-i "M-:" (kbd "0"))
  (xged/kb-n "SPC t" 'spacemacs/toggle-truncate-lines)  ;TODO v
  (xged/kb-n "RET" 'xged/insert-line-below) (xged/kb-n "S-<return>" 'xged/insert-line-above)
  (xged/kb-v "x" 'evil-exchange)
  (xged/kb-n "<" 'evil-shift-left-line) (xged/kb-n ">" 'evil-shift-right-line)
  (xged/kb-nv "t" 'spacemacs/duplicate-line-or-region)
  (evil-define-key 'normal term-raw-map (kbd "RET") 'xged/term-send-ret)

  ;; Key Bindings: Transform
  (xged/kb-n "p" 'sp-splice-sexp) (xged/kb-v "p" 'evil-surround-region)
  (xged/kb-nv "SPC c" 'evil-invert-char)
  (xged/kb-nv "SPC C" 'upcase-dwim)
  (xged/kb-nmv "r" 'evil-iedit-state/iedit-mode)
  (xged/kb-nv "SPC r" 'replace-regexp)
  (evil-define-key 'normal emacs-lisp-mode-map ",r" 'dotspacemacs/sync-configuration-layers)
  (evil-define-key 'normal emacs-lisp-mode-map ",i" 'spacemacs/ediff-dotfile-and-template)

  ;; Key Bindings: Find
  (xged/kb-nm "s" 'swiper)
  (evil-define-key 'visual evil-surround-mode-map "s" 'spacemacs/swiper-region-or-symbol)
  (xged/kb-v "n" 'evil-visualstar/begin-search-forward)
  (xged/kb-nm "SPC s" 'counsel-imenu)  ;| spacemacs/counsel-jump-in-buffer
  (xged/kb-nm "SPC SPC" 'counsel-M-x)
  (xged/kb-nmv "z f" 'describe-function)
  (xged/kb-nmv "z v" 'describe-variable)
  (xged/kb-nmv "z k" 'describe-key)
  (xged/kb-nmv "z b" 'describe-bindings)
  (xged/kb-nmv "z l" 'ivy-spacemacs-help)  ; layers and packages
  (xged/kb-nmv "z m" 'describe-mode)  ; active modes
  (xged/kb-nmv "z c" 'where-is)  ; describe command
  (xged/kb-nmv "z s" 'apropos-command)  ; symbols

  ;; Settings: Variables
  (setq-default
   avy-keys '(?j ?f ?k ?d ?l ?s ?: ?a ?m ?c ?h ?g ?, ?x ?i ?r ?o ?e ?p ?w ?. ?z ?q ?J ?F ?K ?D ?L ?S ?A ?M ?C ?< ?H ?G ?X ?I ?R ?O ?E ?P ?W ?> ?Z ?' ?Q)
   ac-ignore-case nil  ;!
   evil-escape-key-sequence "fj"
   avy-case-fold-search t
   word-wrap t
   evil-ex-search-highlight-all nil
   expand-region-fast-keys-enabled nil
   evil-move-beyond-eol t
   truncate-lines t
   evil-move-cursor-back nil
   display-time-24hr-format t
   popwin:popup-window-height 100  ;!
   mouse-avoidance-banish-position '((frame-or-window . frame) (side . right) (side-pos . -1) (top-or-bottom . top) (top-or-bottom-pos . -1))
   auto-completion-tab-key-behavior 'complete
   evil-surround-pairs-alist (append '((?j "(" . ")") (?f "[" . "]") (?k "{" . "}") (?d "<" . ">")) evil-surround-pairs-alist)
   )

  ;; Settings: Commands
  (global-centered-cursor-mode)  ;\ term shell
  (spacemacs/toggle-camel-case-motion-globally-on)
  (add-to-list 'spacemacs-indent-sensitive-modes 'elisp-mode)  ;!
  (display-time-mode)
  (mouse-avoidance-mode "banish")

  ;; Settings: Theme
  (defvar xged/face-black  "black")
  (defvar xged/face-grey   "grey50")
  (defvar xged/face-greyl  "grey66")
  (defvar xged/face-white  "white")
  (defvar xged/face-brown  "#ffa852")
  (defvar xged/face-green  "#87d47d")
  (defvar xged/face-blue   "#52d1ff")
  (defvar xged/face-purple "#ca7dd4")
  (setq-default evil-normal-state-cursor "white"
                magit-diff-highlight-hunk-body nil)
  (global-highlight-parentheses-mode 0)  ;\
  (global-hl-line-mode 0)
  (set-face-attribute 'default                      nil :foreground xged/face-white :background xged/face-black)
  (set-face-attribute 'font-lock-builtin-face       nil :foreground xged/face-brown)
  (set-face-attribute 'font-lock-comment-face       nil :foreground xged/face-grey)
  (set-face-attribute 'font-lock-constant-face      nil :foreground xged/face-brown)
  (set-face-attribute 'font-lock-doc-face           nil :foreground xged/face-greyl)
  (set-face-attribute 'font-lock-function-name-face nil :foreground xged/face-blue)
  (set-face-attribute 'font-lock-keyword-face       nil :foreground xged/face-purple)
  (set-face-attribute 'font-lock-string-face        nil :foreground xged/face-green)
  (set-face-attribute 'font-lock-type-face          nil :foreground xged/face-brown)
  (set-face-attribute 'font-lock-variable-name-face nil :foreground xged/face-blue)
  (set-face-attribute 'link                         nil :foreground xged/face-grey)
  (set-face-attribute 'region                       nil :background xged/face-grey)
  (set-face-attribute 'fringe                       nil :background xged/face-black)
  (set-face-attribute 'highlight-numbers-number     nil :foreground xged/face-brown :foreground xged/face-brown)
  ;; Settings: Theme: Modes
  (set-face-attribute 'avy-lead-face                     nil :foreground xged/face-white)
  (set-face-attribute 'avy-lead-face-0                   nil :foreground xged/face-white)
  (set-face-attribute 'avy-lead-face-1                   nil :foreground xged/face-white)
  (set-face-attribute 'avy-lead-face-2                   nil :foreground xged/face-white)
  (set-face-attribute 'git-gutter+-added                 nil :foreground xged/face-green :background xged/face-green)
  (set-face-attribute 'git-gutter+-deleted               nil :foreground xged/face-brown :background xged/face-brown)
  (set-face-attribute 'git-gutter+-modified              nil :foreground xged/face-purple :background xged/face-purple)
  (set-face-attribute 'git-gutter+-unchanged             nil :foreground xged/face-blue :background xged/face-blue)
  (set-face-attribute 'git-gutter+-commit-header-face    nil :foreground xged/face-grey :background xged/face-grey)
  (set-face-attribute 'git-gutter+-separator             nil :foreground xged/face-blue :background xged/face-blue)
  (set-face-attribute 'magit-log-date                    nil :foreground xged/face-brown)
  (set-face-attribute 'magit-section-highlight           nil :background xged/face-black)
  (set-face-attribute 'rainbow-delimiters-depth-1-face   nil :foreground xged/face-grey)
  (set-face-attribute 'rainbow-delimiters-depth-2-face   nil :foreground xged/face-grey)
  (set-face-attribute 'rainbow-delimiters-depth-3-face   nil :foreground xged/face-grey)
  (set-face-attribute 'rainbow-delimiters-depth-4-face   nil :foreground xged/face-grey)
  (set-face-attribute 'rainbow-delimiters-depth-5-face   nil :foreground xged/face-grey)
  (set-face-attribute 'rainbow-delimiters-depth-6-face   nil :foreground xged/face-grey)
  (set-face-attribute 'rainbow-delimiters-depth-7-face   nil :foreground xged/face-grey)
  (set-face-attribute 'rainbow-delimiters-depth-8-face   nil :foreground xged/face-grey)
  (set-face-attribute 'rainbow-delimiters-depth-9-face   nil :foreground xged/face-grey)
  (set-face-attribute 'rainbow-delimiters-unmatched-face nil :foreground xged/face-grey :background xged/face-brown)

  ;; Settings: Fullscreen
  (with-eval-after-load 'window-purpose
    ;; remove bottom split popup
    (setq purpose-special-action-sequences (delete '(pupo/display-condition pupo/display-function) purpose-special-action-sequences))
    ;; make popup reuse current window
    (add-to-list 'purpose-special-action-sequences '(pupo/display-condition display-buffer-same-window
                                                                            display-buffer-use-some-window)))
  (defun always-true (&rest _args) t)
  (setq display-buffer-base-action '(display-buffer-same-window))
  (with-eval-after-load 'window-purpose (add-to-list 'purpose-special-action-sequences
                                                     '(always-true display-buffer-same-window) 'append))

  ;; Hooks
  (add-hook 'evil-normal-state-entry-hook 'xged/save-buffer)
  (defadvice switch-to-buffer (before save-buffer-now activate) (xged/save-buffer))  ; xged/paste triggers this too
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
 '(package-selected-packages
   (quote
    (doom-modeline yasnippet-snippets yapfify xterm-color ws-butler writeroom-mode winum which-key wgrep web-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package treemacs-projectile treemacs-evil toc-org tide tagedit symon string-inflection spaceline-all-the-icons smex smeargle slim-mode shrink-path shell-pop scss-mode sass-mode restart-emacs request ranger rainbow-mode rainbow-identifiers rainbow-delimiters pyvenv pytest pyenv-mode py-isort pug-mode prettier-js popwin pippel pipenv pip-requirements persp-mode pcre2el password-generator paradox overseer orgit org-projectile org-present org-pomodoro org-mime org-download org-bullets org-brain open-junk-file nameless mvn multi-term move-text mmm-mode meghanada maven-test-mode markdown-toc magithub magit-svn magit-gitflow macrostep lorem-ipsum livid-mode live-py-mode link-hint json-navigator json-mode js2-refactor js-doc ivy-yasnippet ivy-xref ivy-purpose ivy-hydra indent-guide importmagic impatient-mode hungry-delete hlint-refactor hl-todo hindent highlight-parentheses highlight-numbers highlight-indentation helm-make haskell-snippets groovy-mode groovy-imports gradle-mode google-translate golden-ratio gnuplot gitignore-templates gitignore-mode github-search github-clone gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gist gh-md fuzzy forge font-lock+ flyspell-correct-ivy flycheck-pos-tip flycheck-haskell flx-ido fill-column-indicator fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-org evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-escape evil-ediff evil-cleverparens evil-args evil-anzu eval-sexp-fu eshell-z eshell-prompt-extras esh-help ensime emmet-mode elisp-slime-nav eldoc-eval editorconfig dumb-jump dotenv-mode diminish diff-hl define-word darktooth-theme cython-mode counsel-projectile counsel-css company-web company-tern company-statistics company-ghci company-emacs-eclim company-cabal company-anaconda column-enforce-mode color-identifiers-mode cmm-mode clean-aindent-mode centered-cursor-mode browse-at-remote auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile aggressive-indent ace-link ac-ispell))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
