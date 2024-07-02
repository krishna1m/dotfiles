# fun commands - cmatrix, cowsay, sl, fortune, asciiquarium, pv, toilet
# useful packages - fd, ripgrep, ripgrep-all, fzf, pbcopy, pbpaste, sponge, zoxide, ranger, gnupg, neofetch, tealdeer, httpie, direnv, jq, parallel, bat, exa, pcre2, bats-core, git-delta, gh
# useful packages (continued)- `brew install noahgorstein/tap/jqp`, pyenv, jid, csvkit, gsed, ntfy, zed, pandoc, basictex, openapi-tui
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

# haskell
# To start a simple repl, run:
#   ghci
# To create an executable for your haskell program, run:
#   ghc hello.hs -o helloworld
# To start a new haskell project in the current directory, run:
#   cabal init --interactive
# To install other GHC versions and tools, run:
#   ghcup tui
# If you are new to Haskell, check out https://www.haskell.org/ghcup/steps/
set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin $PATH /Users/manmohankrishna/.ghcup/bin # ghcup-env

# golang
set -x GO_PATH $HOME/opt/go/bin
set -x PATH $GO_PATH $PATH

# jdk
set -x JAVA_HOME $HOME/opt/applejdk-8.0.292.9.1.jdk/Contents/Home
# set -x JAVA_HOME $HOME/opt/jdk-14.0.2.jdk/Contents/Home
# set -x JAVA_HOME $HOME/opt/jdk-17.0.10.jdk/Contents/Home
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

set -x PATH /usr/local/bin $PATH

# python
set -x PYENV_VERSION "3.11"
set -x PYENV_PATH $HOME/.pyenv/bin
set -x PATH $PYENV_PATH $PATH
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
# vf new -p python3.8 <envname>
# vf activate <envname>
# vf deactivate

# gnu sed
set -x GSED_PATH /usr/local/opt/gnu-sed/libexec/gnubin
set -x PATH $GSED_PATH $PATH

# lunarvim
set -x LVIM_PATH $HOME/.local/bin/
set -x PATH $LVIM_PATH $PATH

if [ -f $HOME/.config/fish/alias.fish ]
  source $HOME/.config/fish/alias.fish
end

if [ -f $HOME/.config/fish/aoc.fish ]
  source $HOME/.config/fish/aoc.fish
end

if [ -f $HOME/.config/fish/util_functions.fish ]
  source $HOME/.config/fish/util_functions.fish
end

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
set -x FZF_DEFAULT_OPTS '--layout=reverse --preview-window=down --bind up:preview-up,down:preview-down'
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
set -gx ERL_AFLAGS "-kernel shell_history enabled -kernel shell_history_file_bytes 1024000"
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
alias grep='pcre2grep --color'
alias cp='cp -i'
alias mv='mv -i'
alias df='df -h'
alias rm='rm -v'
alias jq='jq'
alias tldrs="tldr --list | fzf-tmux -p 90%,90% --preview 'tldr --color=always {1}' | xargs tldr"
alias ghome='cd $(git rev-parse --show-toplevel)'
alias gdeletel="git fetch --all && git branch --merged | pcre2grep -v '^\*' | sort >/tmp/merged-branches && echo '$(tput setaf 1)WARNING: $(tput setaf 6)keep only those branches that you want DELETED$(tput sgr0)' && sleep 5 && lvim /tmp/merged-branches && xargs git branch -d </tmp/merged-branches"
alias gdeleter="git fetch --all && git branch -r --merged | pcre2grep 'mk/' | pcre2grep -v 'origin|main|master|develop|staging' | sed 's/mk\///' >/tmp/merged-branches && echo '$(tput setaf 1)WARNING: $(tput setaf 6)keep only those branches that you want DELETED$(tput sgr0)' && sleep 5 && lvim /tmp/merged-branches && xargs git push -d mk </tmp/merged-branches"
alias gfetch="git fetch --all"
alias gprune="git fetch --all --prune"
alias h='nvim -c ":History"'
alias dps='docker ps --format "table {{.Image}}\t{{.Ports}}\t{{.Names}}"'

alias oreilly='open https://www.oreilly.com/'
alias linkedin='open https://linkedin.com/in/krishna1m'
alias rust='open https://www.rust-lang.org/'
alias coursera='open https://www.coursera.org/'

abbr dsr 'docker stop $(docker ps -aq) && docker rm -v $(docker ps -aq)'
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
abbr gam "git status | grep modified | awk '{print \$2}' | xargs git add"
abbr gb 'git branch'
abbr gbr 'git branch --remote'
abbr gbc 'git branch -a --contains <commit-sha>'
abbr ggrep 'git rev-list --all | xargs git grep -iE <expression>'
abbr gbd 'git branch -D'
abbr gbi 'git bisect'

abbr gca 'git commit --amend'
abbr gcc 'git commit'
abbr gce 'git commit --amend --no-edit'

abbr gcg 'git config --global'
abbr gcl 'git config --local'

# stash staged and unstaged changes
abbr gcz 'git stash'
# stash staged, unstaged and untracked changes
abbr gczu 'git stash -u'
abbr gcza 'git stash apply'
abbr gczc 'git stash clear'
abbr gczd 'git stash drop'
abbr gczl 'git stash list'
abbr gczz 'git stash push -m'
abbr gczp 'git stash pop'
abbr gczsp 'git stash show -p'
# stash staged and unstaged changes - keep the staged changes in working tree
abbr gczk 'git stash --keep-index'
# stash staged, unstaged and untracked changes - keep the staged changes in working tree
abbr gczuk 'git stash --keep-index -u'
# stash only staged changes
abbr gczss 'git stash -S'

abbr gcm 'git merge'
abbr gcob 'git checkout -b'
# see diff for a local branch with current branch and checkout
alias gcoi="git branch --sort=-committerdate | fzf-tmux -p 90%,90% --preview='git diff --color=always head..{1} | delta' | xargs git checkout"
# checkout any branch from the default branch
abbr gcoh 'git fetch origin HEAD && git checkout origin/HEAD -b'
abbr gcoo 'git checkout'
# checkout any branch in origin
alias gcot "git ls-remote --heads origin | awk -F'heads/' '{print \$2}' | fzf-tmux -p 30%,90% | xargs -I{} sh -c 'git fetch origin {}; git checkout --track origin/{}'"
abbr gcp 'git cherry-pick'

abbr gd 'git diff'
abbr gds 'git diff --staged'
abbr gf 'git fetch'
abbr gfoo 'git fetch origin'
abbr gfoh 'git fetch origin HEAD'
abbr gl 'git log'
alias gls='git log --pretty="%C(Yellow)%h  %C(reset)%ad (%C(Green)%cr%C(reset))%x09 %C(Cyan)%an: %C(reset)%s" --date=short -7'
alias gll='git log --all --decorate --oneline --graph'
# commits that are in branch2 that are not in branch1; xargs to remove trailing and leading spaces
alias gdb "git branch -r | fzf-tmux -p 30%,90% --header 'target branch' | xargs | read target; git branch -r | fzf-tmux -p 30%,90% --header 'source branch' | xargs | read src; git log --oneline --graph --decorate --abbrev-commit \$target..\$src | fzf-tmux -p 90%,90% --preview='git show --color=always {1} | delta' > /dev/null && git diff \$target..\$src"

abbr gpul 'git pull'
abbr gpus 'git push'
abbr gr 'git rebase'
abbr gra 'git rebase --abort'
abbr gri 'git rebase -i'
abbr grl 'git rebase --onto <newbase> <oldbase> <end>'
abbr grr 'git rebase --continue'
abbr grv 'git remote -v'
abbr gg 'git status'
abbr gguno 'git status -uno'

# github cli
# see pr diff and checkout
alias ghprcoo="GH_FORCE_TTY=100% gh pr list | fzf --ansi --header-lines 3 --preview 'GH_FORCE_TTY=100% gh pr diff {1} | delta' | awk '{print \$1}' | xargs gh pr checkout"
# open pr metadata and open in browser
alias ghprb="GH_FORCE_TTY=100% gh pr list | fzf --ansi --header-lines 3 --preview 'GH_FORCE_TTY=100% gh pr view {1}' | awk '{print \$1}' | xargs gh pr view --web"
# comment on the PR in browser
alias ghprcc="GH_FORCE_TTY=100% gh pr list | fzf --ansi --header-lines 3 --preview 'GH_FORCE_TTY=100% gh pr view {1}' | awk '{print \$1}' | xargs gh pr comment -w"
abbr ghb "gh browse"
abbr ghbc "gh browse -c="
abbr ghs "gh search"


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

# To see column names
# csvcut -n <csvfile>
# csvcut -c 'comma separated column name/number' <csvfile>

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Setting PATH for Python 3.11
# The original version is saved in $HOME/.config/fish/config.fish.pysave
set -x PATH "/Library/Frameworks/Python.framework/Versions/3.11/bin" "$PATH"

# opam configuration - `opam install dune merlin ocaml-lsp-server odoc ocamlformat utop dune-release`
source /Users/manmohankrishna/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

# fisher list
# jorgebucaran/fisher
# ilancosman/tide@v5
# jorgebucaran/nvm.fish
# edc/bass
