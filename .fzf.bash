# Setup fzf
# ---------
if [[ ! "$PATH" == */usr/local/Cellar/fzf/0.42.0/bin* ]]; then
  PATH="${PATH:+${PATH}:}/usr/local/Cellar/fzf/0.42.0/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/usr/local/Cellar/fzf/0.42.0/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/usr/local/Cellar/fzf/0.42.0/shell/key-bindings.bash"
