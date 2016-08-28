#!/usr/bin/env bash -e

# This script starts a psql shell inside of the container running Gerrit's
# database.

if [[ $1 == "-h" || $1 == "--help" ]]; then
  echo "DESCRIPTION: Restores the database using the requested file."
  echo "      USAGE: $0 <file containing db to restore>"
  echo "    EXAMPLE: db_dump.sh > db.sql; $0 db.sql;"
  exit 0
fi

source $(dirname ${BASH_SOURCE[0]})/functions.sh
source $(dirname ${BASH_SOURCE[0]})/../postgres/environment.env

container=$(GetContainerIDByName "gerrit_db")
if [[ $? -ne 0 ]]; then
  echo $container
  exit 1
fi

# Copy the backup over
filepath=$1
command="docker cp $filepath $container:/tmp/restore.sql"
echo $command
$command

# TODO stop or pause running gerrit container
# TODO write and push script to drop existing db
# TODO write script to do the restore

# Create a script to run on the remote side
tempfile=$(mktemp)
echo "#!/bin/bash" >> $tempfile
echo "psql --username=postgres -c ''"
#
## Run pg_restore
#command="docker exec --interactive --tty $container psql --username=postgres -c 'DROP DATABASE $POSTGRES_DB;'"
#echo $command
#
#$command
#
#command="docker exec --interactive --tty $container bash -c 'cat /tmp/restore.sql | psql --username=$POSTGRES_USER $POSTGRES_DB'"
#echo $command
#$command
