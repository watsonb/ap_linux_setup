#!/bin/bash

# syntax check
find . -type f -name "*.yml" ! -path "*/roles/*" ! -path "*/molecule/*" ! -path "*/collections/*" ! -path "*/tests/*" ! -name "inventory.yml" ! -path "*/tasks/*" -exec sh -c 'ansible-playbook -i utils/inventory.yml -e variable_host=localhost "{}" --syntax-check' \;
