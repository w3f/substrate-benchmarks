# Ansible Collection - w3f.benchmark

Collection Name
=========

This Collection will create a compute instance on GCP and run substrate benchmark on it.

Requirements
------------
google-auth, which can be installed by: ```pip install google-auth requests apache-libcloud``` or by ```pip install -r requirements.txt```.



Example Playbook
----------------
```yaml
- name: Configure
  hosts: localhost
  gather_facts: no
  connection: local
  tasks:
  - name: Set provider
    set_fact:
      provider: gcp

- name: Provision
  hosts: localhost
  gather_facts: no
  connection: local
  tasks:
  - name: Provision benchmark
    include_role:
      name: "{{ provider }}"
    vars:
      stage: CREATE
      machine_type: "n1-standard-1"
  - name: Add key to ssh-agent
    shell: ssh-add id_ed25519
  - git:
      repo: 'https://github.com/w3f/polkadot-module-benchmarking.git'
      dest: roles/substrate-benchmarks

- name: Run Benchmark
  hosts: substrate-benchmarks
  gather_facts: yes
  tasks:
  - ping:
  roles:
    - role: substrate-benchmarks

- name: Clean
  hosts: localhost
  gather_facts: no
  connection: local
  tasks:
  - name: destroy instance
    include_role:
      name: "{{ provider }}"
    vars:
      stage: DESTROY
```
Run with default values:
```ansible-playbook benchmarks.yaml```
