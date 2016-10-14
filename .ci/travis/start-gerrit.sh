#!/bin/bash -ex

# TODO - Remove '-x' from shebang

[ -f helper-functions.sh ] || curl -L -o helper-functions.sh https://raw.githubusercontent.com/opalmer/docker-gerrittest/master/helper-functions.sh --fail
. helper-functions.sh

RunContainer
CreateAdminAccount
private_key=$(GenerateSSHPrivateKey)
AddAdminSSHKey $private_key
