function hg() {
    if [[ -n "$1" ]]
    then
        history | grep "$1"
    fi
}

function kill_process_on_port() {
    [[ -n "$1" ]] && lsof -t -i tcp:"$1" | xargs kill
}
