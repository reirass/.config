# -- $PATH variable --
export PATH=$HOME/bin:/usr/bin:/usr/local/bin:$PATH

export ZSH=$HOME/.oh-my-zsh


ZSH_THEME="robbyrussell"
plugins=( 
    git
    # zsh-autosuggestions
    # zsh-syntax-highlighting
)
source $ZSH/oh-my-zsh.sh

# -- general settings --
CASE_SENSITIVE="true"
ENABLE_CORRECTION="true"

# -- pywal --
# source ~/.cache/wal/colors-tty.sh
# (cat ~/.cache/wal/sequences &)

# -- xcursor --
export XCURSOR_PATH=${XCURSOR_PATH}:~/.local/share/icons

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)
# -- aliases --
# can be written to a separate file in $ZSH/custom
alias zsh="nvim ~/.zshrc"
alias ls='lsd'
alias c="clear"
alias gcl="git clone"
alias gs="git status"
alias gi="git init"
alias ga="git add"
alias gm="git commit -m"
alias gb="git branch"
alias gc="git checkout"
alias gl="git log"
alias gd="git diff"
alias gsh="git stash"
alias nox="shutdown now"
alias py="python"
alias ff="fastfetch"
alias program="cd /dr/hd/Programming/"
alias hypr="cd ~/.config/hypr"
alias zed="zeditor"
alias vi="nvim"

export PATH=$PATH:/home/reiras/.spicetify
