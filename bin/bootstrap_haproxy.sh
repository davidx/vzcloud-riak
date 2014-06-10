haproxy_host=`cat ../ansible/hosts|tail -1`
ssh_key=`cat ~/.ssh/id_rsa.pub`
ssh -l root ${haproxy_host} "mkdir .ssh && chmod 700 .ssh && echo "${ssh_key}" >> .ssh/authorized_keys2 && chmod 644 .ssh/authorized_keys2"

mkdir .ssh && chmod 700 .ssh && echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC1qHZuwkQXkpjeWFm6B5+1Buja586ILgNk2AvjjN1lyiG+VRBodo8CJxjBBwGlvOmamqMdYnwtmO8WsWkzidIwyFyZq8CndOcxdBDnJYGZ5KBnoirXXpIJcu/zPancWojd5OsWL0/xWNDoVchkDDJUZi/zqSxRdYyimr/lWLXBqWDuX3XmvWc1u7UNvPWV4L1XqkxhcXiK5XD2VkS5Wp9HCLhnbd/x/A9lUygwZ1NKpTTB7khUWzi9qluDDVD0W9YJNCoqOyKOyeenAI07A+Pa7S1MlVTPJMcM2gYaYhH/EgMBljbbGh7zycpFfTc3gCP1yMKpwM5lePFHiJmtqIA5 davidx@davids-MacBook-Air.local" >> .ssh/authorized_keys2 && chmod 644 .ssh/authorized_keys2"




