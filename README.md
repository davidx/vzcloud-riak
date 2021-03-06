vzcloud-riak
============


Intro
---------------------

How to deploy Riak in vzcloud.


Local Setup
---------------------
 - Install Xcode
 - Install Ansible

      ``sudo easy_install pip && sudo pip install ansible --quiet``

 - Install Basho Ansible Galaxy riak role

      ``ansible-galaxy install basho.riak basho.riak-common``


Cloud Setup
---------------------

- Create VM Instances
 - Login to vzcloud.  ( https://iadm1.cloud.verizon.com )
 - Launch 6 VMs. (Centos 6.5)
 - Add public network, reserve, allocate and capture public IP.
 - Configure Firewall (Example AWS Rules): 
   
   ![Alt text](http://photos.adron.me/Software/Software-Development/Installing-Riak-on-AWS/i-L32qd67/0/625x162/install%204-625x162.png "Optional title")


Riak cluster Setup
-----

- Grab vzcloud-riak helper repo

```
git clone https://github.com/davidx/vzcloud-riak
cd vzcloud-riak
cd riak

```

- Set cluster IP addresses

``./generate_hosts.sh  202.12.32.12:10.10.10.1,10.10.10.3,10.10.10.4
 

- Disable iptables on all hosts. ( todo: manage rules in ansible ) 

  ``iptables -F`` 
  
- Deploy your ssh key on remote nodes ( todo: preset key )
  
 ``vi /root/ssh/authorized_keys``

- Run Ansible to bootstrap Riak cluster:

 ``ansible-playbook setup_riak.yml -i inventory/hosts``
 
 or
 ---
  ``sh run_ansible_remote.sh``

 This step will: 
  - Bootstrap nodes to ensure basic dependencies.
  - Install and configure Riak.
  - Join nodes together into a working cluster.

Todo
---

- Develop custom ansible playbook for tuning riak on vzcloud default image.
- Integrate ansible playbook for iptables .
- Develop Haproxy and orchestration node playbook.
- Create template for riak nodes.

Links
------

- https://devopsu.com/guides/ansible-mac-osx.html
- http://docs.basho.com/riak/latest/
- http://docs.basho.com/riak/latest/ops/advanced/security/
- https://github.com/geerlingguy/ansible-role-firewall



