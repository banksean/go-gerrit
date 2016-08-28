
function GetContainerIDByName {
  local container_name=$1
  container=$(docker ps --filter "name=$container_name" --filter "status=running" --format "{{.ID}}" --latest)

  if [[ "$container" = "" ]]; then
    echo "ERROR: Failed to locate the '$container_name' container"
    exit 1
  fi

  echo $container
}
