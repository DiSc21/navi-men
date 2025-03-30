#!/usr/bin/env bash

#   __________________________________________________________________
#  |.================================================================.|
#  || navi_men_aux_array.bash               .::::.                   ||
#  || -----------------------             .::::::::.                 ||
#  ||                                     :::::::::::                ||
#  || @Author: TheDirkKnight              ':::::::::::..             ||
#  ||                                      :::::::::::::::'          ||
#  || @Contact:⠀github.com/DiSc21           ':::::::::::.            ||
#  ||                                         .::::::::::::::'       ||
#  || @Created: 2025-03-08 09:26:02         .:::::::::::...          ||
#  ||     .---.                           .::::::::::::::''          ||
#  ||    /     \                .::.       '::::::::''::::           ||
#  ||    \.@-@./              .:::::::.      ':::::'  '::::          ||
#  ||    /`\_/`\            .::::':::::::.    :::::    '::::.        ||
#  ||   //  _  \\         .:::::' ':::::::::. :::::      ':::.       ||
#  ||  | \     )|_      .:::::'     ':::::::::.:::::       '::.      ||
#  || /`\_`>  <_/ \   .::::''         '::::::::::::::       '::.     ||
#  || \__/'---'\__/ .:::''              '::::::::::::         :::... ||
#  ||             .:::::                  ':::::::::'        .:' ''''||
#  ||          ..''''':'                    ':::::.'         ========||
#  || @Copyright: 2025 (©) TheDirkKnight - https://github.com/DiSc21 ||
#  ||                                                                ||
#  || @License: MIT                                                  ||
#  || - https://github.com/DiSc21/DiSc21.github.io/blob/main/LICENSE ||
#  ||________________________________________________________________||
#  |                                                                  |
#  | This ASCII pic can be found at:                                  |
#  | https://asciiart.website/index.php?art=people/naked%20ladies     |
#  |__________________________________________________________________|

##
## @brief: Collection of convenience helpers for bash-array operations
##
## @dependencies:
## - bash 4.x or higher (for associative-arrays)
## - bash 4.3 or higher (for name-references)
##

######################################################################
#    $    $$   $$ $$     $$     $    $$$$$$  $$$$$$     $   $$    $$ #
#   $$$   $$   $$  $$   $$     $$$   $$   $$ $$   $$   $$$   $$  $$  #
#  $$ $$  $$   $$   $$ $$     $$ $$  $$   $$ $$   $$  $$ $$   $$$$   #
# $$   $$ $$   $$    $$$     $$   $$ $$$$$$  $$$$$$  $$   $$   $$    #
# $$$$$$$ $$   $$   $$ $$    $$$$$$$ $$ $$   $$ $$   $$$$$$$   $$    #
# $$   $$ $$   $$  $$   $$   $$   $$ $$  $$  $$  $$  $$   $$   $$    #
# $$   $$  $$$$$  $$     $$  $$   $$ $$   $$ $$   $$ $$   $$   $$    #
######################################################################

set -o errexit
set -o pipefail
set -o nounset

if [ -z "${NAVI_MEN_AUX_ARRAY_INCLUDED+who_cares}" ]
then
  # Just some auxiliary const abused as HEADER-GUARD
  readonly NAVI_MEN_AUX_ARRAY_INCLUDED=yes

  NMAA_SCRIPT_PATH=$( cd -- "$(readlink -e "$( dirname -- "${BASH_SOURCE[0]}" )" )" &> /dev/null && pwd )
  readonly NMAA_SCRIPT_PATH

  # shellcheck disable=SC1091
  # shellcheck source=navi_men.conf
  source "${NMAA_SCRIPT_PATH}/navi_men.conf"
fi


## @fn
##
## @brief Check which elements of the string-array passed as param1 are used
## as key in the associative string-array param2 and collect those strings
## - which are NOT used as keys - in the name-referenced string-array param3
##
## @note The output is inteded to be also used for the creation of complete error reports
## when testing/validating configuration jsons. Hence, returning string-list instead of boolean.
##
## @param1[in]  nria_find_missing_keys_set: the test list with elements to be checked
##                                          no assumptions, duplicates allowed, not sorted, ...
## @param2[in]  nraa_find_missing_keys_map: the associative-array with "check"-keys
##                                          no assumptions, however, duplicated keys are not possible
## @param3[out] nria_find_missing_keys_missed_keys: return-list of elements not used as key
##
## @throws ERR_WRONG_NUM_OF_INPUTS: for wrong number of arguments
##
findMissingKeys() {
  if [[ "$#" -ne "3" ]]; then
    echo -e "${ERROR} (${0##*/} - ${FUNCNAME[*]}): '${FUNCNAME[0]}' requires three arguments but got '$#'!" 1>&2
    exit "${ERR_WRONG_NUM_OF_INPUTS}"
  fi

  # shellcheck disable=SC2034
  declare -nr nria_find_missing_keys_set="$1"
  declare -nr nraa_find_missing_keys_map="$2"
  declare -n nria_find_missing_keys_missed_keys="$3"

  nria_find_missing_keys_missed_keys=()

  if (( "${#nraa_find_missing_keys_map[@]}" )); then
    for item in "${nria_find_missing_keys_set[@]}"; do
      if [[ ! -v nraa_find_missing_keys_map["${item}"] ]]; then
        nria_find_missing_keys_missed_keys+=("${item}")
      fi
    done
  else
    for item in "${nria_find_missing_keys_set[@]}"; do
      nria_find_missing_keys_missed_keys+=("${item}")
    done
  fi
}

## @fn
##
## @brief Check if only elements of the string-array passed as param1 are used
## as key in the associative string-array param2 and collect those strings
## - which ARE USED as keys - in the name-referenced string-array param3
##
## @note Passing an empty list as param2 skips the collection of invald keys.
##
## @note The output is inteded to be also used for the creation of complete error reports
## when testing/validating configuration jsons. Hence, returning string-list instead of boolean.
##
## @param1[in]  nria_find_invalid_keys_set: the test list with elements to be checked
##                                          no assumptions, duplicates allowed, not sorted, ...
## @param2[in]  nraa_find_invalid_keys_map: the associative-array with "check"-keys
##                                          no assumptions, however, duplicated keys are not possible
## @param3[out] nria_find_invalid_keys_missed_keys: return-list of elements not used as key
##
## @throws ERR_WRONG_NUM_OF_INPUTS: for wrong number of arguments
##
findInvalidKeys() {
  if [[ "$#" -ne "3" ]]; then
    echo -e "${ERROR} (${0##*/} - ${FUNCNAME[*]}): '${FUNCNAME[0]}' requires three arguments but got '$#'!" 1>&2
    exit "${ERR_WRONG_NUM_OF_INPUTS}"
  fi

  # shellcheck disable=SC2034
  declare -nr nria_find_invalid_keys_set="$1"
  declare -nr nraa_find_invalid_keys_map="$2"
  declare -n nria_find_invalid_keys_missed_keys="$3"

  nria_find_invalid_keys_missed_keys=()

  if [[ "${#nria_find_invalid_keys_set[@]}" -eq "0" ]]; then
    return 0
  fi

  if (( "${#nraa_find_invalid_keys_map[@]}" )); then
    for key in "${!nraa_find_invalid_keys_map[@]}"; do
      if [[ ! " ${nria_find_invalid_keys_set[*]} " =~ [[:space:]]${key}[[:space:]] ]]; then
        nria_find_invalid_keys_missed_keys+=("${key}");
      fi
    done
  fi
}

## @fn
##
## @brief helper function for faking a multi-dim associative-array
##
## @note additional dimension is faked by namespace-prefices for keys.
##
## @param1[in]  namespace: namespace appended to input-array keys which mimics an additional array dimension
## @param2[in]  nraa_add_namespaced_array_input: associative-input-array appended to multi-dim-fake param3
##                                               no assumptions, however, duplicated keys are not possible
## @param3[out] nraa_add_namespaced_array_output: associative multi-dim-fake array to which array param2 is added
##                                                no assumptions, however, duplicated keys are not possible
##
## @throws ERR_WRONG_NUM_OF_INPUTS: for wrong number of arguments
##
addNamespacedArray() {
  if [[ "$#" -ne "3" ]]; then
    echo -e "${ERROR} (${0##*/} - ${FUNCNAME[*]}): '${FUNCNAME[0]}' requires three arguments but got '$#'!" 1>&2
    exit "${ERR_WRONG_NUM_OF_INPUTS}"
  fi

  local -r namespace="$1${MULTI_DIM_ARRAY_DELIMITER}"
  declare -nr nraa_add_namespaced_array_input="$2"
  declare -n nraa_add_namespaced_array_output="$3"

  for key in "${!nraa_add_namespaced_array_input[@]}"; do
    local value="${nraa_add_namespaced_array_input[${key}]}"
    local namespaced_key="${namespace}${key}"
    # shellcheck disable=SC2034
    nraa_add_namespaced_array_output["${namespaced_key}"]="${value}";
  done
}

## @fn
##
## @brief helper function for faking a multi-dim associative-array
##
## @param1[in]  namespace: namespace appended to input-array keys which mimics an additional array dimension
## @param2[in]  nraa_get_array_by_namespace_input: associative multi-dim-fake array from which namespace-array is "extract"
##                                                 no assumptions, however, duplicated keys are not possible
## @param3[out] nraa_get_array_by_namespace_output: associative array with "namespace-extracted"
##                                                  no assumptions, however, duplicated keys are not possible
##
## @throws ERR_WRONG_NUM_OF_INPUTS: for wrong number of arguments
##
getArrayByNamespace() {
  if [[ "$#" -ne "3" ]]; then
    echo -e "${ERROR} (${0##*/} - ${FUNCNAME[*]}): '${FUNCNAME[0]}' requires three arguments but got '$#'!" 1>&2
    exit "${ERR_WRONG_NUM_OF_INPUTS}"
  fi

  local -r namespace="$1${MULTI_DIM_ARRAY_DELIMITER}"
  declare -nr nraa_get_array_by_namespace_input="$2"
  declare -n nraa_get_array_by_namespace_output="$3"

  local found_namespace=""
  for key in "${!nraa_get_array_by_namespace_input[@]}"; do
    if [[ "${key}" == "${namespace}"* ]]; then
      found_namespace="found"
      local unspaced_key="${key#"${namespace}"}"
      local value="${nraa_get_array_by_namespace_input[${key}]}"
      # shellcheck disable=SC2034
      nraa_get_array_by_namespace_output["${unspaced_key}"]="${value}";
    fi
  done

  if [ -z "${found_namespace}" ]; then
    echo -e "${ERROR} (${0##*/} - ${FUNCNAME[*]}): No namespace '${namespace%"${MULTI_DIM_ARRAY_DELIMITER}"}' in input array!" 1>&2
    exit "${ERR_MULTI_DIM_NAMESPACE_NOT_FOUND}"
  fi
}


## @fn
##
## @brief helper function to check if associative array has entry for given key
##
## @param1[in] nraa_has_key_array: array to check for key
## @param2[in] nrstr_has_key_search: key to check if it exists in array param1
##
hasKey() {
  declare -nr nraa_has_key_array="$1"
  declare -nr nrstr_has_key_search="$2"

  if [ -n "${nraa_has_key_array[$nrstr_has_key_search]+who_cares}" ]; then
    echo "true"
  else
    echo "false"
  fi
}
