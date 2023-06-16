#!/bin/bash

# ensure roles are installed
ansible-galaxy install -r roles/requirements.yml -p roles --force

# install collections
ansible-galaxy collection install -r collections/requirements.yml -p collections --force -c
