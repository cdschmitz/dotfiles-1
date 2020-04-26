function docker_remove_exited() {
    docker rm -f $(docker ps -q -a -f status=exited)
}
