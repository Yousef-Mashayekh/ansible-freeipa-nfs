#!/bin/bash

ansible ipaclients -m user -a "name=sysadmin state=present" -b
ansible ipaclients -m file -a "path=/home/sysadmin/.ssh/authorized_keys state=directory owner=sysadmin group=sysadmin mode='0700'" -b
ansible ipaclients -m copy -a "src=/root/.ssh/id_rsa.pub dest=/home/sysadmin/.ssh/authorized_keys owner=sysadmin group=sysadmin mode='0600'" -b
ansible ipaclients -m copy -a "dest=/etc/sudoers.d/sysadmin content='sysadmin All=(ALL) NOPASSWD:ALL' mode='0440'" -b
