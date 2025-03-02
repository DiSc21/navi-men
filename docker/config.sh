#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

readonly base_name="navi_men_test_docker"

# note: this allows to have jenkins and local builds running at the same time with different container names
if [[ -z "${BUILD_TAG+x}" ]]; then
  DOCKER_NAME="${base_name}_$('whoami')"
else
  DOCKER_NAME="${base_name}_${BUILD_TAG}"
fi
DOCKER_NAME="${DOCKER_NAME/\%2F/_}"
DOCKER_NAME=$(echo "${DOCKER_NAME}" | sed -r 's/[%]+/_/g')
readonly DOCKER_NAME
echo "${DOCKER_NAME}"

PROJECT_ROOT_DIR="$(readlink -e "$(dirname "${BASH_SOURCE[0]}")/../")"
readonly PROJECT_ROOT_DIR

readonly DOCKERFILE="${PROJECT_ROOT_DIR}/docker/Dockerfile"

TAG_LONG="$(sha256sum "${DOCKERFILE}" | awk '{ print $1 }')"
readonly TAG_LONG
TAG=${TAG_LONG::8}
readonly TAG

DOCKER_IMAGE_NAME="$DOCKER_NAME:$TAG"
readonly DOCKER_IMAGE_NAME

# TODO: export or suppress shellcheck?
export DOCKER_IMAGE_NAME
