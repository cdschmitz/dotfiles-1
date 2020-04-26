# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH"

# vi command line navigation
set -o vi

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Do not attempt to search the PATH for possible completions when
# completion is attempted on an empty line
shopt -s no_empty_cmd_completion

# Expand ! commands
bind Space:magic-space

# Load the shell dotfiles, and then some:
for file in ~/.{git-completion.bash,exports,aliases,functions,bash_prompt,bashrc,bashrc.local}; do
   [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Enable tab completion for `g` by marking it as an alias for `git`
if type __git_complete &> /dev/null; then
    __git_complete g __git_main
fi;

command -v pyenv &> /dev/null && eval "$(pyenv init -)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/cschmitz/.sdkman"
[[ -s "/Users/cschmitz/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/cschmitz/.sdkman/bin/sdkman-init.sh"
