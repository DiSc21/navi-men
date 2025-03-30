#!/usr/bin/env bash

#   __________________________________________________________________
#  |.================================================================.|
#  || navi_men_core_data.bash               .::::.                   ||
#  || -----------------------             .::::::::.                 ||
#  ||                                     :::::::::::                ||
#  || @Author: TheDirkKnight              ':::::::::::..             ||
#  ||                                      :::::::::::::::'          ||
#  || @Contact:⠀github.com/DiSc21           ':::::::::::.            ||
#  ||                                         .::::::::::::::'       ||
#  || @Created: 2025-03-09 15:28:22         .:::::::::::...          ||
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
#

##
## @brief: Helpers for navi-men "core-objects"
##
## @dependencies (non-optional):
## - bash 4.x or higher (for associative-arrays)
## - bash 4.3 or higher (for name-references)
## - (implicit) jq
## - (implicit) sed/grep/...
##

set -o errexit
set -o pipefail
set -o nounset

# just for debugging
#set -o xtrace

if [ -z "${NAVI_MEN_CORE_DATA_INCLUDED+who_cares}" ]
then
  # Just some auxiliary const abused as HEADER-GUARD
  readonly NAVI_MEN_CORE_DATA_INCLUDED=yes

  NMCC_SCRIPT_PATH=$( cd -- "$(readlink -e "$( dirname -- "${BASH_SOURCE[0]}" )" )" &> /dev/null && pwd )
  readonly NMCC_SCRIPT_PATH

  # shellcheck disable=SC1091
  source "${NMCC_SCRIPT_PATH}/navi_men.conf"
  # shellcheck disable=SC1091
  source "${NMCC_SCRIPT_PATH}/navi_men_aux_array.bash"
  # shellcheck disable=SC1091
  source "${NMCC_SCRIPT_PATH}/navi_men_aux_jq.bash"
fi


## @fn
##
## @brief fill associative-array object with default members if missing
##
## @param1[in] nraa_set_object_default_values_defaults: associative-array with default values
## @param2[out] nraa_set_object_default_values_return: name-referenced associative-result-array
##
## @throws ERR_WRONG_NUM_OF_INPUTS: for wrong number of arguments
##
setObjectDefaultValues() {
  if [[ "$#" -ne "2" ]]; then
    echo -e "${ERROR} (${0##*/} - ${FUNCNAME[*]}): '${FUNCNAME[0]}' requires two arguments but got '$#'!" 1>&2
    exit "${ERR_WRONG_NUM_OF_INPUTS}"
  fi

  declare -nr nraa_set_object_default_values_defaults="$1"
  declare -n nraa_set_object_default_values_return="$2"

  # take missing "members" with default values from default "object" param1 nraa_set_object_default_values_defaults
  for key in "${!nraa_set_object_default_values_defaults[@]}"; do
    if [[ ! -v nraa_set_object_default_values_return["${key}"] ]]; then
      nraa_set_object_default_values_return["${key}"]="${nraa_set_object_default_values_defaults[${key}]}"
    fi
  done
}

## @fn
##
## @brief read json node into associative-array and check if all requirements are met,
## that is no missing essential fields and no unknown 
##
## @param1[in] config_json: file name of the json config
## @param2[in] node_name: the name of the node
## @param3[in] nria_create_nm_object_required: indexed array with required keys
## @param4[in] nraa_create_nm_object_defaults: the name of the node
## @param5[out] nraa_create_nm_object_return: name-referenced return array
##
## @throws ERR_WRONG_NUM_OF_INPUTS: for wrong number of arguments
## @throws ERR_NM_OBJECT_UNKNOWN_NODE: if unknown/invalid object nodes are found
## @throws ERR_NM_OBJECT_ESSENTIAL_NODE_NOT_FOUND: if essential object nodes are missing
#
## @throws ERR_FILE_NOT_FOUND (via readObjectFromJson): if config json not found
## @throws ERR_JSON_NODE_NOT_FOUND (via readObjectFromJson): if no json-node matching param2 is found
## @throws ERR_JSON_NODE_WRONG_TYPE (via readObjectFromJson): if json-node is not a string/boolean/number
##
createNMObject() {
  if [[ "$#" -ne "5" ]]; then
    echo -e "${ERROR} (${0##*/} - ${FUNCNAME[*]}): '${FUNCNAME[0]}' requires five arguments but got '$#'!" 1>&2
    exit "${ERR_WRONG_NUM_OF_INPUTS}"
  fi

  local -r config_json="$1"
  local -r node_name="$2"
  # shellcheck disable=SC2034
  declare -nr nria_create_nm_object_required="$3"
  declare -nr nraa_create_nm_object_defaults="$4"
  declare -n nraa_create_nm_object_return="$5"

  # shellcheck disable=SC2034
  nraa_create_nm_object_return=()
  readObjectFromJson "${config_json}" "${node_name}" nraa_create_nm_object_return


  local missing_required=""
  findMissingKeys nria_create_nm_object_required nraa_create_nm_object_return missing_required
  if (( "${#missing_required[@]}" )); then
    echo -e "${ERROR} (${0##*/} - ${FUNCNAME[*]}): cannot create navi-men object due to missing required node(s): '${missing_required}'!" 1>&2
    exit "${ERR_NM_OBJECT_ESSENTIAL_NODE_NOT_FOUND}"
  fi

  # note: may fail on unbound variables[[ "${#nraa_create_nm_object_defaults[@]}" -ne "0" ]];
  if [[ -n "${!nraa_create_nm_object_defaults[*]}" ]]; then
    # shellcheck disable=SC2034
    local -ar valid_elements=("${!nraa_create_nm_object_defaults[@]}")
    local unknown_elements=""
    findInvalidKeys valid_elements nraa_create_nm_object_return unknown_elements
    if (( "${#unknown_elements[@]}" )); then
      echo -e "${ERROR} (${0##*/} - ${FUNCNAME[*]}): cannot create navi-men object due to unknown node(s): '${unknown_elements}'!" 1>&2
      exit "${ERR_NM_OBJECT_UNKNOWN_NODE}"
    fi
    setObjectDefaultValues nraa_create_nm_object_defaults nraa_create_nm_object_return
  fi

}


## @fn
##
## @brief create list of objects
##
## @param1[in] config_json: file name of the json config
## @param2[in] node_name: the name of the node
## @param3[in] nria_create_nm_object_list_required: indexed array with required keys
## @param4[in] nraa_create_nm_object_list_defaults: the name of the node
## @param5[out] nraa_create_nm_object_list_return: name-referenced return array
##
## @throws ERR_WRONG_NUM_OF_INPUTS: for wrong number of arguments
## @throws ERR_NM_OBJECT_UNKNOWN_NODE: if unknown/invalid object nodes are found
## @throws ERR_NM_OBJECT_ESSENTIAL_NODE_NOT_FOUND: if essential object nodes are missing
#
## @throws ERR_FILE_NOT_FOUND (via readObjectFromJson): if config json not found
## @throws ERR_JSON_NODE_NOT_FOUND (via readObjectFromJson): if no json-node matching param2 is found
## @throws ERR_JSON_NODE_WRONG_TYPE (via readObjectFromJson): if json-node is not a string/boolean/number
##
createNMObjectList() {
  if [[ "$#" -ne "5" ]]; then
    echo -e "${ERROR} (${0##*/} - ${FUNCNAME[*]}): '${FUNCNAME[0]}' requires five arguments but got '$#'!" 1>&2
    exit "${ERR_WRONG_NUM_OF_INPUTS}"
  fi

  local -r config_json="$1"
  local -r node_name="$2"

  # shellcheck disable=SC2034
  declare -nr nria_create_nm_object_list_required="$3"
  # shellcheck disable=SC2034
  declare -nr nraa_create_nm_object_list_defaults="$4"
  # shellcheck disable=SC2034
  declare -n nraamd_create_nm_object_list_return="$5"

  local -a obj_list_keys
  getKeysByNode "${config_json}" "${node_name}" obj_list_keys
  readonly obj_list_keys

  local -r ns_prefix="${node_name/\./"${MULTI_DIM_ARRAY_DELIMITER}"}${MULTI_DIM_ARRAY_DELIMITER}"
  for obj_key in "${obj_list_keys[@]}"; do
    # shellcheck disable=SC2034
    local -A object=()
    createNMObject "${config_json}" \
                   "${node_name}.${obj_key}" \
                   nria_create_nm_object_list_required \
                   nraa_create_nm_object_list_defaults \
                   object
    addNamespacedArray "${ns_prefix}${obj_key}" object nraamd_create_nm_object_list_return
  done
}


## @fn
##
## @brief create associative array with namespaced metadata for all NM core objects, i.e. modes/views/config
##
## @param1[in] config_json: file name of the json config
## @param2[out] nraamd_create_nm_metadata_return: name-referenced return array
##
## @throws ERR_WRONG_NUM_OF_INPUTS: for wrong number of arguments
##
## @throws ERR_FILE_NOT_FOUND (via hasNode): if config json not found
## @throws ERR_JSON_NODE_NOT_FOUND (via readObjectMetadataFromJson): if no json-node matching param2 is found
## @throws ERR_JSON_NODE_WRONG_TYPE (via readObjectMetadataFromJson): if json-node is not a string/boolean/number
##
createNMMetadata() {
  if [[ "$#" -ne "2" ]]; then
    echo -e "${ERROR} (${0##*/} - ${FUNCNAME[*]}): '${FUNCNAME[0]}' requires two arguments but got '$#'!" 1>&2
    exit "${ERR_WRONG_NUM_OF_INPUTS}"
  fi

  local -r config_json="$1"

  # shellcheck disable=SC2034
  declare -n nraamd_create_nm_metadata_return="$2"

  local -a nodes_with_metadata=()
  findNodesBySubnode "${config_json}" "${JKEY_SHARED_OBJECT_METADATA}" nodes_with_metadata
  readonly nodes_with_metadata

  for node in "${nodes_with_metadata[@]}"; do
    readObjectMetadataFromJson "${config_json}" "${node}" nraamd_create_nm_metadata_return
  done
}

## @fn
##
## @brief create associative array with namespaced core data for all NM core objects, i.e. modes/views/config
##
## @param1[in] config_json: file name of the json config
## @param2[out] nraamd_create_nm_core_data_return: name-referenced return array
##
## @throws ERR_WRONG_NUM_OF_INPUTS: for wrong number of arguments
##
## @throws ERR_NM_OBJECT_UNKNOWN_NODE (via createNMObject): if unknown/invalid object nodes are found
## @throws ERR_NM_OBJECT_ESSENTIAL_NODE_NOT_FOUND (via createNMObject): if essential object nodes are missing
## @throws ERR_FILE_NOT_FOUND (via implicit hasNode): if config json not found
## @throws ERR_JSON_NODE_NOT_FOUND (via readObjectFromJson): if no json-node matching param2 is found
## @throws ERR_JSON_NODE_WRONG_TYPE (via readObjectFromJson): if json-node is not a string/boolean/number
##
createNMCoreData() {
  if [[ "$#" -ne "2" ]]; then
    echo -e "${ERROR} (${0##*/} - ${FUNCNAME[*]}): '${FUNCNAME[0]}' requires two arguments but got '$#'!" 1>&2
    exit "${ERR_WRONG_NUM_OF_INPUTS}"
  fi

  local -r config_json="$1"
  # shellcheck disable=SC2034
  declare -n nraamd_create_nm_core_data_return="$2"

  # shellcheck disable=SC2034
  local -A config_data=()

  createNMObject "${config_json}" \
                 "${JKEY_CORE_OBJECT_CONFIG}" \
                 ESSENTIAL_CONFIG_ATTRIBUTES \
                 OBJ_DEF_CONFIG \
                 config_data

  addNamespacedArray "${JKEY_CORE_OBJECT_CONFIG}" config_data nraamd_create_nm_core_data_return

  # shellcheck disable=SC2034
  declare -ar empty_essentials=()
  # shellcheck disable=SC2034
  declare -Ar empty_defaults=()

  createNMObjectList "${config_json}" \
                     "${JKEY_CORE_OBJECT_MODES}" \
                     ESSENTIAL_MODE_ATTRIBUTES \
                     OBJ_DEF_MODE \
                     nraamd_create_nm_core_data_return
  createNMObjectList "${config_json}" \
                     "${JKEY_CORE_OBJECT_VIEWS}" \
                     empty_essentials \
                     empty_defaults \
                     nraamd_create_nm_core_data_return
}



