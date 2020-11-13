function docker_remove_exited() {
    docker rm -f $(docker ps -q -a -f status=exited)
}

function kubectl_get_pod_names() {
    kubectl get pods "$@" --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}'
}
