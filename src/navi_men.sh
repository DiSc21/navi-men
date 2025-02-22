#!/usr/bin/env bash

## ╭───────────────────────────────────────────────────────╮
## │ NavigationMenu⠀ ⠀⠀⠀⠀⠀⠀⢀⡆⠀⠀⠀⠀⠀⠀⠀⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣶⡀⠀⠀⠀⠀⠀⠀ │
## │         ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⡇⠀⠀⠀⠀⠀⠀⠀⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣧⠀⠀⠀⠀⠀⠀ │
## │ @Author:⠀⠀⠀⠀⠀⠀⠀  ⠀⠀⠀⠀⠀⣿⡇⠀⠀⠀⠀⠀⠀⠀⡿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⣿⣆⠀⠀⠀⠀⠀ │
## │ -⠀TheDirkKnight⠀⠀⠀⠀⠀⠀⢸⣿⣿⠀⠀⠀⠀⠀⠀⠀⠃⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⣆⠀⠀⠀⠀ │
## │ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣷⣼⣿⣇⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⣿⣿⣿⣿⣿⣆⠀⠀  │
## │ @Contact:⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⣰⣿⣿⣿⠋⠉⠙⣿⣿⣿⣆⠀  │
## │ -⠀github.com/DiSc21⠀⠀⠈⣠⣼⣿⣿⣿⣿⣿⣿⣿⣿⡏⠀⠀⠀⠀⠀⠀⣰⣿⣿⣿⡇⠀⠀⠀⢸⣿⣿⣟⣆  │
## │ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢙⡻⢿⣿⡿⡟⣿⡿⠟⣛⠁⠀⠀⠀⠀⠀⣴⣿⠿⠛⠋⠁BTW⠈⠙⠛⠿⣿⣦⠀│
## │ @Creation:⠀⠀           ⠉⠓⠂⠁⡀⠀⠐⠛⠁⠀⠀⠀⠀⠀⠘⠉I tried using⠉⠃│
## │ -⠀2025/02/18⠀⠀⣀⣠⣴⡾⠛⠉⠀     ⢠⡇⠀⠀⠀⠀⠀⠀⣸⣿⣦⣄⡀⠀⠀ ⠀Arch!  ⠀⠀⠀⠀│
## │ ⠀ ⠀⠀⠀⠀⠀⢀⣀⣀⣤⣤⣶⣿⣿⣿⣿⣿⣷⣆⠀⠀⠀⠀⠀.__, ⠀⠀⠀⠀⠀⠈⣻⣿⣿⣿⣷⣶⣤⣤⣤⣄⣀⠀⠀⠀⠀⠀⠀⠀│
## │ ⠀ ⠀⠀⢀⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠁⠀⠀⠀⠀    ⠀⠀⠀⠀⠀⠀⠀⠀⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⡄⠀⠀⠀⠀│
## │ ⠀ ⠀⡾⣿⣿⣿⣿⠿⠋⢁⣿⣿⣿⣿⣿⣿⣟⣥⣶⢿⡛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢙⡻⢷⣿⣿⣿⣿⣿⣿⣿⡟⠿⠿⣿⣿⣿⣿⠀⠀⠀⠀│
## │ ⠀ ⠀⠀⣿⣿⠟⠁⠀⢠⣿⣿⣿⣿⣿⣿⡿⢟⣭⣶⣿⣷⣄⠀⠀⠀⣤⣀⡄⠀⠀⢀⣴⣿⣿⣷⣝⡻⣿⣿⣿⣿⣿⣿⣦⡀⠀⠉⠛⢿⠀⠀⠀⠀│
## │ ⠀ ⠀⠀⠿⠁⠀⠀⠀⠋⠁⣿⣿⣿⡿⢋⣴⣿⣿⣿⣿⣿⣿⣿⣶⣾⣿⣿⣿⣶⣿⣿⣿⣿⣿⣿⣿⣿⣮⡻⣿⣿⣿⠯⠉⠙⠀⠀⠀⠀⠀⠀⠀⠀│
## │ ⠀ ⠀⠀⠀⠀⠀⠀⠀⠀⠘⠁⠽⠋⠠⠿⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠷⠌⠻⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀│
## │ ⠀ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ │
## │ @License: MIT ⠀ ⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀│
## │ ⠀  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀│
## │ @Copyright: 2025 (©) TheDirkKnight                    │
## ╰───────────────────────────────────────────────────────╯

## @brief: Json based navigation menu for bash inspired
## by the X11 menu jgmenu https://github.com/jgmenu/jgmenu
##
## @StyleGuide (similar https://google.github.io/styleguide/shellguide.html):
## - prefer local/readonly over declare
## - don't use eval ... ( didn't get it to work without yet )
## - Variable/Function naming
##   - camelCase for functions (note: google wants snake_case, me not)
##   - snake_case_variables
##   - CAPITAL_WITH_UNDERSCORES consts
## - weird: prefix name-references with 'nr_'+fun_name to ensure unique name
## - weird: try to avoid globals
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
## TODO (features):
## - create additional options
## - input checker
## - view/mode changer
## - view/mode description/info/caption
## - width-checker
## - view captions/ascii-art/...
## - height-exceeding
## - colors
## - loccat
##
## TODO (brainfarts):
## - ncurses
## - custom json parser
## - multipage/scroll
## - multiline entries
## - additional commandline args
##
## TODO (infra):
## - GitHub actions
## - code-formater
## - unit tests
## - README.md
## - examples
## - docu
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


# # Get home via ~ and pwd
# pushd ~ > /dev/null
# HOME_DIR=$( pwd )
# readonly HOME_DIR
# popd > /dev/null

# # create escaped home dir for sed usage
# ESCAPED_HOME_DIR=$( printf '%s\n' "${HOME_DIR}" | sed -e 's/[]\/$*.^[]/\\&/g' )
# readonly ESCAPED_HOME_DIR

##
## @brief read configuration fields
##
## @param1[in] config_json: file name of the json config
## @param2[in] node_name: the json node/field to parse
## @param3[out] nrai_get_keys_by_node_return: string with parsed keys
##
function getKeysByNode()
{
  if [[ "$#" -ne "3" ]]; then
    echo -e "${ERROR} (${0##*/} - ${FUNCNAME[*]}): '${FUNCNAME[0]}' expects exactly three arguments but got '$#'!" 1>&2
    exit 1
  fi
  local -r config_json="$1"
  local -r node_name="$2"
  declare -n nrai_get_keys_by_node_return="$3"

  local jq_has_cmd=""

  # note: prepending '.' for main-level nodes (no dots)
  if [[ "$( echo ".${node_name}" | grep -o "\." | wc -l )" == 1 ]]; then
    jq_has_cmd="has(\"${node_name}\")"
  else
    # split node name into subnodes
    OIFS="${IFS}";
    IFS='.'; read -ra jp_nodes <<< "${node_name}";
    IFS="${OIFS}"

    for i in "${!jp_nodes[@]}"; do
      # create jq has command to verify node existance
      if (( "(( i+1 ))" == "${#jp_nodes[@]}" )); then
        jq_has_cmd+=" | has(\"${jp_nodes[-1]}\")"
      else
        jq_has_cmd+=".${jp_nodes[${i}]}"
      fi
    done
  fi

  if [[ "$( jq "${jq_has_cmd}" < "${config_json}" )" == false ]]; then
    echo -e "${ERROR} (${0##*/} - ${FUNCNAME[*]}): '${config_json}' is not a valid NaviMen configuration file. Missing JSON node '${node_name}'" 1>&2
    exit 1
  fi
  # shellcheck disable=SC2034
  read -ra nrai_get_keys_by_node_return <<<"$( jq -r ".${node_name} | keys[]" < "${config_json}"  | sed ':a;N;$!ba;s/\n/ /g')"
}

##
## @brief read and check validity if default values are given and use first element if not.
##
## @param3 list of valid default values
## @param1[in] config_json: file name of the json config
## @param2[in] node_name: the json node/field to parse
## @param2 name of the node keys  to read
## @param3[out] nrai_get_keys_by_node_return: string with parsed keys
##
## @return default value either user defined or just first element in list
##
function getValueByKey()
{
  if [[ $# -lt 4 ]]; then
    echo  -e "${ERROR} (${0##*/} - ${FUNCNAME[*]}): '${FUNCNAME[0]}' requires four arguments but got '$#'!" 1>&2
    exit 1
  fi
  local -r config_json="$1"
  local -r json_key="$2"
  declare -nr nrai_get_value_by_key_valid_values="$3"
  declare -n nrstr_get_value_by_key_return="$4"

  # check if json node exists and read value
  if [[ "$( jq 'has('\""${json_key}"\"')' < "${config_json}" )" == true ]]; then
    default_value="$( jq -r '.'\""${json_key}"\"'' < "${config_json}")"

    # if default value is empty string use first value of valid values list
    if [[ -z "${default_value}" ]]; then
      nrstr_get_value_by_key_return="${nrai_get_value_by_key_valid_values[0]}"
    else
      found_match=false
      for val in "${nrai_get_value_by_key_valid_values[@]}"; do
        if [[ "${val}" == "${default_value}" ]]; then
          found_match=true
          nrstr_get_value_by_key_return="${default_value}"
          break;
        fi
      done
      # verify we got a match or exit if not
      if [[ "${found_match}" == false ]]; then
        echo -e "${ERROR} (${0##*/} - ${FUNCNAME[*]}): default value '${default_value}' is not in list of valid values '${nrai_get_value_by_key_valid_values[*]}'." 1>&2
        exit 1
      fi
    fi
  else
    # if no default value found in config json just use first element of valid values
    # shellcheck disable=SC2034
    nrstr_get_value_by_key_return="${nrai_get_value_by_key_valid_values[0]}"
  fi
}

##
## @brief parses configuration json and assembles a vector of string pairs (data, name)
##
## @param1[in] config_json: file name of the json config
## @param2[out] nria_create_input_data: name-reference to "return" parameter
##
## @return non
##
function createInputData()
{
  if [[ $# -lt 2 ]]; then
    echo -e "${ERROR} (${0##*/} - ${FUNCNAME[*]}): '${FUNCNAME[0]}' requires exactly two arguments!" 1>&2
    exit 1
  fi
  declare -r config_json="$1"
  declare -n nria_create_input_data="$2"

  # read command to create menu array
  #CMD_POST_PROC_LIST="$( jq -r '.list.cmd_post_proc_list ' < navi_men.json  | sed "s/~/${ESCAPED_HOME_DIR}/")"
  CMD_POST_PROC_LIST="$( jq -r '.list.cmd_post_proc_list ' < navi_men.json )"
  readonly CMD_POST_PROC_LIST
  # read command to create menu array
  CMD_GET_LIST=( "$( jq -r '.list.cmd_get_list ' < navi_men.json ) | ${CMD_POST_PROC_LIST}" )
  readonly CMD_GET_LIST

  # apply command to get list and apply post processing command
  # shellcheck disable=SC2034
  read -ra nria_create_input_data <<<"$( eval "${CMD_GET_LIST}" | sed ':a;N;$!ba;s/\n/ /g' )"
}

##
## @brief reads view commands
##
## @param1[in] config_json: file name of the json config
## @param2[in] json_view: the currently active view
##
readViewCmds()
{
  if [[ $# -lt 2 ]]; then
    echo -e "${ERROR} (${0##*/} - ${FUNCNAME[*]}): '${FUNCNAME[0]}' requires exactly two arguments!" 1>&2
    exit 1
  fi
  declare -r config_json="$1"
  declare -r json_view="$2"
  declare -n nria_read_view_cmds="$3"

  read -ra sub_views <<<"$( jq -r '.views.'\""${json_view}"\"' | keys[]' < "${config_json}" | sed ':a;N;$!ba;s/\n/ /g' )"
  readonly sub_views

  for sub_view in "${sub_views[@]}"; do
    # ignore metadata
    if [ "${sub_view}" != "metadata" ]; then
      column_cmd="$( jq -r '.views.'\""${json_view}"\"'.'\""${sub_view}"\"'' < "${config_json}" )"
      nria_read_view_cmds+=( "${column_cmd}" )
    fi
  done
}


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
createMenuItems()
{
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
  if [[ "$( jq 'has("view_cmd_pre")' < navi_men.json )" == true ]]; then
    pre_cmd="$( jq -r '.view_cmd_pre ' < navi_men.json )"
  fi
  # get post command
  declare post_cmd=""
  if [[ "$( jq 'has("view_cmd_post")' < navi_men.json )" == true ]]; then
    post_cmd="$( jq -r '.view_cmd_post ' < navi_men.json )"
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

      menu_txt="$( eval "${cmd}" )"

      if [[ -n "${post_cmd}" ]]; then
        eval "${post_cmd}"
      fi

      # track entries and update column width if needed
      current_column+=( "${menu_txt}" )
      column_width=$(( "${#menu_txt}" > "${column_width}" ? "${#menu_txt}" : "${column_width}" ))
    done

    # increment column width to ensure at least a single space seperation to next column
    ((++column_width))
    # fill each element of current column up to ensure same length
    for i in "${!current_column[@]}"; do
      tmp_option_rows["${i}"]+="$( printf '%-'"${column_width}"'s' "${current_column[${i}]}" )"
    done
  done

  for i in "${!tmp_option_rows[@]}"; do
    # shellcheck disable=SC2034
    nraa_create_menu_items_return["${i}"]="$( printf '%-'"${column_width}"'s' "${tmp_option_rows[${i}]}" )"
  done
}

##
## @brief create vector of optional menu printed in selection menu
##
## @param1[in]: configuration JSON
## @param2[in]: currently active mode
##
## @param3[out]: associative array to assemble with optional options
##
createOptionalMenuItems()
{
  if [[ $# -ne 3 ]]; then
    echo -e "${ERROR} (${0##*/} - ${FUNCNAME[*]}): '${FUNCNAME[0]}' requires exactly two arguments!" 1>&2
    exit 1
  fi
  local -r config_json="$1"
  local -r active_mode="$2"

  # name reference to associative return array
  declare -n nraa_create_optional_menu_items="$3"

  declare -a mode_keys
  getKeysByNode navi_men.json "modes" mode_keys
  declare -a view_keys
  getKeysByNode navi_men.json "views" view_keys

  if [[ "$( jq '.modes.'\""${active_mode}"\"' | has("enable_all")' < "${config_json}" )" == true ]] &&
     [[ "$( jq '.modes.'\""${active_mode}"\"'.enable_all' < "${config_json}" )" == true ]] ; then
       nraa_create_optional_menu_items["a"]=( printf "%s\n" "apply all" );
  fi
  if [[ ${#mode_keys} -gt 1 ]]; then
    nraa_create_optional_menu_items["v"]="$( printf "%s\n" "switch view" )"
  fi
  if [[ ${#view_keys} -gt 1 ]]; then
    nraa_create_optional_menu_items["m"]="$( printf "%s\n" "switch mode" )"
  fi
  nraa_create_optional_menu_items["h"]="$( printf "%s\n" "hide legend" )"
  # shellcheck disable=SC2034
  nraa_create_optional_menu_items["q"]="$( printf "%s\n" "quit" )"
}

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

  echo "Local GIT Repositories:" > /tmp/local_git_repos
  for i in "${!nraa_draw_menu_items[@]}"; do
    printf "%3s) %-s\n" "${i}" "${nraa_draw_menu_items[${i}]}" >> /tmp/local_git_repos
  done

  echo "Options:" >> /tmp/local_git_repos
  for i in "${!nraa_draw_menu_opts[@]}"; do
    printf "%3s) %-s\n" "${i}" "${nraa_draw_menu_opts[${i}]}" >> /tmp/local_git_repos
  done

  boxes -d columns -p a2v1 /tmp/local_git_repos
}

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

##
## @brief .
##
## @param:
##
navi_men() {
  # shellcheck disable=SC2034
  declare -a input_data
  createInputData navi_men.json input_data
  # shellcheck disable=SC2034
  declare -a mode_keys
  getKeysByNode navi_men.json "modes" mode_keys
  # shellcheck disable=SC2034
  declare -a view_keys
  getKeysByNode navi_men.json "views" view_keys

  local active_mode=""
  getValueByKey navi_men.json "default_mode" mode_keys active_mode
  local active_view=""
  getValueByKey navi_men.json "default_view" view_keys active_view

  # shellcheck disable=SC2034
  declare -a view_commands
  readViewCmds navi_men.json "${active_view}" view_commands

  # shellcheck disable=SC2034
  declare -A menu_items_by_id
  createMenuItems navi_men.json input_data view_commands menu_items_by_id

  # shellcheck disable=SC2034
  declare -A menu_options_by_input_key
  createOptionalMenuItems navi_men.json "${active_mode}" menu_options_by_input_key

  drawMenu menu_items_by_id menu_options_by_input_key

  declare user_selection
  getUserInput menu_items_by_id menu_options_by_input_key user_selection
  echo "${user_selection}"
  #echo "${menu_items_by_id[*]}"
  #echo "${menu_options_by_input_key[*]}"
  #getUserInput "${MENU_OPTION_ROWS[@]}"
}

navi_men

