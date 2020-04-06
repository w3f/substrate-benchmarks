Role Name
=========

A brief description of the role goes here.

Requirements
------------

gcloud iam service-accounts create ansible-sa \
     --display-name "Service account for Ansible"

gcloud compute project-info add-metadata \
   --metadata enable-oslogin=TRUE

 for role in \
     'roles/compute.instanceAdmin' \
     'roles/compute.instanceAdmin.v1' \
     'roles/compute.osAdminLogin' \
     'roles/iam.serviceAccountUser'
 do \
     gcloud projects add-iam-policy-binding \
         my-gcp-project-241123 \
         --member='serviceAccount:ansible-sa@my-gcp-project-241123.iam.gserviceaccount.com' \
         --role="${role}"
 done

 gcloud iam service-accounts keys create \
     .gcp/gcp-key-ansible-sa.json \
     --iam-account=ansible-sa@my-gcp-project.iam.gserviceaccount.com

ssh-keygen -f ssh-key-ansible-sa

gcloud auth activate-service-account \
    --key-file=.gcp/gcp-key-ansible-sa.json

gcloud compute os-login ssh-keys add \
    --key-file=ssh-key-ansible-sa.pub

    gcloud iam service-accounts describe \
        ansible-sa@my-gcp-project.iam.gserviceaccount.com \
        --format='value(uniqueId)'
    112132868898095905719

Any pre-requisites that may not be covered by Ansible itself or the role should be mentioned here. For instance, if the role uses the EC2 module, it may be a good idea to mention in this section that the boto package is required.

Role Variables
--------------

A description of the settable variables for this role should go here, including any variables that are in defaults/main.yml, vars/main.yml, and any variables that can/should be set via parameters to the role. Any variables that are read from other roles and/or the global scope (ie. hostvars, group vars, etc.) should be mentioned here as well.

Dependencies
------------

A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: username.rolename, x: 42 }

License
-------

BSD

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).
