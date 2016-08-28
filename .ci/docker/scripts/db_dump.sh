#!/usr/bin/env bash -e

# This script starts a psql shell inside of the container running Gerrit's
# database.

if [[ $1 == "-h" || $1 == "--help" ]]; then
  echo "DESCRIPTION: Executes pg_dump inside of the container running postgres."
  echo "      USAGE: $0 > <output file>"
  exit 0
fi

source $(dirname ${BASH_SOURCE[0]})/functions.sh
source $(dirname ${BASH_SOURCE[0]})/../postgres/environment.env

container=$(GetContainerIDByName "gerrit_db")
if [[ $? -ne 0 ]]; then
  echo $container
  exit 1
fi

command="docker exec --interactive --tty $container pg_dump --username=$POSTGRES_USER $POSTGRES_DB"
echo $command
$command
