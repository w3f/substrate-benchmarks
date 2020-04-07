Role Name
=========

This role will create a compute instance on GCP.

Requirements
------------
google-auth, which can be installed by: ```pip install google-auth requests apache-libcloud``` .


Dependencies
------------

TBA.

Example Playbook
----------------
```yaml
- name: Provision
  hosts: localhost
  gather_facts: no
  connection: local
  tasks:
  - name: Provision benchmark
    include_role:
      name: gcp
    vars:
      stage: CREATE
      machine_type: "n1-standard-1"

```
License
-------

Apache license 2.0
