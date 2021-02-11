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
     org
     shell (shell :variables
       shell-default-height 100
       shell-default-full-span nil
       shell-default-shell 'eshell
       shell-enable-smart-eshell t
       eshell-aliases-file "/home/xged/src/config/alias"
       shell-pop-autocd-to-working-dir nil
       )
     spell-checking (spell-checking :variables spell-checking-enable-by-default nil)
     syntax-checking
     version-control

     ;; langs
     python
     typescript
     haskell
     java (java :variables eclim-eclipse-dirs '("~/.eclipse") eclim-executable "~.eclipse/eclim")
     yaml
     c-c++

     github
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
   dotspacemacs-additional-packages '(super-save)

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(highlight-parentheses rainbow-delimiters hl-line)  ;/ hl-line

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

   ;; Name of executable file pointing to emacs 27+. This executable must be
   ;; in your PATH.
   ;; (default "emacs")
   dotspacemacs-emacs-pdumper-executable-file "emacs"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=$HOME/.emacs.d/.cache/dumps/spacemacs-27.1.pdmp
   ;; (default spacemacs-27.1.pdmp)
   dotspacemacs-emacs-dumper-dump-file (format "spacemacs-%s.pdmp" emacs-version)

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

   ;; Set `read-process-output-max' when startup finishes.
   ;; This defines how much data is read from a foreign process.
   ;; Setting this >= 1 MB should increase performance for lsp servers
   ;; in emacs 27.
   ;; (default (* 1024 1024))
   dotspacemacs-read-process-output-max (* 1024 1024)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives t

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

   ;; If non-nil show the version string in the Spacemacs buffer. It will
   ;; appear as (spacemacs version)@(emacs version)
   ;; (default t)
   dotspacemacs-startup-buffer-show-version t

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

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

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

   ;; Default font or prioritized list of fonts.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 18
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
   ;; (default "C-M-m" for terminal mode, "<M-return>" for GUI mode).
   ;; Thus M-RET should work as leader key in both GUI and terminal modes.
   ;; C-M-m also should work in terminal mode, but not in GUI mode.
   dotspacemacs-major-mode-emacs-leader-key (if window-system "<M-return>" "C-M-m")

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

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' in OSX to obtain
   ;; borderless fullscreen. (default nil)
   dotspacemacs-undecorated-at-startup nil

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
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but lines are only visual lines are counted. For example, folded lines
   ;; will not be counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers nil

   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
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
   dotspacemacs-whitespace-cleanup 'trailing

   ;; If non nil activate `clean-aindent-mode' which tries to correct
   ;; virtual indentation of simple modes. This can interfer with mode specific
   ;; indent handling like has been reported for `go-mode'.
   ;; If it does deactivate it here.
   ;; (default t)
   dotspacemacs-use-clean-aindent-mode t

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil

   ;; If nil the home buffer shows the full path of agenda items
   ;; and todos. If non nil only the file name is shown.
   dotspacemacs-home-shorten-agenda-source nil))

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
  (require 'expand-region)
  (require 'evil-escape)
  (require 'em-alias)
  (require 'company)

  ;; Functions
  (defun xged/kb-n (key def) (define-key evil-normal-state-map (kbd key) def))
  (defun xged/kb-m (key def) (define-key evil-motion-state-map (kbd key) def))
  (defun xged/kb-v (key def) (define-key evil-visual-state-map (kbd key) def))
  (defun xged/kb-i (key def) (define-key evil-insert-state-map (kbd key) def))
  (defun xged/kb-M (key def) (define-key magit-mode-map (kbd key) def))
  (defun xged/kb-nm (key def) (xged/kb-n key def) (xged/kb-m key def))
  (defun xged/kb-nv (key def) (xged/kb-n key def) (xged/kb-v key def))
  (defun xged/kb-nmv (key def) (xged/kb-n key def) (xged/kb-m key def) (xged/kb-v key def))

  ;; Commands
  (defun xged/local-map-name () (interactive) (kill-new (symbol-name (catch 'gotit (mapatoms (lambda (sym)
    (and (boundp sym) (eq (symbol-value sym) (current-local-map)) (not (eq sym 'keymap)) (throw 'gotit sym))))))))
  (defun xged/forward-paragraph () (interactive) (next-line) (forward-paragraph) (next-line) (back-to-indentation))
  (defun xged/backward-paragraph () (interactive) (previous-line) (backward-paragraph) (next-line) (back-to-indentation))
  (defun xged/insert-line-below () (interactive) (spacemacs/evil-insert-line-below 1) (evil-next-line))
  (defun xged/insert-line-above () (interactive) (spacemacs/evil-insert-line-above 1) (evil-previous-line))
  (defun xged/window-next () (interactive) (other-window 1) (scroll-right))
  (defun xged/save-buffer () (when (and buffer-file-name (buffer-modified-p (current-buffer)) (file-writable-p buffer-file-name)) (save-buffer)))
  (defun xged/paste-pop (count) (interactive "p")
    (unless evil-last-paste (user-error "Previous paste command used a register"))
    (evil-undo-pop)
    (goto-char (nth 2 evil-last-paste))
    (setq this-command (nth 0 evil-last-paste))
    (let ((kill-ring (list (current-kill (if (and (> count 0) (nth 5 evil-last-paste)) (1+ count) count))))
          (kill-ring-yank-pointer kill-ring))
      (when (eq last-command 'evil-visual-paste) (let ((evil-no-display t)) (evil-visual-restore)))
      (funcall (nth 0 evil-last-paste) (nth 1 evil-last-paste))
      (when (eq last-command 'evil-visual-paste) (setcdr (nthcdr 4 evil-last-paste) nil))))
  (defun xged/paste () (interactive)
    (if (memq last-command '(evil-paste-after evil-paste-before evil-visual-paste xged/paste)) (xged/paste-pop 1)
      (if (eq (evil-visual-type) 'line) (evil-paste-after 1) (evil-paste-before 1))))
  (push "*.\*" spacemacs-useless-buffers-regexp)  ;/
  (push "Notes.yaml" spacemacs-useless-buffers-regexp)  ;/
  (defun xged/revert-buffer () (interactive) (revert-buffer :ignore-auto :noconfirm))
  (defun xged/next () (interactive) (if (memq last-command '(evil-ex-search-next evil-ex-search-previous evil-visualstar/begin-search-forward 'evil-visualstar/begin-search-backward)) (progn (evil-ex-search-next) (setq this-command 'evil-ex-search-next)) (if git-gutter+-diffinfos (git-gutter+-next-hunk 1)(goto-last-change 1))))
  (defun xged/previous () (interactive) (if (memq last-command '(evil-ex-search-next evil-ex-search-previous evil-visualstar/begin-search-forward 'evil-visualstar/begin-search-backward)) (progn (evil-ex-search-previous) (setq this-command 'evil-ex-search-previous)) (if git-gutter+-diffinfos (git-gutter+-next-hunk -1)(goto-last-change -1))))

  ;; Key bindings
  (xged/kb-nmv "SPC" nil)
  (xged/kb-nmv "s" nil)
  (xged/kb-nmv "m" nil)

  ;; Key bindings: Select
  (xged/kb-nmv "f" 'er/expand-region) (xged/kb-v "F" 'er/contract-region)
  (xged/kb-nmv "a" 'evil-visual-line)
  (xged/kb-nm "e" (lambda () (interactive) (evil-visual-char) (forward-char) (forward-word) (backward-char)))  ;$
  (xged/kb-v "e" (lambda () (interactive) (forward-word)))  ;$
  (xged/kb-nmv "x" 'evil-visual-char)
  (xged/kb-nmv "SPC x" 'mark-paragraph)
  (xged/kb-nmv "X" 'evil-visual-block)  ;< C-x
  (xged/kb-nmv "w" 'er/mark-outside-pairs)

  ;; Key bindings: Navigate
  (xged/kb-nmv "RET" 'evil-next-line)
  (xged/kb-nm "d" 'avy-goto-word-1)
  (xged/kb-nmv "C-<return>" 'xged/forward-paragraph) (xged/kb-nmv "C-k" 'xged/backward-paragraph)
  (xged/kb-nmv "c" (lambda () (interactive) (swiper) (setq this-command 'evil-ex-search-next)))
  (xged/kb-nmv "SPC c" (lambda () (interactive) (swiper-all) (setq this-command 'evil-ex-search-next)))
  (xged/kb-nm "n" 'xged/next) (xged/kb-nm "N" 'xged/previous)
  (xged/kb-nmv "SPC n" 'evil-ex-search-next) (xged/kb-nmv "SPC N" 'evil-ex-search-previous)
  (xged/kb-v "n" 'evil-visualstar/begin-search-forward) (xged/kb-v "N" 'evil-visualstar/begin-search-backward)
  (xged/kb-nmv "SPC RET" 'flycheck-next-error) (xged/kb-nmv "SPC k" 'flycheck-previous-error)

  ;; Key bindings: Manage (Project)
  (xged/kb-nmv "<escape>" 'spacemacs/alternate-buffer) (advice-add 'spacemacs/alternate-buffer :before #'xged/save-buffer)
  (xged/kb-nmv "b" 'ivy-switch-buffer)
  (xged/kb-nmv "q" 'next-buffer) (xged/kb-nmv "Q" 'previous-buffer)
  (xged/kb-nmv "SPC d" 'kill-this-buffer) (advice-add 'kill-this-buffer :before #'xged/save-buffer)
  (xged/kb-nmv "M-d" 'spacemacs/delete-current-buffer-file)
  (xged/kb-nmv "C-d" 'delete-window) (xged/kb-nmv "M-S-D" 'delete-other-windows)
  (xged/kb-nmv "SPC w" 'xged/window-next)
  (xged/kb-nmv "SPC f" 'counsel-find-file)
  (xged/kb-nmv "C-f" 'counsel-locate)
  (xged/kb-nmv "SPC q" 'spacemacs/restart-emacs-resume-layouts) (advice-add 'spacemacs/restart-emacs-resume-layouts :before #'xged/save-buffer)
  (xged/kb-nmv "C-q" 'spacemacs/kill-emacs) (advice-add 'kill-emacs :before #'xged/save-buffer)
  (xged/kb-nm "SPC s" 'save-buffer)

  (xged/kb-nmv "mg" 'evil-goto-first-line)
  (xged/kb-nmv "mG" 'evil-goto-last-line)
  (xged/kb-nmv "mk" 'evil-jump-backward) (xged/kb-nmv "m RET" 'evil-jump-forward)
  (xged/kb-nmv "m." 'goto-last-change)
  (xged/kb-nmv "mh" 'back-to-indentation) (xged/kb-nmv "ml" 'end-of-line) (xged/kb-v "ml" 'evil-last-non-blank)
  (xged/kb-nmv "mx" 'evil-visual-restore)
  (xged/kb-nmv "ms" (lambda () (interactive) (spacemacs/default-pop-shell) (centered-cursor-mode -1) (setq truncate-lines nil)))
  (xged/kb-nmv "mS" 'spacemacs/switch-to-scratch-buffer)
  (xged/kb-nmv "mn" (lambda () (interactive) (find-file "/home/xged/src/private/notes.yaml")))
  (xged/kb-nmv "mz" (lambda () (interactive) (find-file "/home/xged/src/config/zsh/.zshrc")))
  (xged/kb-nmv "mm" 'spacemacs/switch-to-messages-buffer)
  (xged/kb-nmv "me" 'spacemacs/find-dotfile)
  (xged/kb-nmv "mc" 'calculator)
  (xged/kb-nmv "mf" 'describe-function)
  (xged/kb-nmv "mv" 'describe-variable)
  (xged/kb-nmv "mb" 'describe-bindings) (xged/kb-i "C-b" 'describe-bindings)
  (xged/kb-nmv "mL" 'ivy-spacemacs-help-layers)  ; layers
  (xged/kb-nmv "mp" 'ivy-spacemacs-help)  ; packages
  (xged/kb-nmv "md" 'spacemacs/jump-to-definition)
  (bind-key* "M-k" 'describe-key)
  (bind-key* "M-b" 'describe-bindings)
  (bind-key* "M-m" 'xged/local-map-name)

  ;; Key bindings: Edit
  (xged/kb-nm "i" 'evil-insert)  ; default
  (xged/kb-v "i" 'evil-change)
  (xged/kb-i "RET" 'evil-escape)
  (xged/kb-i "TAB" 'newline-and-indent)
  (xged/kb-v "d" 'evil-delete)
  (xged/kb-nmv ":" 'xged/paste)
  (xged/kb-nm "SPC :" 'counsel-yank-pop)
  ;; (xged/kb-v "SPC :" 'counsel-yank-pop)
  (xged/kb-nmv "u" 'evil-undo) (xged/kb-nmv "U" 'evil-redo)
  (xged/kb-nmv "\"" 'spacemacs/comment-or-uncomment-lines)
  (xged/kb-nmv "p" 'sp-splice-sexp)
  (xged/kb-v "p" 'evil-surround-region)
  (xged/kb-nmv "." 'spacemacs/duplicate-line-or-region)
  (xged/kb-nmv "C-." 'evil-repeat)
  (xged/kb-v "x" 'evil-exchange)
  (xged/kb-nmv "y" (lambda () (interactive) (insert " ")))
  ;; (xged/kb-n "y" 'evil-yank-line)
  (xged/kb-nm "<" 'evil-shift-left-line) (xged/kb-nm ">" 'evil-shift-right-line)
  (xged/kb-v "<" 'evil-shift-left) (xged/kb-v ">" 'evil-shift-right)
  (xged/kb-nmv "SPC i" 'evil-invert-char)  ;| upcase-dwim
  (xged/kb-i "C-f" (lambda () (interactive) (insert "()") (backward-char)))
  (xged/kb-i "C-d" (lambda () (interactive) (insert "{}") (backward-char)))
  (xged/kb-nmv "v" 'xged/insert-line-below)
  (xged/kb-nmv "V" 'xged/insert-line-above)
  (xged/kb-nmv "SPC D" 'comment-kill)
  (xged/kb-nmv "j" 'evil-join)

  ;; Key bindings: Magic
  (xged/kb-nmv "SPC SPC" 'counsel-M-x)
  (xged/kb-nmv "S-SPC" 'ivy-resume)
  (xged/kb-nmv "r" 'evil-iedit-state/iedit-mode) ; replace-regexp
  (xged/kb-nmv "SPC r" 'spacemacs/rename-current-buffer-file)
  (xged/kb-nmv "C-r" 'xged/revert-buffer)
  (evil-define-key 'visual evil-surround-mode-map (kbd "s") 'evil-yank)
  (xged/kb-nmv "/" 'spacemacs/toggle-truncate-lines)
  (xged/kb-nmv "M-q" (lambda () (interactive) (configuration-layer/update-packages) (shell-command "git -C ~/.emacs.d pull --rebase") (spacemacs/restart-emacs-resume-layouts)))
  (define-key transient-map evil-escape-key-sequence 'transient-quit-one) (define-key transient-edit-map evil-escape-key-sequence 'transient-quit-one) (define-key transient-sticky-map evil-escape-key-sequence 'transient-quit-seq)
  (xged/kb-nmv "SPC t" (lambda () (interactive) (shell-command "timew summary") (switch-to-buffer "*Shell Command Output*") (text-scale-increase 3) (evil-goto-line)))
  (xged/kb-nmv "t" (lambda () (interactive) (if (string-match-p (regexp-quote "There is no active time tracking.") (shell-command-to-string "timew")) (shell-command "timew start $ :quiet") (shell-command "timew stop :quiet; timew summary") )))

  ;; Key bindings: Magic: Git
  (xged/kb-M "RET" 'evil-next-line)
  (xged/kb-M "C-<return>" 'magit-go-forward) (define-key magit-hunk-section-map (kbd "C-<return>") 'magit-section-forward) (define-key magit-file-section-map (kbd "C-<return>") 'magit-section-forward)
  (xged/kb-M "SPC" 'magit-visit-thing)
  (xged/kb-nm "sn" 'git-gutter+-next-hunk) (xged/kb-nm "sN" 'git-gutter+-previous-hunk)
  (xged/kb-nm "s RET" 'magit-status)
  (xged/kb-nm "sl" 'magit-log-current)
  (xged/kb-nm "sh" 'git-gutter+-show-hunk-inline-at-point)
  (xged/kb-nm "ss" (lambda () (interactive) (git-gutter+-stage-hunks) (git-gutter+-next-hunk 1)))
  (xged/kb-v "SPC s" (lambda () (interactive) (git-gutter+-stage-hunks) (evil-normal-state)))
  (xged/kb-nm "sS" 'magit-stage-file)
  (xged/kb-nm "su" 'git-gutter+-unstage-whole-buffer)
  (xged/kb-nm "sd" 'git-gutter+-revert-hunk)
  (xged/kb-nm "sc" 'magit-commit-create)
  (xged/kb-nm "sf" (lambda () (interactive) (git-gutter+-stage-hunks) (magit-commit-instant-fixup)))
  (xged/kb-nm "sF" (lambda () (interactive) (git-gutter+-stage-hunks) (magit-commit-fixup)))
  (xged/kb-nm "sq" 'magit-abort-dwim)
  (xged/kb-nm "s," 'magit-rebase-continue)
  (xged/kb-nm "se" (lambda () (interactive) (git-gutter+-stage-hunks) (magit-commit-extend)))
  (xged/kb-nm "sz" 'magit-stash-index)
  (xged/kb-nm "sZ" 'magit-stash-worktree)
  (xged/kb-nm "s C-z" (lambda () (interactive) (magit-snapshot-save t t nil t)))  ; save
  (xged/kb-nm "sP" 'magit-stash-pop)
  (xged/kb-nm "sp" (lambda () (interactive) (magit-push-current-to-pushremote "-f")))
  (xged/kb-nm "sb" 'spacemacs/git-blame-transient-state/body)
  (xged/kb-nm "st" 'spacemacs/time-machine-transient-state/body)
  (xged/kb-nm "sr" 'magit-rebase-interactive)

  ;; Key bindings: Mode-specific
  (evil-define-key 'normal emacs-lisp-mode-map (kbd ", RET") 'dotspacemacs/sync-configuration-layers)
  (evil-define-key 'normal emacs-lisp-mode-map (kbd ",i") 'spacemacs/ediff-dotfile-and-template)
  (add-hook 'eshell-mode-hook (lambda () (evil-define-key 'insert eshell-mode-map (kbd "RET") (lambda () (interactive) (evil-normal-state) (eshell-send-input) ))))
  (add-hook 'eshell-mode-hook (lambda () (evil-define-key 'normal eshell-mode-map (kbd "RET") 'eshell-send-input)))
  (add-hook 'eshell-mode-hook (lambda () (evil-define-key 'normal eshell-mode-map (kbd "k") 'eshell-previous-matching-input-from-input)))
  (add-hook 'eshell-mode-hook (lambda () (evil-define-key 'normal eshell-mode-map (kbd "o") 'eshell-next-matching-input-from-input)))
  (add-hook 'eshell-mode-hook (lambda () (evil-define-key 'normal eshell-mode-map (kbd "s") 'eshell-interrupt-process)))
  ;; (evil-define-key 'insert python-mode-map (kbd "\"") (kbd "\'")) (evil-define-key 'insert python-mode-map (kbd "\'") (kbd "\""))
  (evil-define-key 'normal python-mode-map (kbd ", SPC") 'spacemacs/python-shell-send-buffer-switch)
  (define-key ivy-minibuffer-map (kbd "C-<return>") 'ivy-next-line)
  (evil-define-key 'normal magit-log-select-mode-map (kbd "f") 'magit-log-select-pick)
  (evil-define-key 'normal magit-log-select-mode-map (kbd "q") 'magit-log-select-quit)

  ;; Settings
  (setq-default evil-move-cursor-back nil)
  (setq-default evil-move-beyond-eol t)
  (global-centered-cursor-mode)
  (setq-default truncate-lines t)
  (setq-default word-wrap t)
  (setq-default evil-ex-search-highlight-all nil)
  (mouse-avoidance-mode "banish")
  (setq-default mouse-avoidance-banish-position '((frame-or-window . frame) (side . right) (side-pos . -2) (top-or-bottom . top) (top-or-bottom-pos . -2)))
  (spacemacs/toggle-camel-case-motion-globally-on)
  (add-to-list 'spacemacs-indent-sensitive-modes 'emacs-lisp-mode)
  (fset 'evil-visual-update-x-selection 'ignore)
  (setq-default mode-line-format nil)
  (setq-default inhibit-message t)
  (setq-default auto-window-vscroll nil)  ;%
  (set-language-environment 'utf-8) (set-terminal-coding-system 'utf-8) (setq locale-coding-system 'utf-8) (set-default-coding-systems 'utf-8) (set-selection-coding-system 'utf-8) (prefer-coding-system 'utf-8)
  (setq-default undo-tree-enable-undo-in-region t)

  ;; Settings: Modes
  (setq-default avy-keys '(?f ?d ?k ?s ?l ?a ?: ?c ?m ?x ?, ?i ?r ?o ?g ?h ?e ?. ?z ?p ?t ?v ?w ?q ?/ ?b ?y ?j ?\" ?\[ 13))
  (setq-default avy-orders-alist '((avy-goto-word-1 . avy-order-closest) (avy-goto-word-0 . avy-order-closest)))
  (setq-default er/try-expand-list '(er/mark-symbol er/mark-symbol-with-prefix er/mark-next-accessor er/mark-method-call er/mark-inside-quotes er/mark-outside-quotes er/mark-inside-pairs er/mark-outside-pairs er/mark-comment er/mark-url er/mark-email er/mark-defun er/mark-subword))
  (setq-default expand-region-fast-keys-enabled nil)
  (setq-default evil-surround-pairs-alist (append '((?f "(" . ")") (?\r "[" . "]") (?d "{" . "}") (?k "<" . ">")) evil-surround-pairs-alist))
  (setq-default term-char-mode-point-at-process-mark nil)
  (setq-default shell-default-shell 'eshell )
  (setq-default magit-commit-show-diff nil)
  (add-hook 'evil-normal-state-entry-hook 'company-abort)

  ;; Save
  (super-save-mode +1)  ;/ ,r

  ;; Settings: Theme
  (show-smartparens-global-mode -1)
  (global-hl-line-mode -1)
  (setq-default git-gutter-fr+-side 'left-fringe)
  ;; Settings: Theme: Colors
  (defvar xged/color-background "black")
  (defvar xged/color-default    "grey95")
  (defvar xged/color-string     "#9efa9e")
  (defvar xged/color-keyword    "#f877f8")
  (defvar xged/color-name       "#ffc285")
  (defvar xged/color-type       "#70b8ff")
  (defvar xged/color-comment    "grey60")
  (defvar xged/color-docs       "#00cc99")
  (mapc (lambda (mode) (font-lock-add-keywords mode
   '(("\\([][(){}]\\)" 0 'font-lock-type-face)
     ("\\([=:;]\\)" 0 'font-lock-comment-face)
     ("\\([!?.,\\+-<>]\\)" 0 'font-lock-type-face))))
   '(text-mode python-mode))
  (mapc (lambda (mode) (font-lock-add-keywords mode
   '(("\\([][(){}]\\)" 0 'font-lock-comment-face)
     ("\\(['?.]\\)" 0 'font-lock-type-face))))
   '(emacs-lisp-mode))
  (set-face-attribute 'default                      nil :foreground xged/color-default :background xged/color-background)
  (set-face-attribute 'font-lock-builtin-face       nil :foreground xged/color-type)
  (set-face-attribute 'font-lock-comment-face       nil :foreground xged/color-comment)
  (set-face-attribute 'font-lock-constant-face      nil :foreground xged/color-type)
  (set-face-attribute 'font-lock-doc-face           nil :foreground xged/color-docs)
  (set-face-attribute 'font-lock-function-name-face nil :foreground xged/color-name)
  (set-face-attribute 'font-lock-keyword-face       nil :foreground xged/color-keyword)
  (set-face-attribute 'font-lock-string-face        nil :foreground xged/color-string)
  (set-face-attribute 'font-lock-type-face          nil :foreground xged/color-type)
  (set-face-attribute 'font-lock-variable-name-face nil :foreground xged/color-name)
  (set-face-attribute 'font-lock-warning-face       nil :foreground xged/color-keyword :background xged/color-background)
  (set-face-attribute 'link                         nil :foreground xged/color-docs :underline nil)
  (set-face-attribute 'region                       nil :background xged/color-comment)
  (set-face-attribute 'fringe                       nil :background xged/color-background)
  (set-face-attribute 'highlight-numbers-number     nil :foreground xged/color-type)
  ;; Settings: Theme: Colors: Modes
  (setq-default magit-diff-highlight-hunk-body nil)
  (set-face-attribute 'avy-lead-face                  nil :foreground xged/color-default)
  (set-face-attribute 'avy-lead-face-0                nil :foreground xged/color-default)
  (set-face-attribute 'avy-lead-face-1                nil :foreground xged/color-default)
  (set-face-attribute 'avy-lead-face-2                nil :foreground xged/color-default)
  (set-face-attribute 'git-gutter+-added              nil :foreground xged/color-string :background xged/color-string)
  (set-face-attribute 'git-gutter+-deleted            nil :foreground xged/color-keyword :background xged/color-keyword)
  (set-face-attribute 'git-gutter+-modified           nil :foreground xged/color-type :background xged/color-type)
  (set-face-attribute 'git-gutter+-unchanged          nil :foreground xged/color-keyword :background xged/color-keyword)
  (set-face-attribute 'git-gutter+-commit-header-face nil :foreground xged/color-comment :background xged/color-comment)
  (set-face-attribute 'git-gutter+-separator          nil :foreground xged/color-keyword :background xged/color-keyword)
  (set-face-attribute 'magit-log-date                 nil :foreground xged/color-type)
  (set-face-attribute 'magit-section-highlight        nil :background xged/color-background)

  ;; Settings: Fullscreen
  (with-eval-after-load 'window-purpose
    ;; remove bottom split popup
    (setq purpose-special-action-sequences (delete '(pupo/display-condition pupo/display-function) purpose-special-action-sequences))
    ;; make popup reuse current window
    (add-to-list 'purpose-special-action-sequences '(pupo/display-condition display-buffer-same-window display-buffer-use-some-window)))
  (defun always-true (&rest _args) t)
  (setq display-buffer-base-action '(display-buffer-same-window))
  (with-eval-after-load 'window-purpose (add-to-list 'purpose-special-action-sequences
   '(always-true display-buffer-same-window) 'append))
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
    (selectric-mode lsp-treemacs bui lsp-ivy flycheck-ocaml merlin flycheck-credo emojify emoji-cheat-sheet-plus helm helm-core dune company-emoji chruby ccls bundler inf-ruby alchemist elixir-mode tern ivy-rtags google-c-style flycheck-rtags disaster cpp-auto-include company-rtags rtags company-c-headers clang-format org-plus-contrib doom-modeline yasnippet-snippets yapfify xterm-color ws-butler writeroom-mode winum which-key wgrep web-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package treemacs-projectile treemacs-evil toc-org tide tagedit symon string-inflection spaceline-all-the-icons smex smeargle slim-mode shrink-path shell-pop scss-mode sass-mode restart-emacs request ranger rainbow-mode rainbow-identifiers rainbow-delimiters pyvenv pytest pyenv-mode py-isort pug-mode prettier-js popwin pippel pipenv pip-requirements persp-mode pcre2el password-generator paradox overseer orgit org-projectile org-present org-pomodoro org-mime org-download org-bullets org-brain open-junk-file nameless mvn multi-term move-text mmm-mode meghanada maven-test-mode markdown-toc magithub magit-svn magit-gitflow macrostep lorem-ipsum livid-mode live-py-mode link-hint json-navigator json-mode js2-refactor js-doc ivy-yasnippet ivy-xref ivy-purpose ivy-hydra indent-guide importmagic impatient-mode hungry-delete hlint-refactor hl-todo hindent highlight-parentheses highlight-numbers highlight-indentation helm-make haskell-snippets groovy-mode groovy-imports gradle-mode google-translate golden-ratio gnuplot gitignore-templates gitignore-mode github-search github-clone gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gist gh-md fuzzy forge font-lock+ flyspell-correct-ivy flycheck-pos-tip flycheck-haskell flx-ido fill-column-indicator fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-org evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-escape evil-ediff evil-cleverparens evil-args evil-anzu eval-sexp-fu eshell-z eshell-prompt-extras esh-help ensime emmet-mode elisp-slime-nav eldoc-eval editorconfig dumb-jump dotenv-mode diminish diff-hl define-word darktooth-theme cython-mode counsel-projectile counsel-css company-web company-tern company-statistics company-ghci company-emacs-eclim company-cabal company-anaconda column-enforce-mode color-identifiers-mode cmm-mode clean-aindent-mode centered-cursor-mode browse-at-remote auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile aggressive-indent ace-link ac-ispell))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
