#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

SCRIPT_PATH="$(readlink -e "$(dirname "${BASH_SOURCE[0]}")")"
readonly SCRIPT_PATH

dir="${SCRIPT_PATH}"
while true; do
  find "${dir}" -depth -maxdepth 1 | grep -q "LICENSE" && break || dir="${dir}/..";
done

readonly BASE_DIR="${dir}"
echo "${BASE_DIR}"
bats -t -p --print-output-on-failure \
  "${BASE_DIR}"/test/tests/test_navi_men.bats \
  "${BASE_DIR}"/test/tests/hasNode.bats \
  "${BASE_DIR}"/test/tests/getJsonType.bats \
  "${BASE_DIR}"/test/tests/getKeysByNode.bats \
  "${BASE_DIR}"/test/tests/getNodeAsString.bats
