# 256 color terminal
export CLICOLOR=1
export TERM=xterm-256color

# Make vim the default editor
export EDITOR='vim'

# Dont tab complete .svn directories
export FIGNORE=.svn

# Ignore commands that start with spaces and duplicates
export HISTCONTROL='ignoreboth'

export HISTFILE=~/.zsh_history

# Increase the maximum number of lines contained in the
# history file (default value is 500)
export HISTFILESIZE=10000
export HISTSIZE=10000
export SAVEHIST=10000

# Don't add certain commands to the history file
export HISTIGNORE='&:[bf]g:cd:h:ls:s:u:history:pwd'

# Prefer US English and use UTF-8 encoding
export LANG='en_US'
export LC_ALL='en_US.UTF-8'

# Don't use pager for command if output if it fits on the screen
export LESS="-RFX"

# Use custom `less` colors for man pages
# https://www.gnu.org/software/termutils/manual/termutils-2.0/html_chapter/tput_1.html
export LESS_TERMCAP_md=$'\E[1;32m'   # begin bold mode
export LESS_TERMCAP_me=$'\E[0m'      # end bold mode

# Don't clear the screen after quitting a man page
export MANPAGER='less -X'
export MANPATH="/usr/local/man:$MANPATH"

# Make new shells get the history lines from all previous
# shells instead of the default "last window closed" history
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"


setopt COMPLETE_IN_WORD
setopt CORRECT
setopt EXTENDED_HISTORY # add timestamps to history
setopt HIST_VERIFY
setopt IGNORE_EOF
setopt LOCAL_OPTIONS # allow functions to have local options
setopt LOCAL_TRAPS # allow functions to have local traps
setopt NO_BG_NICE # don't nice background tasks
setopt NO_HUP
setopt PROMPT_SUBST
setopt SHARE_HISTORY # share history between sessions ???

unsetopt BEEP
unsetopt LIST_BEEP
setopt NO_LIST_BEEP

setopt APPEND_HISTORY # adds history
setopt HIST_IGNORE_ALL_DUPS  # don't record dupes in history
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY SHARE_HISTORY  # adds history incrementally and share it across sessions

# don't expand aliases _before_ completion has finished
#   like: git comm-[tab]
setopt complete_aliases


bindkey -v
bindkey 'jf' vi-cmd-mode
bindkey " " magic-space
#bindkey '^[^[[D' backward-word
#bindkey '^[^[[C' forward-word
#bindkey '^[[5D' beginning-of-line
#bindkey '^[[5C' end-of-line
#bindkey '^[[3~' delete-char
#bindkey '^?' backward-delete-char
