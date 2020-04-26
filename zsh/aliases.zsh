alias u="cd .."
alias u2="cd ../.."
alias u3="cd ../../.."
alias u4="cd ../../../.."
alias u5="cd ../../../../.."
alias u6="cd ../../../../../.."
alias u7="cd ../../../../../../.."

alias .aco="vim $HOME/.aws/{config,credentials}"
alias .g="vim $HOME/.gitconfig"
alias .sshc="vim $HOME/.ssh/config"
alias .sshh="vim $HOME/.ssh/known_hosts"
alias .v="vim $HOME/.vimrc"
alias .vim="cd $HOME/.vim"
alias .z="vim $HOME/.zshrc"
alias dotfiles="cd ~/dotfiles"
alias envs="env | sort"
alias g="git"
alias grep="grep --color"
alias h="history"
alias hosts="sudo $EDITOR /etc/hosts"
alias myps="ps -ef | grep $USER"
alias s="source $HOME/.bash_profile"
alias toxi="toxiproxy-cli"

# ls
# LC_COLLATE=C  -->  ascii sort
if ls --color > /dev/null 2>&1; then  # GNU
    colorflag="--color"
else  # OSX
    colorflag="-G"
fi

if ls --group-directories-first &> /dev/null; then
    dirflag="--group-directories-first"
else
    dirflag=""
fi

alias ls="CLICOLOR_FORCE=1 ls -Flhp ${colorflag} ${dirflag}"
alias lsa="ls -a"
alias lsd="ls | grep '^d'"
unset colorflag
unset dirflag
unset OS
