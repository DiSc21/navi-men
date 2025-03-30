#!/usr/bin/env bash

#   __________________________________________________________________
#  |.================================================================.|
#  || navi_men_menu.bash                    .::::.                   ||
#  || ------------------                  .::::::::.                 ||
#  ||                                     :::::::::::                ||
#  || @Author: TheDirkKnight              ':::::::::::..             ||
#  ||                                      :::::::::::::::'          ||
#  || @Contact:⠀github.com/DiSc21           ':::::::::::.            ||
#  ||                                         .::::::::::::::'       ||
#  || @Created: 2025-03-17 11:56:02         .:::::::::::...          ||
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


set -o errexit
set -o pipefail
set -o nounset

if [ -z "${NAVI_MEN_MENU_INCLUDED+who_cares}" ]
then
  # Just some auxiliary const abused as HEADER-GUARD
  readonly NAVI_MEN_MENU_INCLUDED=yes

  NMME_SCRIPT_PATH=$( cd -- "$(readlink -e "$( dirname -- "${BASH_SOURCE[0]}" )" )" &> /dev/null && pwd )
  readonly NMME_SCRIPT_PATH

  # shellcheck disable=SC1091
  source "${NMME_SCRIPT_PATH}/navi_men.conf"
  # shellcheck disable=SC1091
  source "${NMME_SCRIPT_PATH}/navi_men_states.conf"
  # shellcheck disable=SC1091
  source "${NMME_SCRIPT_PATH}/navi_men_aux_array.bash"
  # shellcheck disable=SC1091
  source "${NMME_SCRIPT_PATH}/navi_men_core_data.bash"
fi

## @fn
##
## @brief
##
## @param1[in] nraa_create_menu_options_nm_states: current navi-men states
## @param2[out] nraa_create_menu_options_return: associative array to populate with menu options
##
## @throws ERR_WRONG_NUM_OF_INPUTS: for wrong number of arguments
##
createMenuOptions() {
  if [[ "$#" -ne "2" ]]; then
    echo -e "${ERROR} (${0##*/} - ${FUNCNAME[*]}): '${FUNCNAME[0]}' requires two arguments but got '$#'!" 1>&2
    exit "${ERR_WRONG_NUM_OF_INPUTS}"
  fi

  # shellcheck disable=SC2034
  declare -nr nraa_create_menu_options_nm_states="$1"
  declare -n  nraa_create_menu_options_return="$2"

  nraa_create_menu_options_return=()

  if [[ "${nraa_create_menu_options_nm_states["${MDKEY_STATE_MODE_NUMBER}"]}" -gt 0 ]]; then
    nraa_create_menu_options_return["${MK_OPT_MODE_NEXT}"]="next mode"
    nraa_create_menu_options_return["${MK_OPT_MODE_PREV}"]="previous mode"
  fi
  if [[ "${nraa_create_menu_options_nm_states["${MDKEY_STATE_VIEW_NUMBER}"]}" -gt 0 ]]; then
    nraa_create_menu_options_return["${MK_OPT_VIEW_NEXT}"]="next view"
    nraa_create_menu_options_return["${MK_OPT_VIEW_PREV}"]="prev view"
  fi

  if [ -n "${nraa_create_menu_options_nm_states["${MDKEY_STATE_MODE_ENABLE_ALL}"]}" ]; then
    nraa_create_menu_options_return["${MK_OPT_APPLY_ALL}"]="apply to all"
  fi
  if [ -n "${nraa_create_menu_options_nm_states["${MDKEY_STATE_SYS_SUPPORT_COLOR}"]}" ]; then
    nraa_create_menu_options_return["${MK_OPT_COLORIZE}"]="toggle color on/off"
  fi
  if [ -n "${nraa_create_menu_options_nm_states["${MDKEY_STATE_SYS_SUPPORT_BOXES}"]}" ]; then
    nraa_create_menu_options_return["${MK_OPT_DRAW_BOXES}"]="toggle boxes on/off"
  fi

  nraa_create_menu_options_return["${MK_OPT_SHOW_OPTS}"]="toggle options on/off"
  # shellcheck disable=SC2034
  nraa_create_menu_options_return["${MK_OPT_QUIT}"]="quit"
}

## @fn
##
## @brief create vector of menu options printed in selection menu
##
## @param1[in] nraa_create_menu_items_nm_states: current navi-men states
## @param2[out] nraa_create_menu_items_return: name-reference for user selection
##
createMenuItems() {
  if [[ $# -ne 2 ]]; then
    echo -e "${ERROR} (${0##*/} - ${FUNCNAME[*]}): '${FUNCNAME[0]}' requires two arguments but got '$#'!" 1>&2
    exit "${ERR_WRONG_NUM_OF_INPUTS}"
  fi

  declare -nr nraa_create_menu_items_nm_states="$1"
  declare -n nraa_create_menu_items_return="$2"
  local -r list_cmd="${nraa_create_menu_items_nm_states[${MDKEY_STATE_LIST_CMD}]}"
  local -r post_proc_cmd="${nraa_create_menu_items_nm_states[${MDKEY_STATE_LIST_CMD_POST_PROC}]}"

  local cmd="${list_cmd}"
  if [ -n "${post_proc_cmd}" ] && true; then
    cmd="${list_cmd} | ${post_proc_cmd}"
  fi

  # apply command to get list and apply post processing command
  read -ra indexed_menu_items <<<"$(eval "${cmd}" | sed ':a;N;$!ba;s/\n/ /g')"

  for index in "${!indexed_menu_items[@]}"; do
    # shellcheck disable=SC2034
    nraa_create_menu_items_return["${index}"]="${indexed_menu_items["${index}"]}"
  done
}


## @fn
##
## @brief create vector of optional menu items
##
## @param1[in]: nraa_create_menu_nm_states: associative array with current navi-men states
## @param2[out]: nraa_create_menu_return: associative array with items and options by key
##
createMenu() {
  if [[ $# -ne 2 ]]; then
    echo -e "${ERROR} (${0##*/} - ${FUNCNAME[*]}): '${FUNCNAME[0]}' requires two arguments but got '$#'!" 1>&2
    exit "${ERR_WRONG_NUM_OF_INPUTS}"
  fi

  # shellcheck disable=SC2034
  declare -nr nraa_create_menu_nm_states="$1"
  declare -n nraa_create_menu_return="$2"

  # shellcheck disable=SC2034
  declare -A nm_menu_options_by_id
  createMenuOptions nraa_create_menu_nm_states nm_menu_options_by_id

  # shellcheck disable=SC2034
  declare -A nm_menu_items_by_id
  createMenuItems nraa_create_menu_nm_states nm_menu_items_by_id

  # shellcheck disable=SC2034
  nraa_create_menu_return=()
  addNamespacedArray "${NS_MENU_OPTIONS}" nm_menu_options_by_id nraa_create_menu_return
  addNamespacedArray "${NS_MENU_ITEMS}" nm_menu_items_by_id nraa_create_menu_return
}

