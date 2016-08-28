#!/usr/bin/env bash -e

# This script starts a psql shell inside of the container running Gerrit's
# database.

if [[ $1 == "-h" || $1 == "--help" ]]; then
  echo "DESCRIPTION: Runs bash inside of the requested container"
  echo "      USAGE: $0 <container name>"
  exit 0
fi

container_name=$1

source $(dirname ${BASH_SOURCE[0]})/functions.sh

container=$(GetContainerIDByName "$container_name")
if [[ $? -ne 0 ]]; then
  echo $container
  exit 1
fi

command="docker exec --interactive --tty $container bash"
echo $command
$command
