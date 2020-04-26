function gdb() {
    local target="$1"
    local current="$2"
    if [[ "$#" -eq 1 ]]; then
        current="$(git rev-parse --abbrev-ref HEAD)"
    fi
    git log --oneline "$target".."$current"
}
