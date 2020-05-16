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

function aws_rds_download_error_logs() {
    db=$1
    AWS_PAGER=

    for file in $(aws rds describe-db-log-files --db-instance-identifier "$db" --filename-contains error --query 'DescribeDBLogFiles[*].LogFileName' --output text); do
        echo "Downloading: $file"

        local_filename="$(basename $file)"
        aws rds download-db-log-file-portion \
            --db-instance-identifier "$db" \
            --log-file-name "$file" \
            --starting-token 0 \
            --output text \
            > "$local_filename"
    done
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
