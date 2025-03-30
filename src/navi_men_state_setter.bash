#!/usr/bin/env bash
#   __________________________________________________________________
#  |.================================================================.|
#  || navi_men_state_setter.bash            .::::.                   ||
#  || --------------------------          .::::::::.                 ||
#  ||                                     :::::::::::                ||
#  || @Author: TheDirkKnight              ':::::::::::..             ||
#  ||                                      :::::::::::::::'          ||
#  || @Contact:⠀github.com/DiSc21           ':::::::::::.            ||
#  ||                                         .::::::::::::::'       ||
#  || @Created: 2025-03-15 09:02:48         .:::::::::::...          ||
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
## @brief: Convenience definitions and helpers for navi_men states
##
## @dependencies:
## - bash 4.x or higher (for associative-arrays)
##

set -o errexit
set -o pipefail
set -o nounset

if [ -z "${NAVI_MEN_STATE_SETTER_INCLUDED+who_cares}" ]
then
  # Just some auxiliary const abused as HEADER-GUARD
  readonly NAVI_MEN_STATE_SETTER_INCLUDED=yes

  NMSS_SCRIPT_PATH=$( cd -- "$(readlink -e "$( dirname -- "${BASH_SOURCE[0]}" )" )" &> /dev/null && pwd )
  readonly NMSS_SCRIPT_PATH

  # shellcheck disable=SC1091
  source "${NMSS_SCRIPT_PATH}/navi_men.conf"
  # shellcheck disable=SC1091
  source "${NMSS_SCRIPT_PATH}/navi_men_states.conf"
  # shellcheck disable=SC1091
  source "${NMSS_SCRIPT_PATH}/navi_men_aux_array.bash"
fi


## @fn
##
## @brief
##
## @param1[in] valid_list: space separted list
## @param2[in] select_next: defines if previous or next element should be taken
## @param3[in] state_key: key of the state to be updated
## @param4[out] nraa_update_current_state_nm_states: name-referenced nm_states return
##
updateCurrentState() {
  if [[ $# -ne 4 ]]; then
    echo -e "${ERROR} (${0##*/} - ${FUNCNAME[*]}): '${FUNCNAME[0]}' requires four arguments but got '$#'!" 1>&2
    exit "${ERR_WRONG_NUM_OF_INPUTS}"
  fi
  local -r valid_list="$1"
  local -r select_next="$2"
  local -r state_key="$3"
  declare -n  nraa_update_current_state_nm_states="$4"

  local v_arr="( ${valid_list} )"
  read -ra v_arr<<<"${valid_list}"
  readonly v_arr

  local index=-1
  local -r size="${#v_arr[@]}"

  if [[ $(hasKey nraa_update_current_state_nm_states state_key) == "true" ]]; then
    local -r active_key="${nraa_update_current_state_nm_states["${state_key}"]}"
  else
    echo -e "${ERROR} (${0##*/} - ${FUNCNAME[*]}): '${FUNCNAME[0]}' Could not find a state named '${state_key}'!" 1>&2
    exit "${ERR_MENU_UNKNOWN_STATE}"
  fi

  for i in "${!v_arr[@]}"; do
    [[ "${v_arr[$i]}" = "${active_key}" ]] && index="$(( i + size ))" && break
  done

  if [[ "${index}" -lt 0 ]]; then
    echo -e "${ERROR} (${0##*/} - ${FUNCNAME[*]}): '${FUNCNAME[0]}' Could not find '${active_key}' in '${valid_list}'!" 1>&2
    exit "${ERR_MENU_INVALID_CURRENT_STATE}"
  elif [[ "${select_next}" = "true" ]]; then
    ((++index))
  else
    # this shift is used to circumvent special treatment for first element
    index="$((index+size))"
    ((--index))
  fi
  index="$(( index % size))"

  # shellcheck disable=SC2034
  nraa_update_current_state_nm_states["${state_key}"]="${v_arr["${index}"]}"
}


## @fn
##
## @brief
##
## @param1[in] nraa_update_meta_states_core_data: associative array with data read from config.json
## @param2[out] nraa_update_meta_states_return: associative array to populate with nm_states
##
## @throws ERR_WRONG_NUM_OF_INPUTS: for wrong number of arguments
## @throws ERR_NM_OBJECT_ESSENTIAL_NODE_NOT_FOUND: if essential object nodes are missing
##
updateMetaStates() {
  if [[ "$#" -ne "2" ]]; then
    echo -e "${ERROR} (${0##*/} - ${FUNCNAME[*]}): '${FUNCNAME[0]}' requires two arguments but got '$#'!" 1>&2
    exit "${ERR_WRONG_NUM_OF_INPUTS}"
  fi

  # shellcheck disable=SC2034
  declare -nr nraa_update_meta_states_core_data="$1"
  declare -n nraa_update_meta_states_return="$2"

  local -r cur_view="${JKEY_CORE_OBJECT_VIEWS}${MULTI_DIM_ARRAY_DELIMITER}${nraa_update_meta_states_return["${MDKEY_STATE_VIEW_CURRENT}"]}"
  local -r cur_mode="${JKEY_CORE_OBJECT_MODES}${MULTI_DIM_ARRAY_DELIMITER}${nraa_update_meta_states_return["${MDKEY_STATE_MODE_CURRENT}"]}"

  # get metadata
  declare -A aa_metadata
  getArrayByNamespace "${JKEY_SHARED_OBJECT_METADATA}" nraa_update_meta_states_core_data aa_metadata
  readonly aa_metadata

  # check if current view has metadata caption, if not use config metadata caption or use empty caption if config metadata also not found
  local -r view_cap="${cur_view}${MULTI_DIM_ARRAY_DELIMITER}${JKEY_METADATA_ATTR_CAPTION}"
  local -r conf_view_cap="${JKEY_CORE_OBJECT_CONFIG}${MULTI_DIM_ARRAY_DELIMITER}${JKEY_METADATA_ATTR_CAPTION}"
  if [[ "${aa_metadata["${view_cap}"]+true}" ]]; then
    nraa_update_meta_states_return["${MDKEY_STATE_VIEW_CAPTION}"]="${aa_metadata["${view_cap}"]}"
  elif [[ "${aa_metadata["${conf_view_cap}"]+true}" ]]; then
    nraa_update_meta_states_return["${MDKEY_STATE_VIEW_CAPTION}"]="${aa_metadata["${conf_view_cap}"]}"
  else
    nraa_update_meta_states_return["${MDKEY_STATE_VIEW_CAPTION}"]=""
  fi

  # check if current mode has metadata caption if not use empty caption
  local -r mode_cap="${cur_mode}${MULTI_DIM_ARRAY_DELIMITER}${JKEY_METADATA_ATTR_CAPTION}"
  if [[ "${aa_metadata["${mode_cap}"]+true}" ]]; then
    nraa_update_meta_states_return["${MDKEY_STATE_MODE_CAPTION}"]="${aa_metadata["${mode_cap}"]}"
  else
    nraa_update_meta_states_return["${MDKEY_STATE_MODE_CAPTION}"]=""
  fi
}


## @fn
##
## @brief
##
## @param1[in] nraa_update_mode_states_core_data: associative array with data read from config.json
## @param2[out] nraa_update_mode_states_return: associative array to populate with nm_states
##
## @throws ERR_WRONG_NUM_OF_INPUTS: for wrong number of arguments
## @throws ERR_NM_OBJECT_ESSENTIAL_NODE_NOT_FOUND: if essential object nodes are missing
##
updateModeStates() {
  if [[ "$#" -ne "2" ]]; then
    echo -e "${ERROR} (${0##*/} - ${FUNCNAME[*]}): '${FUNCNAME[0]}' requires two arguments but got '$#'!" 1>&2
    exit "${ERR_WRONG_NUM_OF_INPUTS}"
  fi

  # shellcheck disable=SC2034
  declare -nr nraa_update_mode_states_core_data="$1"
  declare -n nraa_update_mode_states_return="$2"


  local -r cur_mode="${JKEY_CORE_OBJECT_MODES}${MULTI_DIM_ARRAY_DELIMITER}${nraa_update_mode_states_return["${MDKEY_STATE_MODE_CURRENT}"]}"

  # get current mode data
  declare -A aa_cur_mode
  getArrayByNamespace "${cur_mode}" nraa_update_mode_states_core_data aa_cur_mode
  readonly aa_cur_mode

  if [[ "${aa_cur_mode["${JKEY_MODE_ATTR_CMD}"]+true}" ]]; then
    nraa_update_mode_states_return["${MDKEY_STATE_MODE_CMD}"]="${aa_cur_mode["${JKEY_MODE_ATTR_CMD}"]}"
  else
    local -r missing="${cur_mode}${MULTI_DIM_ARRAY_DELIMITER}${JKEY_MODE_ATTR_CMD}"
    echo -e "${ERROR} (${0##*/} - ${FUNCNAME[*]}): cannot update nm-states due to missing core-data: '${missing}'!" 1>&2
    exit "${ERR_MULTI_DIM_NAMESPACE_ELEMENT_NOT_FOUND}"
  fi


  if [[ "${aa_cur_mode["${JKEY_MODE_ATTR_CONTINUE}"]+true}" ]]; then
    nraa_update_mode_states_return["${JKEY_MODE_ATTR_CONTINUE}"]="${aa_cur_mode["${JKEY_MODE_ATTR_CONTINUE}"]}"
  else
    nraa_update_mode_states_return["${JKEY_MODE_ATTR_CONTINUE}"]=""
  fi


  if [[ "${aa_cur_mode["${JKEY_MODE_ATTR_ENABLE_ALL}"]+true}" ]]; then
    nraa_update_mode_states_return["${MDKEY_STATE_MODE_ENABLE_ALL}"]="${aa_cur_mode["${JKEY_MODE_ATTR_ENABLE_ALL}"]}"
  else
    nraa_update_mode_states_return["${MDKEY_STATE_MODE_ENABLE_ALL}"]=""
  fi


  if [[ "${aa_cur_mode["${JKEY_MODE_ATTR_REFRESH}"]+true}" ]]; then
    nraa_update_mode_states_return["${MDKEY_STATE_MODE_REFRESH}"]="${aa_cur_mode["${JKEY_MODE_ATTR_REFRESH}"]}"
  else
    nraa_update_mode_states_return["${MDKEY_STATE_MODE_REFRESH}"]=""
  fi


  if [[ "${aa_cur_mode["${JKEY_MODE_ATTR_LIST_FILTER}"]+true}" ]]; then
    nraa_update_mode_states_return["${MDKEY_STATE_MODE_LIST_FILTER}"]="${aa_cur_mode["${JKEY_MODE_ATTR_LIST_FILTER}"]}"
  else
    nraa_update_mode_states_return["${MDKEY_STATE_MODE_LIST_FILTER}"]=""
  fi
}

## @fn
##
## @brief wrapper calling different update functions
##
## @param1[in] nraa_update_nm_states_core_data: associative array with data read from config.json
## @param2[out] nraa_update_nm_states_return: associative array to populate with nm_states
##
## @throws ERR_WRONG_NUM_OF_INPUTS: for wrong number of arguments
##
updateNMStates() {
  if [[ "$#" -ne "2" ]]; then
    echo -e "${ERROR} (${0##*/} - ${FUNCNAME[*]}): '${FUNCNAME[0]}' requires two arguments but got '$#'!" 1>&2
    exit "${ERR_WRONG_NUM_OF_INPUTS}"
  fi

  # shellcheck disable=SC2034
  declare -nr nraa_update_nm_states_core_data="$1"
  # shellcheck disable=SC2034
  declare -n nraa_update_nm_states_return="$2"

  updateModeStates nraa_update_nm_states_core_data nraa_update_nm_states_return
  updateMetaStates nraa_update_nm_states_core_data nraa_update_nm_states_return
}


## @fn
##
## @brief
##
## @param1[in] nraa_count_modes_and_views_core_data: associative array with data read from config.json
## @param2[out] nraa_count_modes_and_views_return: associative array to populate with nm_states
##
## @throws ERR_WRONG_NUM_OF_INPUTS: for wrong number of arguments
## @throws ERR_NM_OBJECT_ESSENTIAL_NODE_NOT_FOUND: if essential object nodes are missing
##
countModesAndViews() {
  if [[ "$#" -ne "2" ]]; then
    echo -e "${ERROR} (${0##*/} - ${FUNCNAME[*]}): '${FUNCNAME[0]}' requires two arguments but got '$#'!" 1>&2
    exit "${ERR_WRONG_NUM_OF_INPUTS}"
  fi

  # shellcheck disable=SC2034
  declare -nr nraa_count_modes_and_views_core_data="$1"
  declare -n nraa_count_modes_and_views_return="$2"

  local -r cur_view="${JKEY_CORE_OBJECT_VIEWS}${MULTI_DIM_ARRAY_DELIMITER}${nraa_count_modes_and_views_return["${MDKEY_STATE_VIEW_CURRENT}"]}"
  local -r cur_mode="${JKEY_CORE_OBJECT_MODES}${MULTI_DIM_ARRAY_DELIMITER}${nraa_count_modes_and_views_return["${MDKEY_STATE_MODE_CURRENT}"]}"
  local -r delim="${MULTI_DIM_ARRAY_DELIMITER}"

  declare -A aa_mode_data
  declare -A aa_view_data

  getArrayByNamespace "${JKEY_CORE_OBJECT_MODES}" nraa_count_modes_and_views_core_data aa_mode_data
  getArrayByNamespace "${JKEY_CORE_OBJECT_VIEWS}" nraa_count_modes_and_views_core_data aa_view_data

  readonly aa_mode_data
  readonly aa_view_data

  read -ra mode_list <<< "$( tr " " "\n" <<< "${!aa_mode_data[@]}" | sed "s/${delim}.*//" | sort -u | sed ':a;N;$!ba;s/\n/ /g')"
  read -ra view_list <<< "$( tr " " "\n" <<< "${!aa_view_data[@]}" | sed "s/${delim}.*//" | sort -u | sed ':a;N;$!ba;s/\n/ /g')"

  nraa_count_modes_and_views_return["${MDKEY_STATE_MODE_NUMBER}"]="${#mode_list[@]}"
  nraa_count_modes_and_views_return["${MDKEY_STATE_VIEW_NUMBER}"]="${#view_list[@]}"

  nraa_count_modes_and_views_return["${MDKEY_STATE_MODE_LIST}"]="${mode_list[*]}"
  nraa_count_modes_and_views_return["${MDKEY_STATE_VIEW_LIST}"]="${view_list[*]}"
}


## @fn
##
## @brief initialize navi-men states according to core-data (previously read from configuration json)
##
## @param1[in] nraa_init_nm_states_core_data: associative array with data read from config.json
## @param2[out] nraa_init_nm_states_return: associative array to populate with nm_states
##
## @throws ERR_WRONG_NUM_OF_INPUTS: for wrong number of arguments
## @throws ERR_NM_OBJECT_ESSENTIAL_NODE_NOT_FOUND: if essential object nodes are missing
##
initNMStates() {
  if [[ "$#" -ne "2" ]]; then
    echo -e "${ERROR} (${0##*/} - ${FUNCNAME[*]}): '${FUNCNAME[0]}' requires two arguments but got '$#'!" 1>&2
    exit "${ERR_WRONG_NUM_OF_INPUTS}"
  fi

  # shellcheck disable=SC2034
  declare -nr nraa_init_nm_states_core_data="$1"
  declare -n nraa_init_nm_states_return="$2"

  # Check if list command set and store command or throw error
  local tmp="${JKEY_CORE_OBJECT_CONFIG}${MULTI_DIM_ARRAY_DELIMITER}${JKEY_CONFIG_ATTR_CMD_GET_LIST}"
  if [[ "${nraa_init_nm_states_core_data["${tmp}"]+true}" ]]; then
    nraa_init_nm_states_return["${MDKEY_STATE_LIST_CMD}"]="${nraa_init_nm_states_core_data["${tmp}"]}"
  else
    echo -e "${ERROR} (${0##*/} - ${FUNCNAME[*]}): cannot update nm-states due to missing core-data: '${tmp}'!" 1>&2
    exit "${ERR_MULTI_DIM_NAMESPACE_ELEMENT_NOT_FOUND}"
  fi

  local tmp="${JKEY_CORE_OBJECT_CONFIG}${MULTI_DIM_ARRAY_DELIMITER}${JKEY_CONFIG_ATTR_CMD_POST_PROC_LIST}"
  if [[ "${nraa_init_nm_states_core_data["${tmp}"]+true}" ]]; then
    nraa_init_nm_states_return["${MDKEY_STATE_LIST_CMD_POST_PROC}"]="${nraa_init_nm_states_core_data["${tmp}"]}"
  else
    nraa_init_nm_states_return["${MDKEY_STATE_LIST_CMD_POST_PROC}"]=""
  fi


  # check default view or use first view found
  tmp="${JKEY_CORE_OBJECT_CONFIG}${MULTI_DIM_ARRAY_DELIMITER}${JKEY_CONFIG_ATTR_DEFAULT_VIEW}"
  if [[ "${nraa_init_nm_states_core_data["${tmp}"]+true}" ]]; then
    nraa_init_nm_states_return["${MDKEY_STATE_VIEW_CURRENT}"]="${nraa_init_nm_states_core_data["${tmp}"]}"
  else
    declare -A view_data
    getArrayByNamespace "${JKEY_CORE_OBJECT_VIEWS}" nraa_init_nm_states_core_data view_data
    # shellcheck disable=SC2034
    readonly view_data
    local cur_view
    for key in "${!view_data[@]}"; do
      cur_view="${key%"${MULTI_DIM_ARRAY_DELIMITER}"*}"
      break
    done
    readonly cur_view
    nraa_init_nm_states_return["${MDKEY_STATE_VIEW_CURRENT}"]="${cur_view}"
  fi

  # check default mode or use first mode found
  tmp="${JKEY_CORE_OBJECT_CONFIG}${MULTI_DIM_ARRAY_DELIMITER}${JKEY_CONFIG_ATTR_DEFAULT_MODE}"
  if [[ "${nraa_init_nm_states_core_data["${tmp}"]+true}" ]]; then
    nraa_init_nm_states_return["${MDKEY_STATE_MODE_CURRENT}"]="${nraa_init_nm_states_core_data["${tmp}"]}"
  else
    declare -A mode_data
    getArrayByNamespace "${JKEY_CORE_OBJECT_MODES}" nraa_init_nm_states_core_data mode_data
    local cur_mode
    for key in "${!mode_data[@]}"; do
      cur_mode="${key%"${MULTI_DIM_ARRAY_DELIMITER}"*}"
      break
    done
    readonly cur_mode
    nraa_init_nm_states_return["${MDKEY_STATE_MODE_CURRENT}"]="${cur_mode}"
  fi

  tmp="${JKEY_CORE_OBJECT_CONFIG}${MULTI_DIM_ARRAY_DELIMITER}${JKEY_CONFIG_ATTR_VIEW_CMD_PRE}"
  if [[ "${nraa_init_nm_states_core_data["${tmp}"]+true}" ]]; then
    nraa_init_nm_states_return["${MDKEY_STATE_VIEW_CMD_PRE}"]="${nraa_init_nm_states_core_data["${tmp}"]}"
  else
    nraa_init_nm_states_return["${MDKEY_STATE_VIEW_CMD_PRE}"]=""
  fi

  tmp="${JKEY_CORE_OBJECT_CONFIG}${MULTI_DIM_ARRAY_DELIMITER}${JKEY_CONFIG_ATTR_VIEW_CMD_POST}"
  if [[ "${nraa_init_nm_states_core_data["${tmp}"]+true}" ]]; then
    nraa_init_nm_states_return["${MDKEY_STATE_VIEW_CMD_POST}"]="${nraa_init_nm_states_core_data["${tmp}"]}"
  else
    nraa_init_nm_states_return["${MDKEY_STATE_VIEW_CMD_POST}"]=""
  fi

  tmp="${JKEY_CORE_OBJECT_CONFIG}${MULTI_DIM_ARRAY_DELIMITER}${JKEY_CONFIG_ATTR_SHOW_OPTIONS}"
  if [[ "${nraa_init_nm_states_core_data["${tmp}"]+true}" ]]; then
    nraa_init_nm_states_return["${MDKEY_STATE_VIEW_SHOW_OPTIONS}"]="yes"
  else
    nraa_init_nm_states_return["${MDKEY_STATE_VIEW_SHOW_OPTIONS}"]=""
  fi

  tmp="${JKEY_CORE_OBJECT_CONFIG}${MULTI_DIM_ARRAY_DELIMITER}${JKEY_CONFIG_ATTR_HAS_COLOR}"
  if [[ "${nraa_init_nm_states_core_data["${tmp}"]+true}" ]]; then
    if command -v lolcat >/dev/null 2>&1; then
      nraa_init_nm_states_return["${MDKEY_STATE_SYS_SUPPORT_COLOR}"]="yes"
      nraa_init_nm_states_return["${MDKEY_STATE_VIEW_HAS_COLOR}"]="yes"
    else
      nraa_init_nm_states_return["${MDKEY_STATE_SYS_SUPPORT_COLOR}"]=""
      nraa_init_nm_states_return["${MDKEY_STATE_VIEW_HAS_COLOR}"]=""
    fi
  else
    nraa_init_nm_states_return["${MDKEY_STATE_SYS_SUPPORT_COLOR}"]=""
    # shellcheck disable=SC2034
    nraa_init_nm_states_return["${MDKEY_STATE_VIEW_HAS_COLOR}"]=""
  fi

  tmp="${JKEY_CORE_OBJECT_CONFIG}${MULTI_DIM_ARRAY_DELIMITER}${JKEY_CONFIG_ATTR_DRAW_BOXES}"
  if [[ "${nraa_init_nm_states_core_data["${tmp}"]+true}" ]]; then
    if command -v boxes >/dev/null 2>&1; then
      nraa_init_nm_states_return["${MDKEY_STATE_SYS_SUPPORT_BOXES}"]="yes"
      nraa_init_nm_states_return["${MDKEY_STATE_VIEW_DRAW_BOXES}"]="yes"
    # unable to unset -f boxes, hence we just skip cov for this branch
    # :nocov:
    else
      nraa_init_nm_states_return["${MDKEY_STATE_SYS_SUPPORT_BOXES}"]=""
      nraa_init_nm_states_return["${MDKEY_STATE_VIEW_DRAW_BOXES}"]=""
    # :nocov:
    fi
  else
    nraa_init_nm_states_return["${MDKEY_STATE_SYS_SUPPORT_BOXES}"]=""
    # shellcheck disable=SC2034
    nraa_init_nm_states_return["${MDKEY_STATE_VIEW_DRAW_BOXES}"]=""
  fi

  # count modes and views
  countModesAndViews nm_core_data nm_states

  # update dependent nm_states
  updateNMStates nraa_init_nm_states_core_data nraa_init_nm_states_return
}

