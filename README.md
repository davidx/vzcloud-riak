
How to setup a Riak image on Verizon Cloud
-----------------------

- Tested on AWS EC2 AMI image: Debian 7 (ami-646ee40c)

### Image Bootstrap ###
- Install prerequisites:
``````````
$> sudo -s
$> apt-get update
$> apt-get install -y curl python 
$> curl https://packagecloud.io/gpg.key | sudo apt-key add -
$> sudo apt-get install -y --force-yes  apt-transport-https
$> apt-get update
$> echo "ulimit -n 65539" >> /etc/default/riak
``````````
- Add basho source 

 ``````````
$> printf "deb https://packagecloud.io/basho/riak/debian/ wheezy main\n deb-src https://packagecloud.io/basho/riak/debian/ wheezy main" > /etc/apt/sources.list.d/basho.list 
$> apt-get update
 ``````````
- Install Riak
 ``````````
$> apt-get update
$> apt-get install riak
 ``````````
- Configure Riak
 ``````````
$> sed -i.bak 's/127.0.0.1/0.0.0.0/' /etc/riak/riak.conf
 ``````````
- Start Riak
 ``````````
$> riak start
 ``````````


