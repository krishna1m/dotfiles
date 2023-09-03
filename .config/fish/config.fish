# cmatrix, cowsay, sl, fortune, asciiquarium, pv, toilet
# fd, ripgrep, ripgrep-all, fzf, pbcopy, pbpaste, sponge, zoxide, ranger, gnupg, neofetch, tldr, httpie, direnv, jq, parallel, bat, exa
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
set -x CARGO_BIN $HOME/.cargo/bin
set -x CARGO_ENV $HOME/.cargo/env
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

# mongodb
set -x MONGO_PATH $HOME/opt/mongodb/bin
set -x PATH $MONGO_PATH $PATH
alias mongod="mongod --dbpath=/Users/manmohankrishna/data/db"

# git
set -x GIT_BARE $HOME/repo/bare
set -x GIT_WORKTREES $HOME/repo/worktrees
# repo make it ez pz
set -x PATH $HOME/repo $PATH
# utils
set -x PATH $HOME/utils $PATH

set -U fish_greeting

set -U fish_features qmark-noglob

fish_vi_key_bindings
fzf_key_bindings
set -x FZF_DEFAULT_OPTS '--layout=reverse'
set -x BAT_THEME 'gruvbox-dark'

# zoxide aliases - z, zi
zoxide init fish | source
# ~/.tmux/plugins
fish_add_path $HOME/.tmux/plugins/t-smart-tmux-session-manager/bin
# ~/.config/tmux/plugins
fish_add_path $HOME/.config/tmux/plugins/t-smart-tmux-session-manager/bin

# asdf
source ~/.asdf/asdf.fish
# for erlang
fish_add_path /usr/local/opt/libxslt/bin
set -gx LDFLAGS "-L/usr/local/opt/libxslt/lib"
set -gx CPPFLAGS "-I/usr/local/opt/libxslt/include"
fish_add_path /usr/local/opt/libxslt/bin
set -gx LDFLAGS "-L/usr/local/opt/libxslt/lib"
set -gx CPPFLAGS "-I/usr/local/opt/libxslt/include"


direnv hook fish | source
set -g direnv_fish_mode eval_on_arrow    # trigger direnv at prompt, and on every arrow-based directory change (default)
# set -g direnv_fish_mode eval_after_arrow # trigger direnv at prompt, and only after arrow-based directory changes before executing command
# set -g direnv_fish_mode disable_arrow    # trigger direnv at prompt only, this is similar functionality to the original behavior

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
alias ghome='cd $(git rev-parse --show-toplevel)'
alias gdelete="git branch --merged | grep -ve 'main\|master\|develop\|staging\|\*' >/tmp/merged-branches  && nvim /tmp/merged-branches && xargs git branch -d </tmp/merged-branches"
alias h='nvim -c ":History"'
alias dps='docker ps --format "table {{.Image}}\t{{.Ports}}\t{{.Names}}"'

abbr nj 'nvim -c "set ft=json" -c "set foldmethod=indent"'
abbr g "git"
abbr r "ranger"
abbr v 'nvim'
abbr vim 'nvim'

# mix
# mix deps.get && mix deps.update --all && mix compile && mix elixir_ls.release -o release
# mix deps.clean --all && mix deps.get
# mix ecto.drop && mix ecto.create && mix ecto.migrate
# mix phx.server

# git
abbr ga 'git add'
abbr gb 'git branch'
abbr gbd 'git branch -D'
abbr gbi 'git bisect'

abbr gca 'git commit --amend'
abbr gcc 'git commit -m'
abbr gce 'git commit --amend --no-edit'

abbr gcg 'git config --global'
abbr gcl 'git config --local'

abbr gcza 'git stash apply'
abbr gczc 'git stash clear'
abbr gczd 'git stash drop'
abbr gczl 'git stash list'
abbr gczz 'git stash push -m'
abbr gczp 'git stash pop'

abbr gcm 'git merge'
abbr gcob 'git checkout -b'
abbr gcoo 'git checkout'
abbr gcot 'git checkout --track'
abbr gcp 'git cherry-pick'

abbr gd 'git diff'
abbr gds 'git diff --staged'
abbr gf 'git fetch'
abbr gfo 'git fetch origin'
abbr gfop 'git fetch origin --prune'
abbr gls 'git log --oneline | head -5'
abbr gll 'git log --all --decorate --oneline --graph'
abbr glb 'git log --oneline --graph --decorate --abbrev-commit <branch1>..<branch2>'

abbr gpul 'git pull'
abbr gpus 'git push'
abbr gr 'git rebase'
abbr gra 'git rebase --abort'
abbr gri 'git rebase -i'
abbr grl 'git rebase --onto <newbase> <oldbase> <end>'
abbr grr 'git rebase --continue'
abbr grv 'git remote -v'
abbr gg 'git status'

# tmux
abbr ta 'tmux attach'
abbr tk 'tmux kill-server'
abbr tns 'tmux new -s'
abbr tls 'tmux ls'

# gpg --full-generate-key
# gpg --list-public-keys --keyid-format=long
# gpg --list-secret-keys --keyid-format=long
# gpg --export -o <keyname>.key <pub-key>
# gpg --import <keyname>.key
# gpg --encrypt --recipient jondoe@gmail.com <unencrypted-file>
# <secret-file>.gpg created
# gpg --encrypt --recipient jondoe@gmail.com -o <encrypted> <unencrypted-file>
# Does the same thing but <encrypted> created
# gpg -d -o <unencrypted-file> <encrypted>

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Setting PATH for Python 3.11
# The original version is saved in $HOME/.config/fish/config.fish.pysave
set -x PATH "/Library/Frameworks/Python.framework/Versions/3.11/bin" "$PATH"
