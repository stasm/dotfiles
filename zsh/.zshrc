# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="gitstas"

# CASE_SENSITIVE="true"
# DISABLE_AUTO_UPDATE="true"
# export UPDATE_ZSH_DAYS=13
# DISABLE_LS_COLORS="true"
# DISABLE_AUTO_TITLE="true"
# DISABLE_CORRECTION="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"

COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy-mm-dd"

plugins=(history z command-not-found)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/home/stas/bin:/home/stas/.local/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
# export MANPATH="/usr/local/man:$MANPATH"

export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

export SSH_KEY_PATH="~/.ssh/id_dsa"

export TERM=xterm-256color
[ -n "$TMUX" ] && export TERM=screen-256color

# Aliases
alias v="vim"
alias h="vifm . ."
alias cal="ncal -MC3"
alias please='sudo $(history -p !!)'
alias upup="sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade"
alias xc="xclip -selection clipboard"
alias nodewatch="clear && find . | entr -cdp node /_"

setxkbmap -layout pl -option ctrl:nocaps -option compose:rctrl -option terminate:ctrl_alt_bksp

export ANDROID_HOME="/home/stas/Android/Sdk"
export PATH="ANDROID_HOME/tools:ANDROID_HOME/platform-tools:/usr/local/heroku/bin:$PATH"
export PATH="/home/stas/src/git-cinnabar:$PATH"

source ~/.nvm/nvm.sh


. /home/stas/src/torch/install/bin/torch-activate

tm() {
    if [ -z $1 ]; then
        tmux list-sessions
        return
    fi
    tmux detach -s $1 2> /dev/null
    tmux attach-session -t $1 2> /dev/null || tmux new-session -s $1
}

_tm() {
    local word completions
    word="$1"
    sessions=`tmux list-sessions 2> /dev/null`
    [ $? -ne 0 ] && return
    completions=`echo "$sessions" | cut -d ':' -f1`
    reply=( "${(f)completions}" )
}
compctl -K _tm tm

autoload bashcompinit
bashcompinit
source /home/stas/moz/gecko-dev/python/mach/bash-completion.sh
