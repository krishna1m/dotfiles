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
;; (global-display-line-numbers-mode t)
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(after! org
  (map! :map org-mode-map
        :n "M-j" #'org-metadown
        :n "M-k" #'org-metaup)
  (setq org-directory "~/org")
  (setq org-log-done 'note)
  (setq org-agenda-span 1
        org-agenda-start-day "+0d"
        org-agenda-skip-timestamp-if-done t
        org-agenda-skip-deadline-if-done t
        org-agenda-skip-scheduled-if-done t
        org-agenda-skip-scheduled-if-deadline-is-shown t
        org-agenda-skip-timestamp-if-deadline-is-shown t)
  ;; (global-org-modern-mode)
 )

(setq org-export-with-broken-links t)

(use-package org-capture
  :config
  (setq org-capture-templates
        '(
          ("p" "Personal" entry (file+headline "~/org/personal.org" "Personal")
           "* TODO %?\n")
          ("f" "Family" entry (file+headline "~/org/family.org" "Family")
           "* TODO %?\n")
          ("m" "Money" entry (file+headline "~/org/money.org" "Money")
           "* TODO %?\n")
          ("h" "Home" entry (file+headline "~/org/home.org" "Home")
           "* TODO %?\n")
          ("l" "Learning" entry (file+headline "~/org/learn.org" "Learning")
           "* TODO %?\n")
          ("w" "Work" entry (file+headline "~/org/work.org" "Work")
           "* TODO %?\nDEADLINE: %^t\n")
          ("r" "Rendezvous" entry (file+headline "~/org/rendezvous.org" "Rendezvous")
           "* TODO %?\nSCHEDULED: %^t\n** Agenda\n** Minutes\n")
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
                :scheduled past
                :order 2
                :face 'error)

         (:name "Personal "
                :and(:file-path "personal" :not (:tag "event"))
                :order 3)

         (:name "Family "
                :and(:file-path "family" :not (:tag "event"))
                :order 3)

         (:name "Money "
                :and(:file-path "money" :not (:tag "event"))
                :order 3)

         (:name "Home "
                :and(:file-path "home" :not (:tag "event"))
                :order 3)

         (:name "Learning "
                :and(:file-path "learn" :not (:tag "event"))
                :order 3)

         (:name "Work "
                :and(:file-path "work" :not (:tag "event"))
                :order 3)

         ;; another category - rendezvous
          (:name "  Today "  ; Optionally specify section name
                :time-grid t
                :date today
                :scheduled today
                :order 1
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
        ("rendezvous", (list (all-the-icons-faicon "calendar-o" :height 0.7 :v-height 0.005)) nil nil :ascent center :mask heuristic)
        )
      )


(defun org-agenda-open-hook ()
  (olivetti-mode))

(add-hook 'org-agenda-mode-hook 'org-agenda-open-hook)

;; Deft configuration
(setq deft-directory "~/org"
      deft-extensions '("org" "txt")
      deft-recursive t)

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
