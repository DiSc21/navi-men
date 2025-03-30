#!/usr/bin/env bash

#   __________________________________________________________________
#  |.================================================================.|
#  || navi_men.bash                         .::::.                   ||
#  || -------------                       .::::::::.                 ||
#  ||                                     :::::::::::                ||
#  || @Author: TheDirkKnight              ':::::::::::..             ||
#  ||                                      :::::::::::::::'          ||
#  || @Contact:⠀github.com/DiSc21           ':::::::::::.            ||
#  ||                                         .::::::::::::::'       ||
#  || @Created: 2025-02-22 10:35:53         .:::::::::::...          ||
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
#
#                              __
#                            .d$$b
#                          .' TO$;\
#                         /  : TP._;
#                        / _.;  :Tb|
#                       /   /   ;j$j
#                   _.-"       d$$$$
#                 .' ..       d$$$$;
#                /  /P'      d$$$$P. |\
#               /   "      .d$$$P' |\^"l
#             .'           `T$P^"""""  :
#         ._.'      _.'                ;
#      `-.-".-'-' ._.       _.-"    .-"
#    `.-" _____  ._              .-"
#   -(.g$$$$$$$b.              .'
#     ""^^T$$$P^)            .(:
#       _/  -"  /.'         /:/;
#    ._.'-'`-'  ")/         /;/;
# `-.-"..--""   " /         /  ;
#.-" ..--""        -'          :
#..--""--.-"         (\      .-(\
#  ..--""              `-\(\/;`
#    _.                      :
#                            ;`-
#                           :\

##
## @brief: Json based navigation menu for bash inspired by
## the X11 menu-app jgmenu https://github.com/jgmenu/jgmenu
##
## @dependencies (non-optional):
## - bash 4.x or higher (for associative-arrays)
## - bash 4.3 or higher (for name-references)
## - jq (for json parsing ... shouldn't be too hard to remove)
## - sed/awk/grep
##
## @dependencies (optional):
## - lolcat (for fancy colored menues)
## - boxes (for fancy boxes)
##
## @dependencies (optional/planned):
## - fortune
## - figlet/toilet
## - espeak
##
## @usage: navimen.sh <config.json>
##

# @StyleGuide (similar https://google.github.io/styleguide/shellguide.html):
# - prefer local/readonly over declare
# - don't use eval ... ( didn't get it to work without yet )
# - don't use globals out of convenience
# - add doxygen comments
#   - first line '## @fn' for bash-doxygen filter
#   - opening brace '{' in same line as functions declaration
#   - all "non-trivial" functions should be documented
# - Variable/Function naming
#   - camelCase for functions (note: google wants snake_case, me not)
#   - snake_case_variables
#   - CAPITAL_WITH_UNDERSCORES consts
# - weird: prefix name-references with 'nr_'+fun_name to ensure unique name
# - weird: try to avoid globals
# - weird: pass non-"name-reference" function-parameters quoted

set -o errexit
set -o pipefail
set -o nounset

# just for debugging
#set -o xtrace

NM_SCRIPT_PATH=$( cd -- "$(readlink -e "$( dirname -- "${BASH_SOURCE[0]}" )" )" &> /dev/null && pwd )
readonly NM_SCRIPT_PATH

# shellcheck disable=SC1091
source "${NM_SCRIPT_PATH}/navi_men.conf"
# shellcheck disable=SC1091
source "${NM_SCRIPT_PATH}/navi_men_states.conf"
# shellcheck disable=SC1091
source "${NM_SCRIPT_PATH}/navi_men_aux_array.bash"
# shellcheck disable=SC1091
source "${NM_SCRIPT_PATH}/navi_men_core_data.bash"
# shellcheck disable=SC1091
source "${NM_SCRIPT_PATH}/navi_men_state_setter.bash"
# shellcheck disable=SC1091
source "${NM_SCRIPT_PATH}/navi_men_run.bash"


## @fn
##
## @brief
##
## @param1[in] config_json: file name of the json config
##
main() {
  if [[ "$#" -ne "1" ]]; then
    echo -e "${ERROR} (${0##*/} - ${FUNCNAME[*]}): '${FUNCNAME[0]}' requires a configuration file!" 1>&2
    exit "${ERR_INPUT_FILE_MISSING}"
  elif [ ! -e "$(readlink -e "$1")" ]; then
    echo -e "${ERROR} (${0##*/} - ${FUNCNAME[*]}): '$1' seems to not be a regular file!" 1>&2
    exit "${ERR_INPUT_FILE_NOT_A_REGULAR_FILE}"
  fi

  local -r config_json="$(readlink -e "$1")"


  # ---------------------------
  # create unique tmp directory
  # ---------------------------

  local -r tmp_output_dir="/tmp/navi_men_$( date "+%F-%T")_pid_${BASHPID}"
  mkdir "${tmp_output_dir}"


  # -------------------------------------------------------------------------
  # Read config json and create associative array with "namespaced" core-data
  # -------------------------------------------------------------------------

  declare -A nm_core_data
  createNMCoreData "${config_json}" nm_core_data
  createNMMetadata "${config_json}" nm_core_data
  # shellcheck disable=SC2034
  readonly nm_core_data


  # ---------------------------------------------------------------------------
  # initialize navi-men states, i.e. associative array with "namespaced" states
  # ---------------------------------------------------------------------------

  # shellcheck disable=SC2034
  declare -A nm_states
  initNMStates nm_core_data nm_states


  # ------------------------
  # store initial cursor pos
  # ------------------------

  getCursorPos nm_states
  nm_states["${MDKEY_STATE_TERM_INIT_CURS_X}"]="${nm_states["${MDKEY_STATE_TERM_CURS_X}"]}"
  nm_states["${MDKEY_STATE_TERM_INIT_CURS_Y}"]="${nm_states["${MDKEY_STATE_TERM_CURS_Y}"]}"


  # ------------------------
  # the navi-men "main" loop
  # ------------------------

  # shellcheck disable=SC2034
  declare -A nm_menu_items
  naviMenRun nm_core_data nm_states nm_menu_items tmp_output_dir


  # --------------
  # final clean-up
  # --------------

  rm -rf "${tmp_output_dir}"
}

# batsify script, i.e. ensure nothing is executed if this file is just sourced/loaded
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  main "$@"
fi

