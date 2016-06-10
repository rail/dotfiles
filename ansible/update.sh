#!/bin/bash
HERE=$(dirname $0)
INV=$HERE/inventory
sudo ansible-playbook --verbose -i $INV $HERE/system.yml
ansible-playbook -i $INV $HERE/dotfiles.yml
