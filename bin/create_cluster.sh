cd `dirname $0`
# main outline script

# Steps:

# API:
#  create 6 instances
#  1: with dual nic

#  5: with internal nic
#API Call : create 5 nodes using premade image 'riak-server' centos6.4
create internal network for cluster
connect nodes to network
#or
#Manual: go to https://iadm1.cloud.verizon.com/#vm and create 5 nodes generic centos6.4
turn off, add network interface to internal
#- disable iptables   iptables -F
#- disable selinux    setenforce 0
#- disable password expiry
#- route add default gw 10.10.0.2
on loadbalancer:

echo 1 > /proc/sys/net/ipv4/ip_forward
/sbin/iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
# /sbin/iptables -A FORWARD -i eth0 -o eth1 -m state
   --state RELATED,ESTABLISHED -j ACCEPT
# /sbin/iptables -A FORWARD -i eth1 -o eth0 -j ACCEPT

# SCRIPT: render names in hosts file

#  fix issues that should be in image, iptables
haproxy_host=`cat ../ansible/hosts|tail -1`
# bootstrap ansible host.

# run ansible remote
ssh vzcloud@${haproxy_host} "sudo yum -y upgrade && 
  sudo yum groupinstall "Development tools" -y       &&
  sudo yum install git python-devel python-setuptools -y   &&
  sudo easy_install pip                                     &&
  sudo pip install ansible                                     &&
  sudo mkdir -p /etc/ansible &&
  sudo ansible-galaxy install basho.riak"

rsync -e "ssh -l vzcloud" -av .. ${haproxy_host}:./vzcloud
ssh  vzcloud@${haproxy_host} "cd vzcloud/bin && sudo sh run_ansible.sh"

