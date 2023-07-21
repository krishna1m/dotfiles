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
## make-repo, tmux-cd-repo
set -x PATH $HOME/repo $PATH

set -x LESS -RiXsj5Q
set -x EDITOR nvim

fish_vi_key_bindings

set -g tide_character_icon %
set -g tide_character_vi_icon_default %
set -g tide_character_vi_icon_replace %
set -g tide_character_vi_icon_visual %
set -g tide_character_color 355E3B
set -g tide_character_color_failure C41E3A

alias ..='cd ..'
alias ll='ls -lhar --color'
alias less='less --incsearch --save-marks'
alias rd='less -NS'
alias grep='grep --color'
alias rm='rm -v'
alias gh='cd $(git rev-parse --show-toplevel)'

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Setting PATH for Python 3.11
# The original version is saved in $HOME/.config/fish/config.fish.pysave
set -x PATH "/Library/Frameworks/Python.framework/Versions/3.11/bin" "$PATH"
