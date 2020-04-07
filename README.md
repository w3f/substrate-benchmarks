pip install -r requirements.txt

Role Name
=========

This role will create a compute instance on GCP and run substrate benchmark on it.

Requirements
------------
google-auth, which can be installed by: ```pip install google-auth requests apache-libcloud``` or by ```pip install -r requirements.txt```.



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
