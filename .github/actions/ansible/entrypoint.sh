#!/bin/sh

chmod 0700 /ansible/key
ansible-playbook --private-key=/ansible/key --vault-password-file=/ansible/password -u root -i /ansible/hosts /ansible/deploy.yml -vvv