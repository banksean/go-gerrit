#!/usr/bin/env bash -e

# This script starts a psql shell inside of the container running Gerrit's
# database.

if [[ $1 == "-h" || $1 == "--help" ]]; then
  echo "DESCRIPTION: Runs psql inside of the container running Postgres"
  echo "      USAGE: $0"
  exit 0
fi

source $(dirname ${BASH_SOURCE[0]})/functions.sh
source $(dirname ${BASH_SOURCE[0]})/../postgres/environment.env

container=$(GetContainerIDByName "gerrit_db")
if [[ $? -ne 0 ]]; then
  echo $container
  exit 1
fi

command="docker exec --interactive --tty $container psql --dbname=$POSTGRES_DB --username $POSTGRES_USER"
echo $command
$command
