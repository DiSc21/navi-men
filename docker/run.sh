#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

declare -A FUNCTION_BY_CMD
FUNCTION_BY_CMD["--build"]="buildDocker"
FUNCTION_BY_CMD["--into"]="intoDocker"
FUNCTION_BY_CMD["--start"]="startDocker"
FUNCTION_BY_CMD["--stop"]="stopDocker"
FUNCTION_BY_CMD["--remove"]="removeDocker"
FUNCTION_BY_CMD["--cmd"]="runCommand"
readonly FUNCTION_BY_CMD

tmp_abs_project_path="$(readlink -e "$(dirname "${BASH_SOURCE[0]}")/../")"
readonly tmp_abs_project_path

# shellcheck source-path=SCRIPTDIR
# shellcheck disable=SC1091
. "${tmp_abs_project_path}/docker/config.sh"

RUNNING_DOCKER_CONTAINER="$(docker ps --format "{{.Names}}" || echo " " | grep -q "${DOCKER_NAME}")"
echo "Docker name: ${DOCKER_NAME}"
echo "Dockers running: ${RUNNING_DOCKER_CONTAINER}"
readonly RUNNING_DOCKER_CONTAINER
EXISTING_DOCKER_CONTAINER="$(docker ps -a --format "{{.Names}}" || echo " " | grep -q "${DOCKER_NAME}")"
readonly EXISTING_DOCKER_CONTAINER

## @fn
#
dockerBuildCmd() {
  DOCKER_BUILDIT=1 docker build -f "${DOCKERFILE}" -t "${DOCKER_IMAGE_NAME}" .
}

buildDocker() {
  docker images | grep "{$DOCKER_NAME}" | grep "${TAG}" || dockerBuildCmd
}

intoDocker() {
  if [[ -n "${RUNNING_DOCKER_CONTAINER}" ]]; then
    docker exec -it "${DOCKER_NAME}" /bin/bash
  else
    startDocker
    docker exec -it "${DOCKER_NAME}" /bin/bash
  fi
}

startDocker() {
  if [[ -z "${RUNNING_DOCKER_CONTAINER}" ]]; then
    docker run -td --rm --name "${DOCKER_NAME}" \
      --volume="$HOME/.Xauthority:/root/.Xauthority:rw" \
      --volume /etc/passwd:/etc/passwd:ro \
      --volume /etc/group:/etc/group:ro \
      --user "$(id -u)" \
      --net=host \
      --env="DISPLAY" \
      -v "${PROJECT_ROOT_DIR}":"${PROJECT_ROOT_DIR}" \
      -w "${PROJECT_ROOT_DIR}" \
      "${DOCKER_IMAGE_NAME}" /bin/bash
  else
    echo "[INFO] Docker was already started. If you want to restart call 'make restart'"
  fi
}

stopDocker() {
  if [[ -n "${RUNNING_DOCKER_CONTAINER}" ]]; then
    docker stop "${DOCKER_NAME}"
    echo "Stopped docker '${DOCKER_NAME}'"
  else
    echo "No docker with name '${DOCKER_NAME}' running."
  fi
}
removeDocker() {
  if [[ -n "${EXISTING_DOCKER_CONTAINER}" ]]; then
    docker rm "${DOCKER_NAME}"
    echo "Removed docker '${DOCKER_NAME}'"
  else
    echo "No docker with name '${DOCKER_NAME}' found."
  fi
}

runCommand() {
  if [[ -n "${RUNNING_DOCKER_CONTAINER}" ]]; then
    docker exec -t --user "$(id -u)" "${DOCKER_NAME}" /bin/bash -c "$*"
  else
    if [[ -z "${EXISTING_DOCKER_CONTAINER}" ]]; then
      buildDocker
    fi
    startDocker
    docker exec -t --user "$(id -u)" "${DOCKER_NAME}" /bin/bash -c "$*"
  fi
}

parseInputs() {
  if [[ "$#" -eq "0" ]]; then
    echo -e "Error (${0##*/} - ${FUNCNAME[*]}): '${FUNCNAME[0]}' requires at least one argument!" 1>&2
    exit 1
  fi
  local -r REQUESTED_PATH="$1"
  shift

  local validation_str=""

  for task in "${!FUNCTION_BY_CMD[@]}"; do
    if [[ "${task}" == "${REQUESTED_PATH}" ]]; then
      validation_str="${task}"
      "${FUNCTION_BY_CMD[${task}]}" "$*"
    fi
  done

  if [[ -z "${validation_str}" ]]; then
    echo -e "Error (${0##*/} - ${FUNCNAME[*]}): '${FUNCNAME[0]}' don't know what to do with param '${REQUESTED_PATH}'!" 1>&2
    exit 1
  fi
}

# batsify script, i.e. ensure nothing is executed if this file is just sourced/loaded
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]
then
  echo "hello $(id -u)"
  parseInputs "$@"
fi
