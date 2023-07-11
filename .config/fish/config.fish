set -x PATH /Applications/CMake.app/Contents/bin $HOME/.emacs.d/bin $HOME/Library/Application\ Support/Coursier/bin $HOME/opt/.cargo/env $HOME/opt/.cargo/bin $HOME/opt/go/bin $HOME/opt/applejdk-8.0.292.9.1.jdk/Contents/Home/bin $PATH
set -x LESS -RiXsj5Q
set -x EDITOR vim
set -x SBT_CREDENTIALS $HOME/.sbt/.credentials

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

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Setting PATH for Python 3.11
# The original version is saved in /Users/manmohankrishna/.config/fish/config.fish.pysave
set -x PATH "/Library/Frameworks/Python.framework/Versions/3.11/bin" "$PATH"
