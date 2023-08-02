# cmake
set -x CMAKE_PATH /Applications/CMake.app/Contents/bin
set -x PATH $CMAKE_PATH $PATH

# emacs
set -x EMACS_PATH $HOME/.emacs.d/bin
set -x PATH $EMACS_PATH $PATH

# coursier - do `coursier install metals`
set -x COURSIER_PATH $HOME/Library/Application\ Support/Coursier/bin
set -x PATH $COURSIER_PATH $PATH

# cargo
set -x CARGO_ENV $HOME/opt/.cargo/env
set -x CARGO_BIN $HOME/opt/.cargo/bin
set -x PATH $CARGO_ENV $CARGO_BIN $PATH

# golang
set -x GO_PATH $HOME/opt/go/bin
set -x PATH $GO_PATH $PATH

# jdk
set -x JAVA_HOME $HOME/opt/applejdk-8.0.292.9.1.jdk/Contents/Home
set -x PATH $JAVA_HOME $PATH

# sbt-credentials
set -x BUILD_SECRETS_PATH $HOME/.sbt
set -x PATH $BUILD_SECRETS_PATH $PATH
set -x SBT_CREDENTIALS $HOME/.sbt/sbt.credentials

# kafka
set -x KAFKA_PATH $HOME/opt/kafka_2.12-2.3.0/bin
set -x PATH $KAFKA_PATH $PATH

# git
set -x GIT_BARE $HOME/repo/bare
set -x GIT_WORKTREES $HOME/repo/worktrees
## repo make it ez pz
set -x PATH $HOME/repo $PATH
## repo make it ez pz
set -x PATH $HOME/.config/tmux $PATH

set -U fish_features qmark-noglob

fish_vi_key_bindings
fzf_key_bindings
set -x FZF_DEFAULT_OPTS '--layout=reverse'
set -x BAT_THEME 'gruvbox-dark'

zoxide init fish | source
# ~/.tmux/plugins
fish_add_path $HOME/.tmux/plugins/t-smart-tmux-session-manager/bin
# ~/.config/tmux/plugins
fish_add_path $HOME/.config/tmux/plugins/t-smart-tmux-session-manager/bin

set -g tide_character_icon %
set -g tide_character_vi_icon_default %
set -g tide_character_vi_icon_replace %
set -g tide_character_vi_icon_visual %
set -g tide_character_color 355E3B
set -g tide_character_color_failure C41E3A

set -x LESS "-RiXsj5Q"
set -x EDITOR "nvim"
set -x VISUAL "nvim"

alias ..='cd ..'
alias ...='cd ../..'
alias ls='exa --group-directories-first'
alias ll='exa --group-directories-first -lhart accessed'
# for dense tree output, use flag --long, ie, `tree --long`
alias tree='exa --tree'
alias less='less --incsearch --save-marks'
alias rd='less -NS'
alias grep='grep --color'
alias cp='cp -i'
alias df='df -h'
alias rm='rm -v'
alias gh='cd $(git rev-parse --show-toplevel)'
alias gd="git branch --merged | grep -ve 'main\|master\|develop\|staging' >/tmp/merged-branches  && nvim /tmp/merged-branches && xargs git branch -d </tmp/merged-branches"
alias n "fd --type f --hidden --exclude .git --exclude target --exclude .metals --exclude .scala-build --exclude .bloop --exclude .bsp --exclude .sbt --exclude .emacs.d --exclude .ivy2 --exclude .docker --exclude .npm --exclude .local --exclude .cache --exclude cache --exclude .Trash --exclude .android --exclude .idea --exclude .zsh_sessions --exclude Caches --exclude Library --exclude Music --exclude Movies | fzf-tmux -p --preview='bat --color=always {}' | xargs nvim"
# meant to be run outside of tmux
alias tn="tmux new -s (pwd | sed 's/.*\///g')"

abbr r "ranger"
abbr v 'nvim'
abbr vim 'nvim'

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Setting PATH for Python 3.11
# The original version is saved in $HOME/.config/fish/config.fish.pysave
set -x PATH "/Library/Frameworks/Python.framework/Versions/3.11/bin" "$PATH"
