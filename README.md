pip install -r requirements.txt
$ ssh-keygen -o -a 100 -t ed25519 -f ~/.ssh/id_ed25519_gcp_compute_gcp-ansible -C "first.last@domain.com"
$ ansible-playbook -i inventories/gcp-ansible.gcp.yml playbooks/10_infras.yml --tags "create"


Role Name
=========

A brief description of the role goes here.

Requirements
------------
google-auth, which can be installed by: ```pip install google-auth```

Role Variables
--------------

|  variable	|  default value	|
|---	|---	|
|  project  |  ```polkadot-benchmarks```  |
|  gcp_credentials  |  ```$HOME/.gcloud/credentials.json```  |
|  machine  |  ```n1-standard-1```  |
|  set_region  |  ```us-central1```  |
|  set_image  |  ```projects/ubuntu-os-cloud/global/images/family/ubuntu-1804-lts```  |
|  set_substrate_binary_url  |  ```https://github.com/lamafab/substrate-graph-benchmarks/releases/download/v0.1.0/substrate```  |
|  steps  |  ```10```  |
|  repeat  |  ```10```  |

Example Playbook
----------------
```yaml
- name: benchmark
  hosts: localhost
  gather_facts: yes
  roles:
     - substrate-benchmarks
```
Run with default values:
```ansible-playbook benchmarks.yaml```
Example with custom values:
```ansible-playbook -e machine='n1-standard-2' -e project='polkadot-benchmarks' benchmarks.yaml```
Test values:
```ansible-playbook -e steps=1 -e repeat=1 benchmarks.yaml```
