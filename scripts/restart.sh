#!/usr/bin/env bash

set -e
set -u

source_aws_env () {
  export AWS_PROFILE="${1}"
  echo "AWS_PROFILE set to ${AWS_PROFILE}"
}

source_docker_machine_env () {
  eval "$(docker-machine env "${1}")"
  echo Active docker machine: "$(docker-machine active)"
}

source_docker_compose_env () {
  local source_file=".env.${1}"
  source ${source_file}
  echo "Sourcing ${source_file}"
}

restart_docker_compose () {
  source_docker_machine_env "${1}"
  source_docker_compose_env "${1}"
  docker-compose -f production.yml restart
}

aws_machines=( california saopaulo stockholm sydney tokyo virginia )

for m in "${aws_machines[@]}"
do
  echo Restarting "${m}"
  (
  source_aws_env "${m}"
  restart_docker_compose "${m}"
  )
done

linode_machines=( dallas6 )

for m in "${linode_machines[@]}"
do
  echo Restarting "${m}"
  (
  restart_docker_compose "${m}"
  )
done
