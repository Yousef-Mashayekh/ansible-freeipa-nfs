# ansible-freeipa-nfs
Ansible‑automated FreeIPA environment for centralized identity management, user provisioning, secure home directory mapping, and multi‑host orchestration.

Task 1 Summary — FreeIPA User Home Directory Automation
- Installed ansible-core on the control node
- Created the scaffolding of sorts to establish a structure including the inventory, group_vars, and playbooks directories
- Did the same for the nfs_server role I'll be configuring
- Configured an ansible.cfg file to define project wide configurations
Task 2 Summary - Inventory and local user creation
- Created an inventory file
- Created "sysadmin" user on each ipaclient
- Copyied ssh keys
- Gave users sudoer privileges
Task 3 Summary - Defined group_vars variables
- Global settings were placed in all.yml
- IPA client specific settings were placed in ipaclients.yml
