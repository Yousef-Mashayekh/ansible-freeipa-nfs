# ansible-freeipa-nfs
Ansible‑automated FreeIPA environment for centralized identity management, user provisioning, secure home directory mapping, and multi‑host orchestration.

**Technologies Used**: Ansible, FreeIPA, NFS, RHEL, autofs 

**21 directories, 16 files**
[root@st-masternode ansible-freeipa-nfs]#
.
├── ansible.cfg
├── collections
│   ├── ansible_collections
│   │   ├── ansible
│   │   │   └── posix
│   │   ├── ansible.posix-1.5.4.info
│   │   │   └── GALAXY.yml
│   │   ├── freeipa
│   │   │   └── ansible_freeipa
│   │   └── freeipa.ansible_freeipa-1.16.0.info
│   │       └── GALAXY.yml
│   └── requirements.yml
├── docs
├── group_vars
│   ├── all.yml
│   ├── ipaclients.yml
│   ├── user_list.yml
│   └── user_passwords.yml
├── host_vars
├── inventory
│   └── hosts.ini
├── LICENSE
├── playbooks
│   ├── create_users.yml
│   ├── install-client.yml
│   ├── ipaserver.yml
│   └── site.yml
├── README.md
├── roles
│   └── nfs_server
│       ├── defaults
│       │   └── main.yml
│       ├── files
│       ├── handlers
│       │   └── main.yml
│       ├── meta
│       │   └── main.yml
│       ├── README.md
│       ├── tasks
│       │   └── main.yml
│       ├── templates
│       │   ├── auto.master.j2
│       │   └── exports.j2
│       ├── tests
│       │   ├── inventory
│       │   └── test.yml
│       └── vars
│           └── main.yml
├── secret.txt
└── users.sh

**Prerequisites**

### Infrastructure
- 1x IPA server (RHEL/CentOS 8+), fully patched
- 3+ IPA clients enrolled in the domain (e.g. ym-client1, ym-client2, ym-client3)
- A control node (e.g. st-masternode) with Ansible installed and SSH access to all managed hosts
- All hosts resolvable via FreeIPA-integrated DNS (forward **and** reverse/PTR records — required for NFS export ACLs based on hostname wildcards)

### Software
- Ansible 2.14+ (or whatever minimum version your collection requires — confirm with 'ansible --version')
- 'freeipa.ansible_freeipa' collection installed:

ansible-galaxy collection install freeipa.ansible_freeipa

- 'nfs-utils' and 'autofs' packages installed on all clients
- Passwordless SSH (or equivalent Ansible connection method) from the control node to every managed host
- Python 3 available on all managed hosts (required by Ansible modules)

### Access & Credentials
- IPA Directory Manager password
- IPA admin password
- A vault password file or '--ask-vault-pass' access to decrypt 'group_vars/<vault-file>.yml'
- Root or sudo ('become: true') access on all managed hosts

### Network
- Firewall rules allowing NFS (2049), rpcbind (111), and mountd's dynamic port range between all clients
- DNS reverse zone(s) configured for your subnet(s) (e.g. '23.1.10.in-addr.arpa.') with PTR records for every client host

### Before running
- Confirm 'group_vars/all.yml' contains all required variables ('ipaserver_domain', 'ipaserver_realm', 'ipadm_password', 'ipaadmin_password', etc.)
- Confirm your vault file (e.g. 'group_vars/user_list.yml') contains user entries with 'username', 'first', 'last', 'password', 'homedirectory', and 'home_host'

