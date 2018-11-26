#!/bin/bash
INVENTORY=inventories/prod
KEYFILE=~/.ssh/id_ed25519

#ansible-playbook -i $INVENTORY  infrastructure/ansible_playbook-create-infrastructure.yml
ansible-playbook -vvv --ssh-extra-args="-o IdentitiesOnly=yes -o ControlMaster=no" --private-key $KEYFILE -i $INVENTORY  ansible_playbook-setup-env.yml
