#!/bin/bash
ansible-playbook -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory ansible/cluster-provision.yml --extra-vars "$@"
