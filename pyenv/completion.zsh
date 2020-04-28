# Initialize in completion.zsh because it runs after other init scripts
command -v pyenv &> /dev/null && eval "$(pyenv init -)"
