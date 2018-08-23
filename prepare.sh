#!/bin/bash
cat Vagrantfile |grep -v '\#' | grep '=>' |awk -F '\"' '{print $4, $2".microhosting.local"}' > hosts.file
cat hosts.file >> /etc/hosts
cat hosts.file |awk '{print $1}' > hosts.setup
ansible-playbook -i hosts.setup  roles/setup/tasks/main.yml  -c paramiko --ask-pass --sudo -e 'ansible_python_interpreter=/usr/bin/python3'

