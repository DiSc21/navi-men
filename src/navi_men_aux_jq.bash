#!/usr/bin/env bash

#   __________________________________________________________________
#  |.================================================================.|
#  || navi_men_aux_jq.bash                  .::::.                   ||
#  || --------------------                .::::::::.                 ||
#  ||                                     :::::::::::                ||
#  || @Author: TheDirkKnight              ':::::::::::..             ||
#  ||                                      :::::::::::::::'          ||
#  || @Contact:⠀github.com/DiSc21           ':::::::::::.            ||
#  ||                                         .::::::::::::::'       ||
#  || @Created: 2025-03-08 11:18:37         .:::::::::::...          ||
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
## @brief: Collection of convenience helpers for jq json parsing.
##
## @dependencies (non-optional):
## - bash 4.x or higher (for associative-arrays)
## - bash 4.3 or higher (for name-references)
## - jq (for json parsing)
## - grep (atm only used once)
## - sed

set -o errexit
set -o pipefail
set -o nounset

if [ -z "${NAVI_MEN_AUX_JQ_INCLUDED+who_cares}" ]
then
  # Just some auxiliary const abused as HEADER-GUARD
  readonly NAVI_MEN_AUX_JQ_INCLUDED=yes

  NMAJ_SCRIPT_PATH=$( cd -- "$(readlink -e "$( dirname -- "${BASH_SOURCE[0]}" )" )" &> /dev/null && pwd )
  readonly NMAJ_SCRIPT_PATH

  # shellcheck disable=SC1091
  # shellcheck source=navi_men.conf
  source "${NMAJ_SCRIPT_PATH}/navi_men.conf"
fi

## @fn
##
## @brief check if a json node exists
##
## @param1[in] config_json: file name of the json config
## @param2[in] node_name: the json node/field to parse
## @param3[out] nr_has_node_return: boolean return
##
## @throws ERR_WRONG_NUM_OF_INPUTS: for wrong number of arguments
## @throws ERR_FILE_NOT_FOUND: if config json not found
##
## @return true or falls via echo
##
hasNode() {
  if [[ "$#" -ne "3" ]]; then
    echo -e "${ERROR} (${0##*/} - ${FUNCNAME[*]}): '${FUNCNAME[0]}' requires three arguments but got '$#'!" 1>&2
    exit "${ERR_WRONG_NUM_OF_INPUTS}"
  fi
  local -r config_json="$1"
  local -r node_name="$2"
  declare -n nr_has_node_return="$3"

  if [ ! -f "${config_json}" ]; then
    echo -e "${ERROR} (${0##*/} - ${FUNCNAME[*]}): configuration json '${config_json}' does not exist!" 1>&2
    exit "${ERR_FILE_NOT_FOUND}"
  fi

  # split node name into subnodes
  OIFS="${IFS}"
  IFS='.'
  read -ra jp_nodes <<<"${node_name}"
  IFS="${OIFS}"

  local jq_has_cmd=""
  if [[ "$(echo ".${node_name}" | grep -o "\." | wc -l)" == 1 ]]; then
    jq_has_cmd="has(\"${node_name}\")"
  else
    for i in "${!jp_nodes[@]}"; do
      # create jq has command to verify node existance
      if (("(( i+1 ))" == "${#jp_nodes[@]}")); then
        jq_has_cmd+=" | has(\"${jp_nodes[-1]}\")"
      else
        jq_has_cmd+=".${jp_nodes[${i}]}"
      fi
    done
  fi

  if [[ "$(jq "${jq_has_cmd}" <"${config_json}")" == true ]]; then
    nr_has_node_return=1
  else
    # shellcheck disable=SC2034
    nr_has_node_return=0
  fi
}

## @fn
##
## @brief get type of json node
##
## @param1[in] config_json: file name of the json config
## @param2[in] node_name: the json node/field to parse
## @param3[out] nrstr_get_json_type_return: string describing type of the requested node
##
## @throws ERR_WRONG_NUM_OF_INPUTS: for wrong number of arguments
## @throws ERR_JSON_NODE_NOT_FOUND: if no json-node matching param2 is found
##
## @throws ERR_FILE_NOT_FOUND (via hasNode): if config json not found
##
getJsonType() {
  if [[ "$#" -ne "3" ]]; then
    echo -e "${ERROR} (${0##*/} - ${FUNCNAME[*]}): '${FUNCNAME[0]}' requires three arguments but got '$#'!" 1>&2
    exit "${ERR_WRONG_NUM_OF_INPUTS}"
  fi
  local -r config_json="$1"
  local -r node_name="$2"
  declare -n nrstr_get_json_type_return="$3"

  local has_node_return=-1
  hasNode "${config_json}" "${node_name}" has_node_return

  if [[ "${has_node_return}" -ne "1" ]]; then
    echo -e "${ERROR} (${0##*/} - ${FUNCNAME[*]}): '${config_json}' does not contain a node with name '${node_name}'!" 1>&2
    exit "${ERR_JSON_NODE_NOT_FOUND}"
  else
    # shellcheck disable=SC2034
    nrstr_get_json_type_return="$(jq -r ".${node_name} | type" <"${config_json}")"
  fi
}

## @fn
##
## @brief read configuration fields
##
## @note only json-objects allowed.
##
## @param1[in] config_json: file name of the json config
## @param2[in] node_name: the json node/field to parse
## @param3[out] nria_get_keys_by_node_return: string with parsed keys
##
## @throws ERR_WRONG_NUM_OF_INPUTS: for wrong number of arguments
## @throws ERR_JSON_NODE_WRONG_TYPE: if json-node is not a json-object
##
## @throws ERR_FILE_NOT_FOUND (via getJsonType): if config json not found
## @throws ERR_JSON_NODE_NOT_FOUND (via getJsonType): if no json-node matching param2 is found
##
getKeysByNode() {
  if [[ "$#" -ne "3" ]]; then
    echo -e "${ERROR} (${0##*/} - ${FUNCNAME[*]}): '${FUNCNAME[0]}' requires three arguments but got '$#'!" 1>&2
    exit "${ERR_WRONG_NUM_OF_INPUTS}"
  fi
  local -r config_json="$1"
  local -r node_name="$2"
  declare -n nria_get_keys_by_node_return="$3"

  local value_type="k"
  getJsonType "${config_json}" "${node_name}" value_type
  if [[ "${value_type}" != "object" ]]; then
    echo -e "${ERROR} (${0##*/} - ${FUNCNAME[*]}): '${node_name}' is of type '${value_type}' which has no keys. Need node type 'object'!" 1>&2
    exit "${ERR_JSON_NODE_WRONG_TYPE}"
  fi

  # shellcheck disable=SC2034
  read -ra nria_get_keys_by_node_return <<<"$(jq -r ".${node_name} | keys[]" <"${config_json}" | sed ':a;N;$!ba;s/\n/ /g')"
}

## @fn
##
## @brief read string/number/boolean-node as string and throw error for other json-node-types
##
## @param1[in] config_json: file name of the json config
## @param2[in] node_name: the name of the node
## @param3[out] nrstr_get_value_by_key_return: string with parsed keys
##
## @throws ERR_WRONG_NUM_OF_INPUTS: for wrong number of arguments
## @throws ERR_JSON_NODE_WRONG_TYPE: if json-node is not a json-object
##
## @throws ERR_FILE_NOT_FOUND (via getJsonType): if config json not found
## @throws ERR_JSON_NODE_NOT_FOUND (via getJsonType): if no json-node matching param2 is found
##
getNodeAsString() {
  if [[ "$#" -ne "3" ]]; then
    echo -e "${ERROR} (${0##*/} - ${FUNCNAME[*]}): '${FUNCNAME[0]}' requires three arguments but got '$#'!" 1>&2
    exit "${ERR_WRONG_NUM_OF_INPUTS}"
  fi

  local -r config_json="$1"
  local -r node_name="$2"
  declare -n nrstr_get_value_by_key_return="$3"

  local value_type="k"
  getJsonType "${config_json}" "${node_name}" value_type
  if [[ "${value_type}" != "string" ]] && [[ "${value_type}" != "number" ]] && [[ "${value_type}" != "boolean" ]]; then
    echo -e "${ERROR} (${0##*/} - ${FUNCNAME[*]}): '${node_name}' is of type '${value_type}' but only 'string|number|bool'-nodes supported!" 1>&2
    exit "${ERR_JSON_NODE_WRONG_TYPE}"
  else
    # shellcheck disable=SC2034
    nrstr_get_value_by_key_return="$(jq -r ".${node_name}" <"${config_json}")"
  fi
}

## @fn
##
## @brief find all nodes containing a given subnode
##
## @param1[in] config_json: file name of the json config
## @param2[in] subnode_name: the subnode which is searched for
## @param3[out] nria_find_nodes_by_subnode_list: list of nodes which contain the given subnode param2
##
## @throws ERR_WRONG_NUM_OF_INPUTS: for wrong number of arguments
## @throws ERR_FILE_NOT_FOUND: if config json not found
##
findNodesBySubnode() {
  if [[ "$#" -ne "3" ]]; then
    echo -e "${ERROR} (${0##*/} - ${FUNCNAME[*]}): '${FUNCNAME[0]}' requires three arguments but got '$#'!" 1>&2
    exit "${ERR_WRONG_NUM_OF_INPUTS}"
  fi

  local -r config_json="$1"
  local -r subnode_name="$2"

  declare -n nria_find_nodes_by_subnode_list="$3"
  nria_find_nodes_by_subnode_list=()

  if [ ! -f "${config_json}" ]; then
    echo -e "${ERROR} (${0##*/} - ${FUNCNAME[*]}): configuration json '${config_json}' does not exist!" 1>&2
    exit "${ERR_FILE_NOT_FOUND}"
  fi

  local full_list=""
  full_list="$(jq 'select(objects)|=[.] | map( paths(scalars) ) | map( map(select(numbers)="[]") | join(".")) | unique' <"${config_json}")"
  readonly full_list

  # dirty check if grep fails cause I was too lazy finding a nicer solution
  if grep "${subnode_name}" <<< "${full_list}" > /dev/null 2>&1; then
    local filtered=""
    filtered="$(grep "${subnode_name}" <<< "${full_list}" | sed "s/\.*${subnode_name}.*//" | sed 's/"//' | sort -u | sed ':a;N;$!ba;s/\n/ /g')"
    readonly filtered

    # shellcheck disable=SC2034
    read -ra nria_find_nodes_by_subnode_list <<<"${filtered}"
  fi
}


## @fn
##
## @brief reads "string-convertible" sub_nodes for a give json node and stores
## them in the name-referenced associative-return-array passed in as param3
##
## @param1[in] config_json: file name of the json config
## @param2[in] node_name: the name of the node
## @param3[out] nraa_read_object_from_json_return: the navi-men object read from configuration json
##
## @throws ERR_WRONG_NUM_OF_INPUTS: for wrong number of arguments
##
## @throws ERR_FILE_NOT_FOUND (via getJsonType): if config json not found
## @throws ERR_JSON_NODE_NOT_FOUND (via getJsonType): if no json-node matching param2 is found
## @throws ERR_JSON_NODE_WRONG_TYPE (via getNodeAsString): if json-node is not a string/boolean/number
##
readObjectFromJson() {
  if [[ "$#" -ne "3" ]]; then
    echo -e "${ERROR} (${0##*/} - ${FUNCNAME[*]}): '${FUNCNAME[0]}' requires three arguments but got '$#'!" 1>&2
    exit "${ERR_WRONG_NUM_OF_INPUTS}"
  fi

  local -r config_json="$1"
  local -r node_name="$2"
  declare -n nraa_read_object_from_json_return="$3"

  local -a node_keys=()
  getKeysByNode "${config_json}" "${node_name}" node_keys

  # read all subnodes except json nodes with name defined in $JKEY_SHARED_OBJECT_METADATA
  for sub_node in "${node_keys[@]}"; do

    local node_as_string=""

    # special treatment for metadata
    if [[ "${sub_node}" != "${JKEY_SHARED_OBJECT_METADATA}" ]]; then
      # note: getNodeAsString will throw for non-(string/bool/number) types
      getNodeAsString "${config_json}" "${node_name}.${sub_node}" node_as_string

      # shellcheck disable=SC2034
      nraa_read_object_from_json_return["${sub_node}"]="${node_as_string}"
    fi
  done
}

## @fn
##
## @brief reads "string-convertible" sub_nodes for a give json node and stores
## them in the name-referenced associative-return-array passed in as param3
##
## @param1[in] config_json: file name of the json config
## @param2[in] node_name: the name of the node
## @param3[out] nraamd_read_object_metadata_from_json_return: the navi-men object read from configuration json
##
## @throws ERR_WRONG_NUM_OF_INPUTS: for wrong number of arguments
##
## @throws ERR_FILE_NOT_FOUND (via getJsonType): if config json not found
## @throws ERR_JSON_NODE_NOT_FOUND (via getJsonType): if no json-node matching param2 is found
## @throws ERR_JSON_NODE_WRONG_TYPE (via getNodeAsString): if json-node is not a string/boolean/number
##
readObjectMetadataFromJson() {
  if [[ "$#" -ne "3" ]]; then
    echo -e "${ERROR} (${0##*/} - ${FUNCNAME[*]}): '${FUNCNAME[0]}' requires three arguments but got '$#'!" 1>&2
    exit "${ERR_WRONG_NUM_OF_INPUTS}"
  fi

  local -r config_json="$1"
  local -r node_name="$2"
  declare -n nraamd_read_object_metadata_from_json_return="$3"

  local -r prefixed_metadata_key="${node_name}.${JKEY_SHARED_OBJECT_METADATA}"

  local has_node_return=-1
  hasNode "${config_json}" "${prefixed_metadata_key}" has_node_return

  if [[ "${has_node_return}" -eq "1" ]]; then
    local -a metadata_keys=()
    getKeysByNode "${config_json}" "${prefixed_metadata_key}" metadata_keys

    local node_as_string=""
    # read all subnodes except json nodes with name defined in $JKEY_SHARED_OBJECT_METADATA
    for metadata_key in "${metadata_keys[@]}"; do
      if [[ "${metadata_key}" == "${JKEY_SHARED_OBJECT_METADATA}" ]]; then
        echo -e "${ERROR} (${0##*/} - ${FUNCNAME[*]}): Nested metadata is not supported: '${prefixed_metadata_key}'!" 1>&2
        exit "${ERR_NM_OBJECT_NESTED_METADATA}"
      fi

      # note: getNodeAsString will throw for non-(string/bool/number) types
      getNodeAsString "${config_json}" "${prefixed_metadata_key}.${metadata_key}" node_as_string

      local mdaa_key="${node_name}.${metadata_key}"
      mdaa_key="${JKEY_SHARED_OBJECT_METADATA}${MULTI_DIM_ARRAY_DELIMITER}${mdaa_key//\./"${MULTI_DIM_ARRAY_DELIMITER}"}"
      # shellcheck disable=SC2034
      nraamd_read_object_metadata_from_json_return["${mdaa_key}"]="${node_as_string}"
    done
  else
    echo -e "${ERROR} (${0##*/} - ${FUNCNAME[*]}): '${config_json}' does not contain a node with name '${node_name}'!" 1>&2
    exit "${ERR_JSON_NODE_NOT_FOUND}"
  fi
}

