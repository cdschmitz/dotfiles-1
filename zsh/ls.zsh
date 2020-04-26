# github.com/trapd00r/LS_COLORS
export LSCOLORS="gxfxcxdxbxegedabagacad"
export LS_COLORS='di=36:ex=31:ln=35:or=41:mi=41:pi=93'

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

if $(command -v gls &> /dev/null); then
    alias ls="gls --color -Flhp --group-directories-first"
fi
