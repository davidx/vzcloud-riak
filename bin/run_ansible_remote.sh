cd `dirname $0`
haproxy_host=`cat ../ansible/hosts|tail -1`
echo ${haproxy_host}
eval `ssh-agent`
ssh-add ~/.ssh/id_rsa
rsync -e "ssh -A -l vzcloud" -av --progress .. ${haproxy_host}:./vzcloud
ssh -l vzcloud ${haproxy_host} "cd vzcloud/bin && sudo sh run_ansible.sh"
