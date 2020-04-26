# Make vim the default editor
export EDITOR='vim'

# Dont tab complete .svn directories
export FIGNORE=.svn

# Ignore commands that start with spaces and duplicates
export HISTCONTROL='ignoreboth'

# Increase the maximum number of lines contained in the
# history file (default value is 500)
export HISTFILESIZE=10000

# Don't add certain commands to the history file
export HISTIGNORE='&:[bf]g:cd:h:ls:s:u:history:pwd'

# Prefer US English and use UTF-8 encoding
export LANG='en_US'
export LC_ALL='en_US.UTF-8'

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

export TERM="xterm-color"
#unset COLORFGBG
