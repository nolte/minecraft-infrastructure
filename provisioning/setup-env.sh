#!/bin/bash
INVENTORY=inventories/prod
KEYFILE=~/.ssh/id_ed25519
export ANSIBLE_HOST_KEY_CHECKING=False
#ansible-playbook  -i $INVENTORY  infrastructure/ansible_playbook-create-infrastructure.yml
ansible-playbook  -i $INVENTORY  master_playbook-setup-env.yml --extra-vars "mc_accept_eula=true"
