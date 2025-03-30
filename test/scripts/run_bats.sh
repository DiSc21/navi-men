#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

SCRIPT_PATH=$( cd -- "$(readlink -e "$( dirname -- "${BASH_SOURCE[0]}" )" )" &> /dev/null && pwd )
readonly SCRIPT_PATH

dir="${SCRIPT_PATH}"
while true; do
  find "${dir}" -depth -maxdepth 1 | grep -q "LICENSE" && break || dir="${dir}/..";
done
readonly BASE_DIR="${dir}"

echo ""
echo "BATS test setup:"
echo "----------------"
echo "- navi_men script path: '${SCRIPT_PATH}'"
echo "- navi_men base directory: '${BASE_DIR}'"

declare BATS_JOBS_FLAG=""
declare NPROCS=""

if command -v parallel >/dev/null 2>&1; then
  if [[ "$#" -ne "0" ]]; then
    NPROCS="$1"
  else
    NPROCS="$( nproc --all )"
  fi
  BATS_JOBS_FLAG="--jobs"
  echo "- GNU parallel found!"
  echo "- Bats running parallel '${NPROCS}' threads"
else
  echo "- GNU parallel NOT found!"
  echo "- Bats running only a SINGLE thread!"
fi
readonly BATS_JOBS_FLAG
readonly NPROCS
echo ""

/usr/bin/bats --print-output-on-failure "${BATS_JOBS_FLAG}" "${NPROCS}" "${BASE_DIR}"/test/tests/

