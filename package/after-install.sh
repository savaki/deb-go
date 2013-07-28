#!/bin/bash

set -u
set -e

cat <<EOF | sudo tee -a /etc/profile

# install go path
export PATH=\${PATH}:/usr/local/go/bin

EOF


