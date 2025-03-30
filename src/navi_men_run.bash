#!/usr/bin/env bash
#   __________________________________________________________________
#  |.================================================================.|
#  || navi_men_run.bash                     .::::.                   ||
#  || -----------------                   .::::::::.                 ||
#  ||                                     :::::::::::                ||
#  || @Author: TheDirkKnight              ':::::::::::..             ||
#  ||                                      :::::::::::::::'          ||
#  || @Contact:⠀github.com/DiSc21           ':::::::::::.            ||
#  ||                                         .::::::::::::::'       ||
#  || @Created: 2025-03-17 23:53:45         .:::::::::::...          ||
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
## @brief:
##
## @dependencies:
## - bash 4.x or higher (for associative-arrays)
## - bash 4.3 or higher (for name-references)
##

set -o errexit
set -o pipefail
set -o nounset

if [ -z "${NAVI_MEN_RUN_INCLUDED+who_cares}" ]
then
  # Just some auxiliary const abused as HEADER-GUARD
  readonly NAVI_MEN_RUN_INCLUDED=yes

  NMRU_SCRIPT_PATH=$( cd -- "$(readlink -e "$( dirname -- "${BASH_SOURCE[0]}" )" )" &> /dev/null && pwd )
  readonly NMRU_SCRIPT_PATH

  # shellcheck disable=SC1091
  source "${NMRU_SCRIPT_PATH}/navi_men.conf"
  # shellcheck disable=SC1091
  source "${NMRU_SCRIPT_PATH}/navi_men_states.conf"
  # shellcheck disable=SC1091
  source "${NMRU_SCRIPT_PATH}/navi_men_aux_array.bash"
  # shellcheck disable=SC1091
  source "${NMRU_SCRIPT_PATH}/navi_men_core_data.bash"
  # shellcheck disable=SC1091
  source "${NMRU_SCRIPT_PATH}/navi_men_state_setter.bash"
  # shellcheck disable=SC1091
  source "${NMRU_SCRIPT_PATH}/navi_men_menu.bash"
  # shellcheck disable=SC1091
  source "${NMRU_SCRIPT_PATH}/navi_men_draw.bash"
fi

## @fn
##
## @brief get user input the menu.
##
## @param1[in] nraa_get_user_input_menu: name-reference for menu items
## @param2[out] nraa_get_user_input_return: name-reference return output
##
getUserInput() {
  if [[ $# -ne 2 ]]; then
    echo -e "${ERROR} (${0##*/} - ${FUNCNAME[*]}): '${FUNCNAME[0]}' requires two arguments but got '$#'!" 1>&2
    exit "${ERR_WRONG_NUM_OF_INPUTS}"
  fi
  declare -nr nraa_get_user_input_menu="$1"
  declare -n nraa_get_user_input_return="$2"

  local -r ns_items_prefix="${NS_MENU_ITEMS}${MULTI_DIM_ARRAY_DELIMITER}"
  local -r ns_opts_prefix="${NS_MENU_OPTIONS}${MULTI_DIM_ARRAY_DELIMITER}"

  local is_valid=0

  input_prompt="Select next action: "
  while [[ ${is_valid} == 0 ]]; do
    read -rp "${input_prompt}" choice
    if [[ "${nraa_get_user_input_menu["${ns_items_prefix}${choice}"]+true}" ]]; then
      nraa_get_user_input_return="${ns_items_prefix}${choice}"
      is_valid=1
    elif [[ "${nraa_get_user_input_menu["${ns_opts_prefix}${choice}"]+true}" ]]; then
      # shellcheck disable=SC2034
      nraa_get_user_input_return="${ns_opts_prefix}${choice}"
      is_valid=1
    else
      echo "Invalid input: '${choice}' is not in '{${!nraa_get_user_input_menu[*]}}'"
      input_prompt="Let's try it again: "
    fi
  done
}

## @fn
##
## @brief get user input the menu.
##
## @param1[in] nraa_process_options_menu: name-reference for menu items
## @param2[in] nrstr_process_options_selection: namespaced selection
## @param3[out] nraa_process_options_nm_states: name-referenced nm_states return
##
processOptions() {
  if [[ $# -ne 3 ]]; then
    echo -e "${ERROR} (${0##*/} - ${FUNCNAME[*]}): '${FUNCNAME[0]}' requires three arguments but got '$#'!" 1>&2
    exit "${ERR_WRONG_NUM_OF_INPUTS}"
  fi
  # shellcheck disable=SC2034
  declare -nr nraa_process_options_menu="$1"
  declare -nr nrstr_process_options_selection="$2"
  declare -n nraa_process_options_nm_states="$3"

  local -r ns_items_prefix="${NS_MENU_ITEMS}${MULTI_DIM_ARRAY_DELIMITER}"
  local -r ns_opts_prefix="${NS_MENU_OPTIONS}${MULTI_DIM_ARRAY_DELIMITER}"

  case "${nrstr_process_options_selection/${ns_opts_prefix}/}" in
      "${MK_OPT_QUIT}")
        # do nothing, selection q will end main-loop
        ;;
      "${MK_OPT_SHOW_OPTS}")
        if [ -z "${nraa_process_options_nm_states["${MDKEY_STATE_VIEW_SHOW_OPTIONS}"]}" ]; then
          nraa_process_options_nm_states["${MDKEY_STATE_VIEW_SHOW_OPTIONS}"]="yes"
        else
          nraa_process_options_nm_states["${MDKEY_STATE_VIEW_SHOW_OPTIONS}"]=""
        fi
        ;;
      "${MK_OPT_DRAW_BOXES}")
        if [ -z "${nraa_process_options_nm_states["${MDKEY_STATE_VIEW_DRAW_BOXES}"]}" ]; then
          nraa_process_options_nm_states["${MDKEY_STATE_VIEW_DRAW_BOXES}"]="yes"
        else
          nraa_process_options_nm_states["${MDKEY_STATE_VIEW_DRAW_BOXES}"]=""
        fi
        ;;
      "${MK_OPT_COLORIZE}")
        if [ -n "${nraa_process_options_nm_states["${MDKEY_STATE_SYS_SUPPORT_COLOR}"]}" ]; then
          if [ -n "${nraa_process_options_nm_states["${MDKEY_STATE_VIEW_HAS_COLOR}"]}" ]; then
            nraa_process_options_nm_states["${MDKEY_STATE_VIEW_HAS_COLOR}"]=""
          else
            nraa_process_options_nm_states["${MDKEY_STATE_VIEW_HAS_COLOR}"]="true"
          fi
        fi
        ;;
      "${MK_OPT_MODE_NEXT}")
        updateCurrentState "${nraa_process_options_nm_states["${MDKEY_STATE_MODE_LIST}"]}" \
                           "true" \
                           "${MDKEY_STATE_MODE_CURRENT}" \
                           nraa_process_options_nm_states
        ;;
      "${MK_OPT_MODE_PREV}")
        updateCurrentState "${nraa_process_options_nm_states["${MDKEY_STATE_MODE_LIST}"]}" \
                           "false" \
                           "${MDKEY_STATE_MODE_CURRENT}" \
                           nraa_process_options_nm_states
        ;;
      "${MK_OPT_VIEW_NEXT}")
        updateCurrentState "${nraa_process_options_nm_states["${MDKEY_STATE_VIEW_LIST}"]}" \
                           "true" \
                           "${MDKEY_STATE_VIEW_CURRENT}" \
                           nraa_process_options_nm_states
        ;;
      "${MK_OPT_VIEW_PREV}")
        updateCurrentState "${nraa_process_options_nm_states["${MDKEY_STATE_VIEW_LIST}"]}" \
                           "false" \
                           "${MDKEY_STATE_VIEW_CURRENT}" \
                           nraa_process_options_nm_states
        ;;
      *)
        echo "Hans Wurst ist wurstige Wurst im Wurstbroetchen."
        echo "Sein oder nicht sein, essen oder gegessen werden?"
        echo "Das ist hier die Frage, ..."
  esac
}
## @fn
##
## @brief process input, i.e. check if item-action or option-action selected and call helper accordingly
##
## @param1[in] nraa_process_input_menu: name-reference for menu items
## @param2[in] nrstr_process_input_selection: namespaced selection
## @param3[out] nraa_process_input_nm_states: name-referenced nm_states return
##
processInput() {
  if [[ $# -ne 3 ]]; then
    echo -e "${ERROR} (${0##*/} - ${FUNCNAME[*]}): '${FUNCNAME[0]}' requires three arguments but got '$#'!" 1>&2
    exit "${ERR_WRONG_NUM_OF_INPUTS}"
  fi
  declare -nr nraa_process_input_menu="$1"
  declare -nr nrstr_process_input_selection="$2"
  declare -n nraa_process_input_nm_states="$3"

  local -r ns_items_prefix="${NS_MENU_ITEMS}${MULTI_DIM_ARRAY_DELIMITER}"
  local -r ns_opts_prefix="${NS_MENU_OPTIONS}${MULTI_DIM_ARRAY_DELIMITER}"

  if [[ ${nrstr_process_input_selection} == ${ns_items_prefix}* ]]; then
    # IMPORTANT NOTE: 'menu_item' is used as a wild-card in config-json's mode command
    # shellcheck disable=SC2034
    menu_item="${nraa_process_input_menu[${nrstr_process_input_selection}]}"
    eval "${nraa_process_input_nm_states[${MDKEY_STATE_MODE_CMD}]}"
  elif [[ ${nrstr_process_input_selection} == ${ns_opts_prefix}* ]]; then
    processOptions nm_menu_items selection nm_states
  else
    echo -e "${ERROR} (${0##*/} - ${FUNCNAME[*]}): '${FUNCNAME[0]}' unknown input '${nrstr_process_input_selection}'!" 1>&2
    exit "${ERR_MENU_INVALID_SELECTION}"
  fi
}


naviMenRun() {
  if [[ $# -ne 4 ]]; then
    echo -e "${ERROR} (${0##*/} - ${FUNCNAME[*]}): '${FUNCNAME[0]}' requires four arguments but got '$#'!" 1>&2
    exit "${ERR_WRONG_NUM_OF_INPUTS}"
  fi

  # shellcheck disable=SC2034
  local -n nraa_navi_men_run_core_data="$1"
  # shellcheck disable=SC2034
  local -n nraa_navi_men_run_nm_states="$2"
  # shellcheck disable=SC2034
  local -n nraa_navi_men_run_items="$3"
  # shellcheck disable=SC2034
  local -nr nrstr_navi_men_run_tmp_dir="$4"

  #tput -T xterm-256color init
  #tput -T xterm-256color sc
  local selection=""
  while [[ "${selection}" != "${NS_MENU_OPTIONS}${MULTI_DIM_ARRAY_DELIMITER}q" ]]; do
    createMenu nraa_navi_men_run_nm_states nraa_navi_men_run_items

    drawMenu nraa_navi_men_run_core_data \
             nraa_navi_men_run_nm_states \
             nraa_navi_men_run_items \
             nrstr_navi_men_run_tmp_dir
    getUserInput nraa_navi_men_run_items selection
    processInput nraa_navi_men_run_items selection nraa_navi_men_run_nm_states
  done
}


