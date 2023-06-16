#!/bin/bash

# lint
find . -type f -name "*.yml" ! -path "*/roles/*" ! -path "*/molecule/*" ! -path "*/collections/*" ! -path "*/utils/*" ! -path "*/tests/*" -exec sh -c 'ansible-lint "{}" --offline' \;
