#!/usr/bin/env bash

# ╭───────────────────────────────────────────────────────╮
# │ NavigationMenu⠀ ⠀⠀⠀⠀⠀⠀⢀⡆⠀⠀⠀⠀⠀⠀⠀⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣶⡀⠀⠀⠀⠀⠀⠀ │
# │         ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⡇⠀⠀⠀⠀⠀⠀⠀⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣧⠀⠀⠀⠀⠀⠀ │
# │ @Author:⠀⠀⠀⠀⠀⠀⠀  ⠀⠀⠀⠀⠀⣿⡇⠀⠀⠀⠀⠀⠀⠀⡿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⣿⣆⠀⠀⠀⠀⠀ │
# │ -⠀TheDirkKnight⠀⠀⠀⠀⠀⠀⢸⣿⣿⠀⠀⠀⠀⠀⠀⠀⠃⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⣆⠀⠀⠀⠀ │
# │ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣷⣼⣿⣇⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⣿⣿⣿⣿⣿⣆⠀⠀  │
# │ @Contact:⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⣰⣿⣿⣿⠋⠉⠙⣿⣿⣿⣆⠀  │
# │ -⠀github.com/DiSc21⠀⠀⠈⣠⣼⣿⣿⣿⣿⣿⣿⣿⣿⡏⠀⠀⠀⠀⠀⠀⣰⣿⣿⣿⡇⠀⠀⠀⢸⣿⣿⣟⣆  │
# │ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢙⡻⢿⣿⡿⡟⣿⡿⠟⣛⠁⠀⠀⠀⠀⠀⣴⣿⠿⠛⠋⠁BTW⠈⠙⠛⠿⣿⣦⠀│
# │ @Creation:⠀⠀           ⠉⠓⠂⠁⡀⠀⠐⠛⠁⠀⠀⠀⠀⠀⠘⠉I tried using⠉⠃│
# │ -⠀2025/02/18⠀⠀⣀⣠⣴⡾⠛⠉⠀     ⢠⡇⠀⠀⠀⠀⠀⠀⣸⣿⣦⣄⡀⠀⠀ ⠀Arch!  ⠀⠀⠀⠀│
# │ ⠀ ⠀⠀⠀⠀⠀⢀⣀⣀⣤⣤⣶⣿⣿⣿⣿⣿⣷⣆⠀⠀⠀⠀⠀.__, ⠀⠀⠀⠀⠀⠈⣻⣿⣿⣿⣷⣶⣤⣤⣤⣄⣀⠀⠀⠀⠀⠀⠀⠀│
# │ ⠀ ⠀⠀⢀⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠁⠀⠀⠀⠀    ⠀⠀⠀⠀⠀⠀⠀⠀⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⡄⠀⠀⠀⠀│
# │ ⠀ ⠀⡾⣿⣿⣿⣿⠿⠋⢁⣿⣿⣿⣿⣿⣿⣟⣥⣶⢿⡛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢙⡻⢷⣿⣿⣿⣿⣿⣿⣿⡟⠿⠿⣿⣿⣿⣿⠀⠀⠀⠀│
# │ ⠀ ⠀⠀⣿⣿⠟⠁⠀⢠⣿⣿⣿⣿⣿⣿⡿⢟⣭⣶⣿⣷⣄⠀⠀⠀⣤⣀⡄⠀⠀⢀⣴⣿⣿⣷⣝⡻⣿⣿⣿⣿⣿⣿⣦⡀⠀⠉⠛⢿⠀⠀⠀⠀│
# │ ⠀ ⠀⠀⠿⠁⠀⠀⠀⠋⠁⣿⣿⣿⡿⢋⣴⣿⣿⣿⣿⣿⣿⣿⣶⣾⣿⣿⣿⣶⣿⣿⣿⣿⣿⣿⣿⣿⣮⡻⣿⣿⣿⠯⠉⠙⠀⠀⠀⠀⠀⠀⠀⠀│
# │ ⠀ ⠀⠀⠀⠀⠀⠀⠀⠀⠘⠁⠽⠋⠠⠿⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠷⠌⠻⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀│
# │ ⠀ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ │
# │ @License: MIT ⠀ ⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀│
# │ ⠀  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀│
# │ @Copyright: 2025 (©) TheDirkKnight                    │
# ╰───────────────────────────────────────────────────────╯

## @brief: Json based navigation menu for bash inspired
## by the X11 menu jgmenu https://github.com/jgmenu/jgmenu
##
## @StyleGuide (similar https://google.github.io/styleguide/shellguide.html):
## - prefer local/readonly over declare
## - don't use eval ... ( didn't get it to work without yet )
## - don't use globals out of convenience
## - add doxygen comments
##   - first line '## @fn' for bash-doxygen filter
##   - opening brace '{' in same line as functions declaration
##   - all "non-trivial" functions should be documented
## - Variable/Function naming
##   - camelCase for functions (note: google wants snake_case, me not)
##   - snake_case_variables
##   - CAPITAL_WITH_UNDERSCORES consts
## - weird: prefix name-references with 'nr_'+fun_name to ensure unique name
## - weird: try to avoid globals
## - weird: pass non-"name-reference" function-parameters quoted
##
## @dependencies (non-optional):
## - bash 4.3 (for associative arrays with name references)
## - jq (for json parsing)
## - grep/sed/awk, ... well
##
## @dependencies (optional):
## - lolcat (for colorized menus)
## - boxes (for boxes surrounding the menus)
##
## @usage: navimen.sh <config.json>
##

set -o errexit
set -o pipefail
set -o nounset

# just for debugging
#set -o xtrace

# some readonly colors
readonly CLR_RED='\033[0;31m'
readonly CLR_NC='\033[0m'
# a colored error string
readonly ERROR="${CLR_RED}Error${CLR_NC}"


# ERROR CODES
# -----------
readonly ERR_WRONG_NUM_OF_INPUTS=10
readonly ERR_FILE_NOT_FOUND=20
readonly ERR_JSON_NODE_NOT_FOUND=30
readonly ERR_JSON_NODE_WRONG_TYPE=31

# JSON KEYS
# ---------


# --------------------------
# SHARED_OBJECTS DEFINITIONS
# --------------------------

# SHARED_OBJECTS: VIEWS/METADATA DEFINITION
readonly JSON_KEY_SHARED_OBJECT_METADATA="metadata"

readonly JSON_KEY_METADATA_ATTR_ASCII_ART="ascii_art"
readonly JSON_KEY_METADATA_ATTR_DESCRIPTION="description"
readonly JSON_KEY_METADATA_ATTR_CAPTION="caption"
readonly JSON_KEY_METADATA_ATTR_NAME="name"


# -----------------------
# CORE_OBJECT DEFINITIONS
# -----------------------

# CORE_OBJECT: CONFIG DEFINITION
readonly JSON_KEY_CORE_OBJECT_CONFIG="config"

readonly JSON_KEY_CONFIG_ATTR_LIST="list"
readonly JSON_KEY_CONFIG_ATTR_DEFAULT_MODE="default_mode"
readonly JSON_KEY_CONFIG_ATTR_DEFAULT_VIEW="default_view"
readonly JSON_KEY_CONFIG_ATTR_DEFAULT_VIEW_CMD_PRE="default_view_cmd_pre"
readonly JSON_KEY_CONFIG_ATTR_DEFAULT_VIEW_CMD_POST="default_view_cmd_post"

readonly VALID_CONFIG_ATTRIBUTES=( \
  "${JSON_KEY_CONFIG_ATTR_LIST}" \
  "${JSON_KEY_CONFIG_ATTR_DEFAULT_MODE}" \
  "${JSON_KEY_CONFIG_ATTR_DEFAULT_VIEW}" \
  "${JSON_KEY_CONFIG_ATTR_DEFAULT_VIEW_CMD_PRE}" \
  "${JSON_KEY_CONFIG_ATTR_DEFAULT_VIEW_CMD_POST}" \
)

# CORE_OBJECT: MODES DEFINITION
readonly JSON_KEY_CORE_OBJECT_MODES="modes"

readonly JSON_KEY_MODE_ATTR_CMD="cmd"
readonly JSON_KEY_MODE_ATTR_CONTINUE="continue"
readonly JSON_KEY_MODE_ATTR_ENABLE_ALL="enable_all"
readonly JSON_KEY_MODE_ATTR_LIST_FILTER="list_filter"
readonly JSON_KEY_MODE_ATTR_REFRESH="refresh_on_call"

readonly VALID_MODE_OBJECT_ATTRIBUTES=( \
  "${JSON_KEY_MODE_ATTR_CMD}" \
  "${JSON_KEY_MODE_ATTR_CONTINUE}" \
  "${JSON_KEY_MODE_ATTR_ENABLE_ALL}" \
  "${JSON_KEY_MODE_ATTR_REFRESH}" \
  "${JSON_KEY_MODE_ATTR_LIST_FILTER}" \
)

# CORE_OBJECT: VIEWS DEFINITION
readonly JSON_KEY_CORE_OBJECT_VIEWS="views"


# JSON BASE LEVEL DEFINITION
# --------------------------
readonly ESSENTIAL_JSON_CORE_OBJECTS=( \
  "${JSON_KEY_CORE_OBJECT_CONFIG}" \
  "${JSON_KEY_CORE_OBJECT_VIEWS}" \
  "${JSON_KEY_CORE_OBJECT_MODES}" \
)


# JSON OBJECT DEFINITIONS
# -----------------------

readonly VALID_METADATA_ATTRIBUTES=( "description" "name" "enable_all" "list_filter" "refresh_on_call" )


# # Get home via ~ and pwd
# pushd ~ > /dev/null
# HOME_DIR=$( pwd )
# readonly HOME_DIR
# popd > /dev/null

# # create escaped home dir for sed usage
# ESCAPED_HOME_DIR=$( printf '%s\n' "${HOME_DIR}" | sed -e 's/[]\/$*.^[]/\\&/g' )
# readonly ESCAPED_HOME_DIR

################################################################################
#  888    888 8888888888 888      8888888b.  8888888888 8888888b.   .d8888b.   #
#  888    888 888        888      888   Y88b 888        888   Y88b d88P  Y88b  #
#  888    888 888        888      888    888 888        888    888 Y88b.       #
#  8888888888 8888888    888      888   d88P 8888888    888   d88P  "Y888b.    #
#  888    888 888        888      8888888P"  888        8888888P"      "Y88b.  #
#  888    888 888        888      888        888        888 T88b         "888  #
#  888    888 888        888      888        888        888  T88b  Y88b  d88P  #
#  888    888 8888888888 88888888 888        8888888888 888   T88b  "Y8888P"   #
################################################################################

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
## @throws ERR_FILE_NOT_FOUND (via hasNode): if config json not found
## @throws ERR_JSON_NODE_NOT_FOUND: if no json-node matching param2 is found
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
## @param3[out] nrai_get_keys_by_node_return: string with parsed keys
##
## @throws ERR_WRONG_NUM_OF_INPUTS: for wrong number of arguments
## @throws ERR_FILE_NOT_FOUND (via getJsonType): if config json not found
## @throws ERR_JSON_NODE_NOT_FOUND (via getJsonType): if no json-node matching param2 is found
## @throws ERR_JSON_NODE_WRONG_TYPE: if json-node is not a json-object
##
getKeysByNode() {
  if [[ "$#" -ne "3" ]]; then
    echo -e "${ERROR} (${0##*/} - ${FUNCNAME[*]}): '${FUNCNAME[0]}' requires three arguments but got '$#'!" 1>&2
    exit "${ERR_WRONG_NUM_OF_INPUTS}"
  fi
  local -r config_json="$1"
  local -r node_name="$2"
  declare -n nrai_get_keys_by_node_return="$3"

  local value_type="k"
  getJsonType "${config_json}" "${node_name}" value_type
  if [[ "${value_type}" != "object" ]]; then
    echo -e "${ERROR} (${0##*/} - ${FUNCNAME[*]}): '${node_name}' is of type '${value_type}' which has no keys. Need node type 'object'!" 1>&2
    exit "${ERR_JSON_NODE_WRONG_TYPE}"
  fi

  # shellcheck disable=SC2034
  read -ra nrai_get_keys_by_node_return <<<"$(jq -r ".${node_name} | keys[]" <"${config_json}" | sed ':a;N;$!ba;s/\n/ /g')"
}

## @fn
##
## @brief read string/number/boolean-node as string and throw error for other json-node-types
##
## @param1[in] config_json: file name of the json config
## @param2[in] node_name: the name of the node if want "evaluated"
## @param3[out] nrstr_get_value_by_key_return: string with parsed keys
##
## @throws ERR_WRONG_NUM_OF_INPUTS: for wrong number of arguments
## @throws ERR_FILE_NOT_FOUND (via getJsonType): if config json not found
## @throws ERR_JSON_NODE_NOT_FOUND (via getJsonType): if no json-node matching param2 is found
## @throws ERR_JSON_NODE_WRONG_TYPE: if json-node is not a json-object
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


################################################################################
# 88888b.   888    888 8888888 888     888888b.  8888888 8888888b.   .d8888b.  #
# 88  "88b  888    888   888   888     888 "Y88b 88      888   Y88b d88P  Y88b #
# 88  .88P  888    888   888   888     888   888 88      888    888 Y88b.      #
# 888888K.  888    888   888   888     888   888 88888   888   d88P  "Y888b.   #
# 88  "Y88b 888    888   888   888     888   888 88      8888888P"      "Y88b. #
# 88    888 888    888   888   888     888   888 88      888 T88b         "888 #
# 88   d88P Y88b..d88P   888   888     888 .d88P 88      888  T88b  Y88b  d88P #
# 888888P"   "Y8888P"  8888888 8888888 888888P"  8888888 888   T88b  "Y8888P"  #
################################################################################

## @fn
##
## @brief read and check validity if default values are given and use first element if not.
##
## @param1[in] config_json: file name of the json config
## @param2[in] json_key: the name of the node if want "evaluated"
## @param3[in] nrai_get_and_check_value_by_key_valid_values: list of valid default values
## @param4[out] nrai_get_keys_by_node_return: string with parsed keys
##
## @return default value either user defined or just first element in list
##
getAndCheckStringByKey() {
  if [[ $# -lt 4 ]]; then
    echo -e "${ERROR} (${0##*/} - ${FUNCNAME[*]}): '${FUNCNAME[0]}' requires four arguments but got '$#'!" 1>&2
    exit 1
  fi
  local -r config_json="$1"
  local -r json_key="$2"
  declare -nr nrai_get_and_check_value_by_key_valid_values="$3"
  declare -n nrstr_get_and_check_value_by_key_return="$4"

  #olocal node_as_string=""
  #ogetNodeAsString "${config_json}" "${node_name}" value_type
  #oif [[ "${value_type}" != "string" ]] && [[ "${value_type}" != "number" ]] && [[ "${value_type}" != "boolean" ]]; then


  if (getNodeAsString "${config_json}" "${json_key}" nrstr_get_and_check_value_by_key_return) && true; then
    # Weird: I would have expected that the value was already assigned within the if block but seems it is not
    getNodeAsString "${config_json}" "${json_key}" nrstr_get_and_check_value_by_key_return
    echo "${nrstr_get_and_check_value_by_key_return}"
    ## check if json node exists and read value
    #if [[ "$(jq 'has('\""${json_key}"\"')' <"${config_json}")" == true ]]; then
    #  default_value="$(jq -r '.'\""${json_key}"\"'' <"${config_json}")"

    # if default value is empty string use first value of valid values list
    if [[ -z "${nrstr_get_and_check_value_by_key_return}" ]]; then
      nrstr_get_and_check_value_by_key_return="${nrai_get_and_check_value_by_key_valid_values[0]}"
    else
      found_match=false
      for val in "${nrai_get_and_check_value_by_key_valid_values[@]}"; do
        if [[ "${val}" == "${nrstr_get_and_check_value_by_key_return}" ]]; then
          found_match=true
          #nrstr_get_and_check_value_by_key_return="${default_value}"
          break
        fi
      done

      # verify we got a match or exit if not
      if [[ "${found_match}" == false ]]; then
        echo -e "${ERROR} (${0##*/} - ${FUNCNAME[*]}): default value '${nrstr_get_and_check_value_by_key_return}' is not in list of valid values '${nrai_get_and_check_value_by_key_valid_values[*]}'." 1>&2
        exit 1
      fi
    fi
  else
    # if no default value found in config json just use first element of valid values
    # shellcheck disable=SC2034
    nrstr_get_and_check_value_by_key_return="${nrai_get_and_check_value_by_key_valid_values[0]}"
  fi
}

## @fn
##
## @brief parses configuration json and assembles a vector of string pairs (data, name)
##
## @param1[in] config_json: file name of the json config
## @param2[out] nria_create_input_data: name-reference to "return" parameter
##
## @return non
##
createInputData() {
  if [[ $# -lt 2 ]]; then
    echo -e "${ERROR} (${0##*/} - ${FUNCNAME[*]}): '${FUNCNAME[0]}' requires exactly two arguments!" 1>&2
    exit 1
  fi
  declare -r config_json="$1"
  declare -n nria_create_input_data="$2"

  # read command for post processing menu list
  CMD_POST_PROC_LIST="$(jq -r '.list.cmd_post_proc_list ' <"${config_json}")"
  readonly CMD_POST_PROC_LIST

  # read command for creation of menu items list
  CMD_GET_LIST=("$(jq -r '.list.cmd_get_list ' <"${config_json}") | ${CMD_POST_PROC_LIST}")
  readonly CMD_GET_LIST

  # apply command to get list and apply post processing command
  # shellcheck disable=SC2034
  read -ra nria_create_input_data <<<"$(eval "${CMD_GET_LIST}" | sed ':a;N;$!ba;s/\n/ /g')"
}

## @fn
##
## @brief reads view commands
##
## @param1[in] config_json: file name of the json config
## @param2[in] json_view: the currently active view
##
readViewCmds() {
  if [[ $# -lt 2 ]]; then
    echo -e "${ERROR} (${0##*/} - ${FUNCNAME[*]}): '${FUNCNAME[0]}' requires exactly two arguments!" 1>&2
    exit 1
  fi
  declare -r config_json="$1"
  declare -r json_view="$2"
  declare -n nria_read_view_cmds="$3"

  read -ra sub_views <<<"$(jq -r '.views.'\""${json_view}"\"' | keys[]' <"${config_json}" | sed ':a;N;$!ba;s/\n/ /g')"
  readonly sub_views

  for sub_view in "${sub_views[@]}"; do
    # ignore metadata
    if [ "${sub_view}" != "metadata" ]; then
      column_cmd="$(jq -r '.views.'\""${json_view}"\"'.'\""${sub_view}"\"'' <"${config_json}")"
      nria_read_view_cmds+=("${column_cmd}")
    fi
  done
}

## @fn
##
## @brief create vector of menu options printed in selection menu
##
## @param1[in] config_json: file name of the json config
## @param2[in] nraa_get_user_input_menu_items: name-reference for menu items
## @param3[in] nraa_get_user_input_menu_opts: name-reference for menu options
##
## @param4[out] nraa_create_menu_items_return: name-reference for user selection
##
## @description: The option strings are assembled column wise in nested for loops to
## ensure a nicely aligned menu. Hence, the outer for loop takes each column command and
## evaluates the command for the current column in the first inner for loop which also
## tracks the widest entry. The second inner loop then just fills the elements of the
## freshly created options-array with spaces to uniform sizes.
##
createMenuItems() {
  if [[ $# -ne 4 ]]; then
    echo -e "${ERROR} (${0##*/} - ${FUNCNAME[*]}): '${FUNCNAME[0]}' requires exactly four arguments but got '$#'!" 1>&2
    exit 1
  fi
  local -r config_json="$1"
  declare -nr nria_create_menu_items_input_data="$2"
  declare -nr nria_create_menu_items_cmds="$3"

  # name reference for vector assembling
  declare -n nraa_create_menu_items_return="$4"

  # get pre command
  declare pre_cmd=""
  if [[ "$(jq 'has("view_cmd_pre")' <"${config_json}")" == true ]]; then
    pre_cmd="$(jq -r '.view_cmd_pre ' <"${config_json}")"
  fi
  # get post command
  declare post_cmd=""
  if [[ "$(jq 'has("view_cmd_post")' <"${config_json}")" == true ]]; then
    post_cmd="$(jq -r '.view_cmd_post ' <"${config_json}")"
  fi

  tmp_option_rows=()
  for i in "${!nria_create_menu_items_input_data[@]}"; do
    tmp_option_rows+=("")
  done
  current_column=()
  column_width=0

  # loop the columns view commands and create one column after the other
  for cmd in "${nria_create_menu_items_cmds[@]}"; do
    current_column=()
    column_width=0

    # loop all menu items and create column entries by executing current columns view command
    # NOTE: menu_item is allowed to be used in config.json view/mode-commands as a wildcard
    # shellcheck disable=SC2034
    for menu_item in "${nria_create_menu_items_input_data[@]}"; do
      if [[ -n "${pre_cmd}" ]]; then
        eval "${pre_cmd}"
      fi

      menu_txt="$(eval "${cmd}")"

      if [[ -n "${post_cmd}" ]]; then
        eval "${post_cmd}"
      fi

      # track entries and update column width if needed
      current_column+=("${menu_txt}")
      column_width=$(("${#menu_txt}" > "${column_width}" ? "${#menu_txt}" : "${column_width}"))
    done

    # increment column width to ensure at least a single space seperation to next column
    ((++column_width))
    # fill each element of current column up to ensure same length
    for i in "${!current_column[@]}"; do
      tmp_option_rows["${i}"]+="$(printf '%-'"${column_width}"'s' "${current_column[${i}]}")"
    done
  done

  for i in "${!tmp_option_rows[@]}"; do
    # shellcheck disable=SC2034
    nraa_create_menu_items_return["${i}"]="$(printf '%-'"${column_width}"'s' "${tmp_option_rows[${i}]}")"
  done
}

## @fn
##
## @brief create vector of optional menu items
##
## @param1[in]: configuration JSON
## @param2[in]: currently active mode
##
## @param3[out]: associative array to assemble with optional options
##
createOptionalMenuItems() {
  if [[ $# -ne 3 ]]; then
    echo -e "${ERROR} (${0##*/} - ${FUNCNAME[*]}): '${FUNCNAME[0]}' requires exactly two arguments!" 1>&2
    exit 1
  fi
  local -r config_json="$1"
  local -r active_mode="$2"

  # name reference to associative return array
  declare -n nraa_create_optional_menu_items="$3"

  declare -a mode_keys
  getKeysByNode "${config_json}" "modes" mode_keys
  declare -a view_keys
  getKeysByNode "${config_json}" "views" view_keys

  if [[ "$(jq '.modes.'\""${active_mode}"\"' | has("enable_all")' <"${config_json}")" == true ]] &&
    [[ "$(jq '.modes.'\""${active_mode}"\"'.enable_all' <"${config_json}")" == true ]]; then
    nraa_create_optional_menu_items["a"]="$(printf "%s\n" "apply all")"
  fi
  if [[ ${#mode_keys} -gt 1 ]]; then
    nraa_create_optional_menu_items["v"]="$(printf "%s\n" "switch view")"
  fi
  if [[ ${#view_keys} -gt 1 ]]; then
    nraa_create_optional_menu_items["m"]="$(printf "%s\n" "switch mode")"
  fi
  nraa_create_optional_menu_items["h"]="$(printf "%s\n" "hide legend")"
  # shellcheck disable=SC2034
  nraa_create_optional_menu_items["q"]="$(printf "%s\n" "quit")"
}


################################################################################
# 8888888 888888b.   .d88888b.  88b    88 88888888 8888888 88b    888 88888b.  #
# 88      88   Y88b d88P" "Y88b 888b   88    88    88      888b   888 88 "Y88b #
# 88      88    888 888     888 8888b  88    88    88      8888b  888 88   888 #
# 88888   88   d88P 888     888 88Y88b 88    88    88888   88Y88b 888 88   888 #
# 88      888888P"  888     888 88 Y88b88    88    88      88 Y88b888 88   888 #
# 88      88 T88b   888     888 88  Y8888    88    88      88  Y88888 88   888 #
# 88      88  T88b  Y88b. .d88P 88   Y888    88    88      88   Y8888 88 .d88P #
# 88      88   T88b  "Y88888P"  88    Y88    88    8888888 88    Y888 88888P"  #
################################################################################

## @fn
##
## @brief Draws the menu.
##
## @param1[in] nraa_draw_menu_items: name-reference for menu items
## @param2[in] nraa_draw_menu_opts: name-reference for menu options
##
drawMenu() {
  if [[ $# -eq 0 ]]; then
    echo -e "${ERROR} (${0##*/} - ${FUNCNAME[*]}): '${FUNCNAME[0]}' requires a list of menu options to draw!" 1>&2
    exit 1
  fi
  declare -nr nraa_draw_menu_items="$1"
  declare -nr nraa_draw_menu_opts="$2"

  echo "Local GIT Repositories:" >/tmp/local_git_repos
  for i in "${!nraa_draw_menu_items[@]}"; do
    printf "%3s) %-s\n" "${i}" "${nraa_draw_menu_items[${i}]}" >>/tmp/local_git_repos
  done

  echo "Options:" >>/tmp/local_git_repos
  for i in "${!nraa_draw_menu_opts[@]}"; do
    printf "%3s) %-s\n" "${i}" "${nraa_draw_menu_opts[${i}]}" >>/tmp/local_git_repos
  done

  boxes -d columns -p a2v1 /tmp/local_git_repos
}

## @fn
##
## @brief get user input the menu.
##
## @param1[in] nraa_get_user_input_menu_items: name-reference for menu items
## @param2[in] nraa_get_user_input_menu_opts: name-reference for menu options
##
## @param3[out] string_get_user_input_return: name-reference for user selection
##
getUserInput() {
  if [[ $# -ne 3 ]]; then
    echo -e "${ERROR} (${0##*/} - ${FUNCNAME[*]}): '${FUNCNAME[0]}' requires exactly three arguments but got $# arguments!" 1>&2
    exit 1
  fi
  declare -nr nraa_get_user_input_menu_items=$1
  declare -nr nraa_get_user_input_menu_opts=$2
  declare -n string_get_user_input_return=$3

  #readonly NUM_REG='^[0-9]+$'
  declare is_valid=0
  input_prompt="Select next action: "
  while [[ ${is_valid} == 0 ]]; do
    read -rp "${input_prompt}" choice

    if [[ "${nraa_get_user_input_menu_items["${choice}"]+true}" ]] && true; then
      string_get_user_input_return="${choice}"
      is_valid=1
    elif [[ "${nraa_get_user_input_menu_opts["${choice}"]+true}" ]] && true; then
      # shellcheck disable=SC2034
      string_get_user_input_return="${choice}"
      is_valid=1
    else
      echo "Invalid input: '${choice}' is neither in '[0, ${#nraa_get_user_input_menu_items[@]}]' nor '{${!nraa_get_user_input_menu_opts[*]}}'"
      input_prompt="Let's try it again: "
    fi
  done
  #case "${choice}" in
  #    q|Q) exit 0 ;;
  #    d)   exit 0 ;;
  #esac
  #if [[ "${choice}" =~ ${NUM_REG} ]]; then
  #  if (( choice <= 0 || choice > ${#MENU_ITEMS[@]} )); then
  #    echo "Bad Input: Please enter a number in [1, ${#MENU_ITEMS[@]}]"
  #  else
  #    echo "${choice}"
  #    echo "${MENU_ITEMS[$((choice-1))]}" | awk '{print $1}'
  #    pushd "$( echo "${MENU_ITEMS[$((choice-1))]}"  | awk '{print $1}' )" > /dev/null
  #    git status
  #    popd > /dev/null
  #    echo ""
  #    read -n 1 -s -r -p "Press any key to continue ... "
  #    echo ""
  #    echo ""
  #  fi
  #else
  #  echo "not a number: ${choice}"
  #  exit 0
  #fi
}

## @fn
##
## @brief .
##
## @param:
##
navi_men() {

  if [[ "$#" -ne "1" ]]; then
    echo -e "${ERROR} (${0##*/} - ${FUNCNAME[*]}): '${FUNCNAME[0]}' requires a configuration file!" 1>&2
    exit 1
  elif [ ! -e "$(readlink -e "$1")" ]; then
    echo -e "${ERROR} (${0##*/} - ${FUNCNAME[*]}): '$1' seems to not be a regular file!" 1>&2
    exit 1
  fi
  local -r config_json="$(readlink -e "$1")"

  # shellcheck disable=SC2034
  declare -a input_data
  createInputData "${config_json}" input_data
  # shellcheck disable=SC2034
  declare -a mode_keys
  getKeysByNode "${config_json}" "modes" mode_keys
  # shellcheck disable=SC2034
  declare -a view_keys
  getKeysByNode "${config_json}" "views" view_keys

  local active_mode=""
  getAndCheckStringByKey "${config_json}" "default_mode" mode_keys active_mode
  local active_view=""
  getAndCheckStringByKey "${config_json}" "default_view" view_keys active_view

  # shellcheck disable=SC2034
  declare -a view_commands
  readViewCmds "${config_json}" "${active_view}" view_commands

  # shellcheck disable=SC2034
  declare -A menu_items_by_id
  createMenuItems "${config_json}" input_data view_commands menu_items_by_id

  # shellcheck disable=SC2034
  declare -A menu_options_by_input_key
  createOptionalMenuItems "${config_json}" "${active_mode}" menu_options_by_input_key

  drawMenu menu_items_by_id menu_options_by_input_key

  declare user_selection
  getUserInput menu_items_by_id menu_options_by_input_key user_selection
  echo "${user_selection}"
}

# batsify script, i.e. ensure nothing is executed if this file is just sourced/loaded
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  navi_men "$@"
fi
