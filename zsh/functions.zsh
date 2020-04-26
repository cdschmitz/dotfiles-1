function b64_to_p12() {
    cat "$1" | base64 -D > "${1}.p12"
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

function remove_backslashes() {
    [[ -f "$1" ]] && sed 's/\\//g' < "$1"
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
