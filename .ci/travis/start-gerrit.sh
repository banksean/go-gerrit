#!/bin/bash -ex

# TODO - Remove '-x' from shebang

[ -f helper-functions.sh ] || curl -o helper-functions.sh https://github.com/opalmer/docker-gerrittest/raw/master/helper-functions.sh --fail
. helper-functions.sh

RunContainer
CreateAdminAccount
private_key=$(GenerateSSHPrivateKey)
AddAdminSSHKey $private_key
