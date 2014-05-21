#!bash

cd `dirname $0`
cd riak &&
ansible-playbook -i inventory/hosts setup_riak.yml
