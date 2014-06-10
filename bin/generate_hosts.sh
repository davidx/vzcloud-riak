#!/bin/sh


hosts=$1

usage(){
	  echo "Usage: ./generate_hosts.sh <loadbalancer_ips>:<riak_comma_separated_ips>  > hosts"
      echo "Example: ./generate_hosts.sh 202.12.13.23:10.10.1.2,10.10.1.3,10.10.1.4,10.10.1.5 > hosts"
	  exit 1
}


[[ $# -eq 0 ]] && usage


lbs=`echo $hosts |cut -d":" -f 1 `
riak_nodes=`echo $hosts |cut -d":" -f 2|tr , '\n'`

echo "[riak_cluster]"
echo "$riak_nodes"
echo "[riak_servers:children]
riak_cluster

[haproxy_cluster]"
echo "$lbs"


