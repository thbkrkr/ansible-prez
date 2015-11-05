#!/bin/bash -eu
#
# Ansible dynamic inventory based on Terraform state.

TF_STATE=$MACHINE_STORAGE_PATH/terraform.tfstate
SSH_PRIVATE_KEY_FILE="/ops/ssh/admin.id_rsa"
SSH_USER="admin"

hosts(){
  jq '.modules[0].resources | 
    to_entries | map(.value) | 
    map(select(.type == "openstack_compute_instance_v2")) | 
    .[] | 
    .primary.attributes ' $TF_STATE
}

main() {
  local action=$1
  local host=${2:-}

  case $action in
  --list)
    all=$(hosts | jq -s 'map(.name)')
    echo '{ "all" : '$all'}'
    ;;

  --host)
    data=$(hosts | jq 'select(.name == "'$host'")')
    ip=$( echo $data | jq '.access_ip_v4')
    
    ansible='{"ansible_ssh_user": "'$SSH_USER'","ansible_ssh_host": '$ip', "ansible_ssh_private_key_file": "'$SSH_PRIVATE_KEY_FILE'"}'
    echo "$data$ansible" | jq -s '.[0] * .[1]'
    ;;

  *)
    echo "error: action unknown. Use --list or --host <host>." && exit 1
  esac
}

main "$@"