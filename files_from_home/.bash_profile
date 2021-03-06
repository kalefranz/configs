# ##############################
# /etc/profile.d/
# ##############################
_source_etc_profiled() {
    if [ -d /etc/profile.d/ ]; then
        for i in /etc/profile.d/*.sh ; do
            if [ -r "$i" ]; then
                if [ "${-#*i}" != "$-" ]; then
                    . "$i"
                else
                    . "$i" >/dev/null 2>&1
                fi
            fi
        done
    fi
}
_source_etc_profiled


alias start-work='sudo mv /opt/cisco/amp/ampdaemon /opt/cisco/amp/ampdaemon.nothanks && sudo pkill amp'
alias stop-work='sudo mv /opt/cisco/amp/ampdaemon.nothanks /opt/cisco/amp/ampdaemon'
alias conda-bug-count='curl -sS https://api.github.com/search/issues?q=repo:conda/conda+is:issue+is:open+label:type:bug | jq .total_count'

alias conda-dev='eval "$(python -m conda init --dev)"'

# ##############################
# environment
# ##############################
export EDITOR='vim'


# ##############################
# ip addresses
# ##############################
alias ips='echo "$(externalip)"; echo "$(ifips)"'


# ##############################
# key bindings
# ##############################
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\eOA": history-search-backward'
bind '"\eOB": history-search-forward'


# ##############################
# git aliases
# ##############################
alias gs='git status'
alias ga='git add'
alias gaa='cd "$(git rev-parse --show-toplevel)" && git add --all'
alias gcm='git commit --message'
alias gca='git commit --amend'
alias gg='git grep --color --show-function -n -C 2'
alias glog='git log --graph --pretty=format:"%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset" --abbrev-commit --date=relative'


# ##############################
# system aliases
# ##############################
alias ls='ls -hFG'
alias la='ls -alhFG'
alias ll='ls -alhFG'
alias ..='cd ..'

# an "alert" alias for long running commands.  Use like so:
#   $ sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


# ##############################
# bash history
# ##############################

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

HISTIGNORE='ls:ll:la:bg:fg:history'
HISTTIMEFORMAT='%F %T '
shopt -s cmdhist

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTFILESIZE=100000
HISTSIZE=100000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize


# ##############################
# from ubuntu default .bashrc
# ##############################

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


# ##############################
# go
# ##############################
#export GOPATH="$HOME/go"


# ##############################
# java
# ##############################
#export JAVA_HOME="$(/usr/libexec/java_home)"


# ##############################
# ruby
# ##############################
# export RBENV_ROOT=/usr/local/var/rbenv
# if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi


# ##############################
# python
# ##############################
# export PATH=$PATH:/usr/local/share/pypy
# export PATH=$PATH:/conda/bin


# ##############################
# local
# ##############################
if [[ -f "$HOME/.bashrc.local" ]]; then
    . "$HOME/.bashrc.local"
fi

if [[ -f "$HOME/.bash_profile.local" ]]; then
    . "$HOME/.bash_profile.local"
fi

# conda
alias smoketest='py.test tests/test_create.py -k create_install'


# ##############################
# conda
# ##############################

# . $HOME/miniconda/etc/profile.d/conda.sh  # commented out by conda initialize


# export PATH="/conda44/bin:$PATH"
# source $HOME/miniconda/etc/profile.d/conda.sh  # commented out by conda initialize
# conda activate  # commented out by conda initialize

# . $HOME/miniconda/etc/profile.d/conda.sh  # commented by conda initialize
# export PATH="$HOME/devenv/bin:$PATH"

# eval "$('/Users/kfranz/miniconda/bin/conda' shell.bash hook)"

# export PATH="$HOME/conda/bin:$PATH"
# source  $HOME/miniconda/etc/profile.d/conda.sh


