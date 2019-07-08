# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# User configuration

source $(fzf-share)/completion.zsh
source $(fzf-share)/key-bindings.zsh

setopt print_exit_value
unsetopt share_history
FIGNORE=".o:~"
LISTMAX=0
LOGCHECK=300
MAILCHECK=0
REPORTTIME=60

zstyle :omz:plugins:ssh-agent agent-forwarding on
zstyle :omz:plugins:ssh-agent lifetime 4h
zstyle ':vcs_info:*' enable git
setopt NOCLOBBER
setopt no_nomatch # when pattern matching fails, simply use the command as is

function wp() {
  cd ~/work/git/$1;
}
_wp() {
  _files -W ~/work/git/
}
compdef _wp wp

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
