function aws_ec2_instance_by_ip() {
    aws ec2 describe-instances \
        --filter Name=private-ip-address,Values="$1"
}

function aws_ec2_instance_private_ip_by_tag_name() {
    local tag="$1"
    [[ -n "$tag" ]] && \
        aws ec2 describe-instances \
            --filter "Name=tag:Name,Values=$tag" \
            --query 'Reservations[0].Instances[0].PrivateIpAddress' \
            --output text
}

function aws_route53_get_hosted_zone_id() {
    [[ -n "$1" ]] && \
        aws route53 list-hosted-zones --query "HostedZones[?Name == '$1'].Id" --output text
}

function aws_route53_get_resource_record_sets() {
    local hosted_zone_id="$(aws_route53_get_hosted_zone_id $1)"
    shift
    [[ -n "$hosted_zone_id" ]] && \
        aws route53 list-resource-record-sets --hosted-zone-id "$hosted_zone_id" --query 'sort_by(ResourceRecordSets, &Name)' "$@"
}
