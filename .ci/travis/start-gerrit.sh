#!/bin/bash

DOCKER_IMAGE=opalmer/gerrittest:2.13.2

[ -f helper-functions.sh ] || curl -L -o helper-functions.sh https://raw.githubusercontent.com/opalmer/gerrittest/master/docker/helper-functions.sh --fail
. helper-functions.sh

RunContainer
CreateAdminAccount
private_key=$(GenerateSSHPrivateKey)
AddAdminSSHKey $private_key

echo "http://admin:secret@$(GerritAddress):$(PORT_HTTP)/" > gerrit-url
echo $private_key > gerrit-private-key

