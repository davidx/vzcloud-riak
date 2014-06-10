cd `dirname $0`
haproxy_host=`cat ../ansible/hosts|tail -1`
echo " rsync -e "ssh -l root" -av .. ${haproxy_host}:./ansible"
