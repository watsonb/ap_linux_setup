#!/bin/bash

#
# Runs the Ansible create.yml playbook
#

# Parse options
while getopts ":hi:e:k:" opt; do
  case ${opt} in
    h )
      printf "Usage:"
      printf "  create -h                   Display this help message."
      printf "  create -i <inventory> -e <host/group>      Create linux machines in the ansible <inventory> identifed by <host/group>."
      exit 0;;
    i )
      inventory=$OPTARG;;
    e )
      host_group=$OPTARG;;
    k )
      key=$OPTARG;;
    \? )
      printf "Invalid Option: -$OPTARG" 1>&2
      exit 1;;
    : )
      printf "Invalid option: -$OPTARG requires an argument" 1>&2
      exit 1;;
  esac
done
shift $((OPTIND -1))

if [[ -n "$inventory" ]]; then
  #pass
  printf "\nusing inventory at: $inventory\n"
else
  printf "\nYou must supply a path to an Ansible inventory via the -i option\n"
  exit 1
fi

if [[ -n "$host_group" ]]; then
  #pass
  printf "\ncreating host/group identified by: $host_group\n"
else
  printf "\nYou must supply a host or group within your ansible inventory via the -e option\n"
  exit 1
fi

if [[ -n "$key" ]]; then
  #pass
  printf "\nusing key: $key\n"
else
  printf "\nYou must supply a private-key via the -k option\n"
  exit 1
fi

set -e
set +x

printf "\nSetting up a virtualenv to run the playbook\n"

printf "\nInstalling OS packages...\n"
sudo apt install -y python python-virtualenv || sudo yum -y install python python-virtualenv

printf "\nCreating Python virtual environment...\n"
virtualenv $HOME/venv_ansible
cp -r /usr/lib64/python2.7/site-packages/selinux/ $HOME/venv_setup/lib/python2.7/site-packages/ || true

printf "\nActivating virtual environment...\n"
source $HOME/venv_ansible/bin/activate

printf "\nPip installing required python modules...\n"
pip install -r requirements.txt
# not sure why the below is necessary, but without it, we're missing some
# azure modules and cannot create a resource group
pip install ansible[azure] --upgrade --force

export ANSIBLE_FORCE_COLOR=true

printf "\nInstalling the playbook requirements via ansible-galaxy...\n"

ansible-galaxy install -r roles/requirements.yml -p roles/ --force

printf "\nRunning the create.yml playbook against $inventory\n"
ansible-playbook linux_base_server.yml -i $inventory -e "variable_host=$host_group" --private-key=$key

printf "\nCleaning up\n"
deactivate
# rm -rf $HOME/venv_ansible
rm -rf $(ls -1 -d roles/*/)