### Installation Defaults ##
# Set up the prompt
autoload -Uz promptinit
promptinit

# History settings
setopt sharehistory
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

## zsh Plugins ##
source ~/.zsh/zsh-z/zsh-z.plugin.zsh
# source /etc/zsh_command_not_found

# Use modern completion system
autoload -Uz compinit
compinit

# Colored ls output (copied from Ubuntu's bashrc)
# This eval's LS_COLORS, so should run before zstyles
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

## Most zstyle defaults ##
zstyle ':completion:*' auto-description 'specify: %d'
# Complete, expand partial paths, but don't autocorrect or fill in ambiguities
zstyle ':completion:*' completer _expand _complete
# Display all groups of matches separatley
zstyle ':completion:*' group-name ''
# Use the same GNU LS colors for default completion
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
# Prompt for output that doesn't fit on screen
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
# Default matcher-list: case insensitive, then allowing expansion from right to
# left (including with some symbols)
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
# Always use menu selection
zstyle ':completion:*' menu select
# Scrolling prompt
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
# Disable use of additional compctl stylings
zstyle ':completion:*' use-compctl false
# Shoe more information for completion listings
zstyle ':completion:*' verbose true
# Better output (and color) for kill autocompletion
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

## Other general options ##
# Ensure that we list all ambiguities right away (no second tab press to get list)
setopt nolistambiguous
# Use extended globbing capabilities
setopt extended_glob

### Begin adolan defined ###

# Use vim, dummy
export EDITOR=vim

# Source external files
source ~/.zsh_aliases

## Functions ##
hag() {
  # history 0 | grep "$1"
  history 0 | ag "$1"
}

# Simple open (Debian, graphical)
x() {
  for f in "$@"
  do
    xdg-open "$f"
  done
}

## Custom, ssh-remote-aware prompt ##
HOSTPROMPT="%m"
if [ -z $SSH_CLIENT ]
then
  HOSTPROMPT=""
fi
PROMPT="%B%F{10}%n%F{207}@$HOSTPROMPT%F{45}|%2~%F{21}][%f%b "
unset HOSTPROMPT

## Key bindings ##
# Use vim keybindings
bindkey -v
bindkey '^P' up-line-or-search
bindkey '^N' down-line-or-search
bindkey '^R' history-incremental-search-backward
bindkey '^U' backward-kill-line
bindkey '^Y' vi-put-after
bindkey '^[[Z' reverse-menu-complete

# Proper use of command-not-found, because /etc/zsh_command_not_found has a bug
# that results in no error output on missing command with no suggestion; see:
# https://bugs.launchpad.net/ubuntu/+source/command-not-found/+bug/1766068
# This version is literally copied from /etc/zsh_command_not_found but removes
# the --no-failure-msg
if [[ -x /usr/lib/command-not-found ]] ; then
	if (( ! ${+functions[command_not_found_handler]} )) ; then
		function command_not_found_handler {
			[[ -x /usr/lib/command-not-found ]] || return 1
			/usr/lib/command-not-found -- ${1+"$1"} && :
		}
	fi
fi

# Configure fzf for completion
source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh
# Alternative for completion if not yet included in package (manual download)
# source /home/adolan/.fzf/completion.zsh

### End adolan defaults ###
