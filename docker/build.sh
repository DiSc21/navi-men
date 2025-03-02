#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

script_location_abs="$( readlink -e "$(dirname "${BASH_SOURCE[0]}")/../" )"
source "${script_location_abs}/docker/config.sh"

docker images | grep "{$name}" | grep "${tag}" -q || dockerBuildCmd
