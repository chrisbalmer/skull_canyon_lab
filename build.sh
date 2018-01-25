#!/bin/bash

ROOT_DIR=$(pwd)
APPLIANCES_DIR=$ROOT_DIR/appliances
TERRAFORM_ESXI_DIR=$ROOT_DIR/terraform-esxi
TERRAFORM_VM_DIR=$ROOT_DIR/terraform-vm

# Pull settings from JSON file
eval "$(cat settings.json | jq -r '.ESXI | to_entries | .[] | .key + "=\"" + .value + "\""')"
eval "$(cat settings.json | jq -r '.VM_TEMPLATES | join(" ") | "VM_TEMPLATES=(" + . + ")"')"

cd $TERRAFORM_ESXI_DIR

terraform apply \
    -var "vsphere_user=$ESXI_USER" \
    -var "vsphere_password=$ESXI_PASS" \
    -var "vsphere_server=$ESXI_HOST" \
    -var "ds_name=$ESXI_DS" \
    -var "pg_access_name=$ESXI_PG" \
    -var "switch_name=$ESXI_SWITCH" \
    -var "license=$ESXI_LICENSE"


# Deploy OVAs
cd $APPLIANCES_DIR
for vm in ${VM_TEMPLATES[@]}; do
    . ./deploy.sh $vm
done

# Convert OVAs to Templates