#!bash

cd `dirname $0` &&
cd ../ansible
ansible-playbook -i hosts setup_haproxy.yml   -u root
ansible-playbook -i hosts setup_riak.yml   -u root
