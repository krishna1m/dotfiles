;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Manmohan Krishna"
      user-mail-address "manmohan_krishna@apple.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; (setq doom-font (font-spec :family "FiraMono Nerd Font" :size 16)
;;      doom-big-font (font-spec :family "FiraMono Nerd Font" :size 22)
;;      doom-variable-pitch-font (font-spec :family "FiraMono Nerd Font" :size 16)
;;      doom-unicode-font (font-spec :family "FiraMono Nerd Font" :size 20)
;;      doom-serif-font (font-spec :family "FiraMono Nerd Font" :weight 'bold))
(setq doom-font (font-spec :family "Monaspace Radon Var" :size 16)
     doom-big-font (font-spec :family "Monaspace Radon Var" :size 22)
     doom-variable-pitch-font (font-spec :family "Monaspace Radon Var" :size 16)
     doom-unicode-font (font-spec :family "FiraMono Nerd Font" :size 20)
     doom-serif-font (font-spec :family "Monaspace Radon Var" :weight 'bold))


;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; (setq doom-theme
;;       'doom-gruvbox
;;       ;; 'doom-opera
;;       )

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
;; (setq global-display-line-numbers-mode t)
(setq display-line-numbers-type 'relative)

;; disable auto-completion suggestions in all buffers by default
(setq company-mode 'nil)
(map! :leader
      :desc "company-mode autocomplete"
      "t a" #'global-company-mode)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(after! org
  (map! :map org-mode-map
        :n "M-j" #'org-metadown
        :n "M-k" #'org-metaup
        :localleader (:prefix ("k" . "kanban")
                 :desc "kanban/shift" "s" #'org-kanban/shift
                 :desc "kanban/initialize" "i" #'org-kanban/initialize-at-beginning)
        )
  (setq org-directory "~/org")
  (setq org-attach-id-dir "~/org/.attach")
  (setq org-log-done 'note)
  (setq org-log-repeat 'note)
  (setq org-closed-keep-when-no-todo t)
  (setq org-agenda-span 1
        org-agenda-start-day "+0d"
        org-agenda-skip-timestamp-if-done t
        org-agenda-skip-deadline-if-done t
        org-agenda-skip-scheduled-if-done t
        org-agenda-skip-scheduled-if-deadline-is-shown t
        org-agenda-skip-timestamp-if-deadline-is-shown t
        calendar-week-start-day 1
        org-deadline-warning-days 30)

  ;; coming from doom emacs
  ;; ((sequence "TODO(t)" "PROJ(p)" "LOOP(r)" "STRT(s)" "WAIT(w)" "HOLD(h)" "IDEA(i)" "|" "DONE(d)" "KILL(k)")
  ;;  (sequence "[ ](T)" "[-](S)" "[?](W)" "|" "[X](D)")
  ;;  (sequence "|" "OKAY(o)" "YES(y)" "NO(n)"))

  (setq org-todo-keywords
        (quote ((sequence "TODO(t)" "STRT(s)" "HOLD(h)" "|" "DONE(d)" "KILL(k)"))))
  (setq org-clock-persist 'history)
  (org-clock-persistence-insinuate)
  ;; (global-org-modern-mode)
 )

(use-package org-capture
  :config
  (setq org-capture-templates
        '(
          ("a" "Aspect")
          ("ap" "Personal" entry (file+headline "~/org/personal.org" "Personal")
           "* TODO %?\n%^{CAPTURE TYPE|DEADLINE|SCHEDULED}: %^t\n")
          ("af" "Family" entry (file+headline "~/org/family.org" "Family")
           "* TODO %?\n%^{CAPTURE TYPE|DEADLINE|SCHEDULED}: %^t\n")
          ("am" "Money" entry (file+headline "~/org/money.org" "Money")
           "* TODO %?\n%^{CAPTURE TYPE|DEADLINE|SCHEDULED}: %^t\n")
          ("ah" "Home" entry (file+headline "~/org/home.org" "Home")
           "* TODO %?\n%^{CAPTURE TYPE|DEADLINE|SCHEDULED}: %^t\n")
          ("l" "Learning" entry (file+headline "~/org/learn.org" "Learning")
           "* TODO %?\n%^{CAPTURE TYPE|DEADLINE|SCHEDULED}: %^t\n")
          ("w" "Work" entry (file+headline "~/org/work.org" "Work")
           "* TODO %?\n%^{CAPTURE TYPE|DEADLINE|SCHEDULED}: %^t\n")
          ("m" "Meetings" entry (file+headline "~/org/meetings.org" "Meetings")
           "* TODO %?\nDEADLINE: %^t\n** Agenda\n** Minutes\n")
          ("r" "Research" entry (file+headline "~/org/research.org" "Research")
           "* TODO %?\nDEADLINE: %^t\n")
          ("s" "Scratch" entry (file+headline "~/org/scratch.org" "Scratch")
           "* %?\n%i")
          )))

;; Default org-capture templates
;; (("t" "Personal todo" entry
;;   (file+headline +org-capture-todo-file "Inbox")
;;   "* [ ] %?\n%i\n%a" :prepend t)
;;  ("n" "Personal notes" entry
;;   (file+headline +org-capture-notes-file "Inbox")
;;   "* %u %?\n%i\n%a" :prepend t)
;;  ("j" "Journal" entry
;;   (file+olp+datetree +org-capture-journal-file)
;;   "* %U %?\n%i\n%a" :prepend t)
;;  ("p" "Templates for projects")
;;  ("pt" "Project-local todo" entry
;;   (file+headline +org-capture-project-todo-file "Inbox")
;;   "* TODO %?\n%i\n%a" :prepend t)
;;  ("pn" "Project-local notes" entry
;;   (file+headline +org-capture-project-notes-file "Inbox")
;;   "* %U %?\n%i\n%a" :prepend t)
;;  ("pc" "Project-local changelog" entry
;;   (file+headline +org-capture-project-changelog-file "Unreleased")
;;   "* %U %?\n%i\n%a" :prepend t)
;;  ("o" "Centralized templates for projects")
;;  ("ot" "Project todo" entry #'+org-capture-central-project-todo-file "* TODO %?\n %i\n %a" :heading "Tasks" :prepend nil)
;;  ("on" "Project notes" entry #'+org-capture-central-project-notes-file "* %U %?\n %i\n %a" :heading "Notes" :prepend t)
;;  ("oc" "Project changelog" entry #'+org-capture-central-project-changelog-file "* %U %?\n %i\n %a" :heading "Changelog" :prepend t))


(after! org-fancy-priorities
  (setq
   org-fancy-priorities-list '("[A]" "[B]" "[C]")
   org-priority-faces
   '((?A :foreground "red" :weight bold)
     (?B :foreground "green" :weight bold)
     (?C :foreground "grey" :weight bold))
   )
  )

(with-eval-after-load 'org
  (defun org-agenda-files (&rest _)
    (directory-files-recursively "~/org" org-agenda-file-regexp)))

(setq org-agenda-current-time-string "← now ───────────────────────────────────────────────")
(setq org-agenda-time-grid '((daily) () "" ""))
(setq org-agenda-hide-tags-regexp ".*")
(setq org-super-agenda-groups
       '(;; Each group has an implicit boolean OR operator between its selectors.
         (:name " Overdue "  ; Optionally specify section name
                :and(:deadline past :not (:todo "DONE"))
                :order 2
                :face 'error)

         (:name "Work "
                :and(:file-path "work" :not (:todo "DONE"))
                :order 3)

         (:name "Personal "
                :and(:file-path "personal" :not (:todo "DONE"))
                :order 4)

         (:name "Family "
                :and(:file-path "family" :not (:todo "DONE"))
                :order 5)

         (:name "Money "
                :and(:file-path "money" :not (:todo "DONE"))
                :order 6)

         (:name "Home "
                :and(:file-path "home" :not (:todo "DONE"))
                :order 7)

         (:name "Learning "
                :and(:file-path "learn" :not (:todo "DONE"))
                :order 8)

         (:name "Research "
                :and(:file-path "research" :not (:todo "DONE"))
                :order 9)

         (:name "Follow Up "
                :and(:file-path "meetings" :deadline future :tag "fup" :not (:todo "DONE"))
                :order 10
                :face 'warning)

         ;; another category - meetings(takes tag as "event")
         (:name "  Today "  ; Optionally specify section name
          :time-grid t
          :date today
          :deadline today
          :order 1
          :face 'warning)

         (:name "Upcoming "
                :and(:file-path "meetings" :deadline future :not (:todo "DONE"))
                :order 11
                :face 'warning)

))

(org-super-agenda-mode t)

;; Add this back when using `org-super-agenda`
(setq org-agenda-prefix-format '(
                                 (agenda . " %?-2i %t ")
                                 (todo . " %i %-12:c")
                                 (tags . " %i %-12:c")
                                 (search . " %i %-12:c")))
(setq org-agenda-category-icon-alist
      `(
        ("personal", (list (all-the-icons-faicon "user" :height 0.6 :v-height 0.005)) nil nil :ascent center)
        ("family", (list (all-the-icons-faicon "users" :height 0.6 :v-height 0.005)) nil nil :ascent center)
        ("money", (list (all-the-icons-faicon "inr" :v-adjust 0.005)) nil nil :ascent center)
        ("home", (list (all-the-icons-faicon "home" :v-adjust 0.005)) nil nil :ascent center)
        ("learn", (list (all-the-icons-faicon "book" :height 0.8)) nil nil :ascent center)
        ("work", (list (all-the-icons-faicon "briefcase" :height 0.8)) nil nil :ascent center)
        ("research", (list (all-the-icons-faicon "search" :height 0.8)) nil nil :ascent center)
        ("meetings", (list (all-the-icons-faicon "clock-o" :height 0.8 :v-height 0.005)) nil nil :ascent center :mask heuristic)
        )
      )


(defun org-agenda-open-hook ()
  (olivetti-mode))

(add-hook 'org-agenda-mode-hook 'org-agenda-open-hook)

(defun clojure-startup-hook ()
  (map! :map clojure-mode-map
        :n "C-h" #'paredit-forward-barf-sexp
        :n "C-l" #'paredit-forward-slurp-sexp))

(add-hook 'clojure-mode-hook 'clojure-startup-hook)

;; Deft configuration
(defvar my/deft-dir-list '()
  "A list of deft directories to pick")

(setq my/deft-dir-list '(
                         "~/roam"
                         "~/journal"
                         "~/org"
                         ))

(defun my/pick-deft-dir ()
  "Select directories from a list"
  (interactive)
  (setq deft-directory
        (ido-completing-read "Pick directory: " my/deft-dir-list))
  (deft-refresh))
(setq deft-directory "~/org"
      deft-extensions '("org" "txt")
      deft-recursive t)
(map! :after deft
      :leader (:prefix ("n" . "notes")
               :desc "deft/pick-directory" "p" #'my/pick-deft-dir))

(setq org-journal-dir "~/journal"
      org-journal-date-prefix "#+TITLE: "
      org-journal-time-prefix "* "
      org-journal-date-format "%a, %Y-%m-%d"
      org-journal-file-format "%Y-%m-%d.org"
      )

(setq org-roam-directory "~/roam")

(defadvice revert-buffer (after refresh-org-agenda activate)
  (if (eq major-mode 'org-mode)
      (org-agenda-redo-all t)))

(after! org-excalidraw
  (setq org-excalidraw-directory "~/draw"))

(after! (:and org org-excalidraw)
  (map! :map org-mode-map
        :localleader (:prefix ("a")
                      :desc "org-excalidraw-attach-drawing" "e" #'org-excalidraw-create-drawing)
        :localleader (:prefix ("c" . "clock")
                      (:prefix ("T" . "org-timer")
                       :desc "org-timer/start" "s" #'org-timer-start
                       :desc "org-timer/end" "e" #'org-timer-stop
                       :desc "org-timer/toggle-pause" "t" #'org-timer-pause-or-continue
                       :desc "org-timer/item" "i" #'org-timer-item
                       :desc "org-timer/countdown" "c" #'org-timer-set-timer))
        )
  (setq org-excalidraw-directory "~/draw"))

(org-excalidraw-initialize)

;; Refresh org-agenda after rescheduling a task.
(defun org-agenda-refresh ()
  "Refresh all `org-agenda' buffers."
  (dolist (buffer (buffer-list))
    (with-current-buffer buffer
      (when (derived-mode-p 'org-agenda-mode)
        (org-agenda-maybe-redo)))))

(defadvice org-schedule (after refresh-agenda activate)
  "Refresh org-agenda."
  (org-agenda-refresh))

;; Which-key delay seconds
(setq which-key-idle-delay 0)

(setq treemacs-position 'right)
(setq treemacs-width 80)
(setq treemacs--width-is-locked nil)
(setq treemacs-width-is-initially-locked nil)

;; Centaur-tabs
(centaur-tabs-mode t)
(centaur-tabs-headline-match)
(setq centaur-tabs-set-icons t
      centaur-tabs-set-bar 'left
      centaur-tabs-set-close-button nil
      centaur-tabs-set-modified-marker t)

;; Load up banner
(setq +doom-dashboard-banner-file (expand-file-name "banner.png" doom-user-dir))

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; metals install till EOF
(require 'package)

;; Add melpa to your packages repositories
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

;; Install use-package if not already installed
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)

;; Enable defer and ensure by default for use-package
;; Keep auto-save/backup files separate from source code:  https://github.com/scalameta/metals/issues/1027
(setq use-package-always-defer t
      use-package-always-ensure t
      backup-directory-alist `((".*" . ,temporary-file-directory))
      auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

;; Enable scala-mode for highlighting, indentation and motion commands
(use-package scala-mode
  :interpreter ("scala" . scala-mode))

;; Enable sbt mode for executing sbt commands
(use-package sbt-mode
  :commands sbt-start sbt-command
  :config
  ;; WORKAROUND: https://github.com/ensime/emacs-sbt-mode/issues/31
  ;; allows using SPACE when in the minibuffer
  (substitute-key-definition
   'minibuffer-complete-word
   'self-insert-command
   minibuffer-local-completion-map)
   ;; sbt-supershell kills sbt-mode:  https://github.com/hvesalai/emacs-sbt-mode/issues/152
   (setq sbt:program-options '("-Dsbt.supershell=false")))

;; Enable nice rendering of diagnostics like compile errors.
(use-package flycheck
  :init (global-flycheck-mode))

(use-package lsp-mode
  ;; Optional - enable lsp-mode automatically in scala files
  ;; You could also swap out lsp for lsp-deffered in order to defer loading
  :hook  (scala-mode . lsp)
         (lsp-mode . lsp-lens-mode)
  :config
  ;; Uncomment following section if you would like to tune lsp-mode performance according to
  ;; https://emacs-lsp.github.io/lsp-mode/page/performance/
  ;; (setq gc-cons-threshold 100000000) ;; 100mb
  ;; (setq read-process-output-max (* 1024 1024)) ;; 1mb
  ;; (setq lsp-idle-delay 0.500)
  ;; (setq lsp-log-io nil)
  ;; (setq lsp-completion-provider :capf)
  (setq lsp-prefer-flymake nil)
  ;; Makes LSP shutdown the metals server when all buffers in the project are closed.
  ;; https://emacs-lsp.github.io/lsp-mode/page/settings/mode/#lsp-keep-workspace-alive
  (setq lsp-keep-workspace-alive nil))

;; Add metals backend for lsp-mode
(use-package lsp-metals)

;; Enable nice rendering of documentation on hover
;;   Warning: on some systems this package can reduce your emacs responsiveness significally.
;;   (See: https://emacs-lsp.github.io/lsp-mode/page/performance/)
;;   In that case you have to not only disable this but also remove from the packages since
;;   lsp-mode can activate it automatically.
(use-package lsp-ui)

;; lsp-mode supports snippets, but in order for them to work you need to use yasnippet
;; If you don't want to use snippets set lsp-enable-snippet to nil in your lsp-mode settings
;; to avoid odd behavior with snippets and indentation
(use-package yasnippet)

;; Use company-capf as a completion provider.
;;
;; To Company-lsp users:
;;   Company-lsp is no longer maintained and has been removed from MELPA.
;;   Please migrate to company-capf.
(use-package company
  :hook (scala-mode . company-mode)
  :config
  (setq lsp-completion-provider :capf))

;; Posframe is a pop-up tool that must be manually installed for dap-mode
(use-package posframe)

;; Use the Debug Adapter Protocol for running tests and debugging
(use-package dap-mode
  :hook
  (lsp-mode . dap-mode)
  (lsp-mode . dap-ui-mode))

(defun lsp-find-workspace (server-id &optional file-name)
    "Find workspace for SERVER-ID for FILE-NAME."
    (-when-let* ((session (lsp-session))
                 (folder->servers (lsp-session-folder->servers session))
                 (workspaces (if file-name
                                 (let* ((folder (lsp-find-session-folder session file-name))
                                        (folder-last-char (substring folder (- (length folder) 1) (length folder)))
                                        (key (if (string= folder-last-char "/") (substring folder 0 (- (length folder) 1)) folder)))
                                   (gethash key folder->servers))
                               (lsp--session-workspaces session))))

      (--first (eq (lsp--client-server-id (lsp--workspace-client it)) server-id) workspaces)))
