function b64_to_p12() {
    cat "$1" | base64 -D > "${1}.p12"
}

function dfg() {
   grep -ri "$@" "$HOME/dotfiles" --exclude-dir=.git
}

function extract() {
    if [ -f $1 ]; then
        case $1 in
            *.tar.bz2)  tar -jxvf $1                        ;;
            *.tar.gz)   tar -zxvf $1                        ;;
            *.bz2)      bunzip2 $1                          ;;
            *.dmg)      hdiutil mount $1                    ;;
            *.gz)       gunzip $1                           ;;
            *.tar)      tar -xvf $1                         ;;
            *.tbz2)     tar -jxvf $1                        ;;
            *.tgz)      tar -zxvf $1                        ;;
            *.zip)      unzip $1                            ;;
            *.ZIP)      unzip $1                            ;;
            *.pax)      cat $1 | pax -r                     ;;
            *.pax.Z)    uncompress $1 --stdout | pax -r     ;;
            *.rar)      unrar x $1                          ;;
            *.Z)        uncompress $1                       ;;
            *)          echo "'$1' cannot be extracted/mounted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

function hg() {
    if [[ -n "$1" ]]
    then
        history | grep "$1"
    fi
}

function json_parse() {
    [[ -f "$1" ]] && node -e "console.log(JSON.stringify(JSON.parse(JSON.parse(require('fs').readFileSync('./$1', 'utf8'))), null, 2));"
}

function json_stringify() {
    [[ -f "$1" ]] && node -e "console.log(JSON.stringify(JSON.stringify(require('./$1'))))"
}

function open_p12() {
    if [[ -n "$1" ]]; then
        openssl pkcs12 -info -in "$1"
    fi
}

function port_process() {
    [[ -n "$1" ]] && sudo lsof -i ":$1"
}

function port_process_kill() {
    [[ -n "$1" ]] && lsof -t -i tcp:"$1" | xargs kill
}

function print_terminal_colors() {
    for code in {0..255}
        do echo -e "\e[38;5;${code}m"'\\e[38;5;'"$code"m"\e[0m"
    done
}

function remove_backslashes() {
    [[ -f "$1" ]] && sed 's/\\//g' < "$1"
}

function rgh() {
    rg "$@" $HOME
}

# Save a backup of whatever file is passed to this function.
# Directories are copied recursively.
function save() {
    local file="$1"
    [[ -z $file ]] && echo "No argument provided." && return 1
    [[ ! -e $file ]] && echo "$file does not exist." && return 2

    local base_saved_filename="$(basename "$file").save"
    local saved_filename=$base_saved_filename
    local n=1
    while [ -e $saved_filename ]; do
        saved_filename="${base_saved_filename}${n}"
        (( n += 1 ))
    done

    local backup=$(dirname "$file")/$saved_filename
    cp -R "$file" "$backup"
}
