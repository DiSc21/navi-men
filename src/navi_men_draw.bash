#!/usr/bin/env bash
#   __________________________________________________________________
#  |.================================================================.|
#  || navi_men_draw.bash                    .::::.                   ||
#  || ------------------                  .::::::::.                 ||
#  ||                                     :::::::::::                ||
#  || @Author: TheDirkKnight              ':::::::::::..             ||
#  ||                                      :::::::::::::::'          ||
#  || @Contact:⠀github.com/DiSc21           ':::::::::::.            ||
#  ||                                         .::::::::::::::'       ||
#  || @Created: 2025-03-16 15:27:14         .:::::::::::...          ||
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
## @brief: Draw functions for "fancy"-configurable menu styles
##
## @dependencies:
## - bash 4.x or higher (for associative-arrays)
## - bash 4.3 or higher (for name-references)
##
## @dependencies (optional):
## - lolcat (for fancy colored menues)
## - boxes (for fancy boxes)
##

set -o errexit
set -o pipefail
set -o nounset

if [ -z "${NAVI_MEN_DRAW_INCLUDED+who_cares}" ]
then
  # Just some auxiliary const abused as HEADER-GUARD
  readonly NAVI_MEN_DRAW_INCLUDED=yes

  NMDR_SCRIPT_PATH=$( cd -- "$(readlink -e "$( dirname -- "${BASH_SOURCE[0]}" )" )" &> /dev/null && pwd )
  readonly NMDR_SCRIPT_PATH

  # shellcheck disable=SC1091
  source "${NMDR_SCRIPT_PATH}/navi_men.conf"
  # shellcheck disable=SC1091
  source "${NMDR_SCRIPT_PATH}/navi_men_states.conf"
  # shellcheck disable=SC1091
  source "${NMDR_SCRIPT_PATH}/navi_men_aux_array.bash"
  # shellcheck disable=SC1091
  source "${NMDR_SCRIPT_PATH}/navi_men_core_data.bash"
fi



## @fn
##
## @brief draw menu
##
## @param1[in]: : with current navi-men items and options
##
drawMenuItems() {
  if [[ $# -ne 4 ]]; then
    echo -e "${ERROR} (${0##*/} - ${FUNCNAME[*]}): '${FUNCNAME[0]}' requires four arguments but got '$#'!" 1>&2
    exit "${ERR_WRONG_NUM_OF_INPUTS}"
  fi

  # shellcheck disable=SC2034
  local -nr nraa_draw_menu_items_core_data="$1"
  local -nr nraa_draw_menu_items_nm_states="$2"
  # shellcheck disable=SC2034
  local -nr nraa_draw_menu_items_items="$3"
  local -nr nrstr_draw_menu_items_tmp_dir="$4"

  local pre_cmd=""
  local post_cmd=""

  if [ -n "${nraa_draw_menu_items_nm_states["${MDKEY_STATE_VIEW_CMD_PRE}"]+true}" ]; then
    pre_cmd="${nraa_draw_menu_items_nm_states["${MDKEY_STATE_VIEW_CMD_PRE}"]}"
  fi
  if [ -n "${nraa_draw_menu_items_nm_states["${MDKEY_STATE_VIEW_CMD_POST}"]+true}" ]; then
    post_cmd="${nraa_draw_menu_items_nm_states["${MDKEY_STATE_VIEW_CMD_POST}"]}"
  fi


  if [ -z "${nraa_draw_menu_items_nm_states["${MDKEY_STATE_VIEW_CURRENT}"]+true}" ]; then
    echo -e "${ERROR} (${0##*/} - ${FUNCNAME[*]}): '${FUNCNAME[0]}' navi-men state '${MDKEY_STATE_VIEW_CURRENT}' not set!" 1>&2
    exit "${ERR_DRAW_ITEMS_CURRENT_VIEW_UNDEFINED}"
  fi
  local -r cur_view_ns="${JKEY_CORE_OBJECT_VIEWS}${MULTI_DIM_ARRAY_DELIMITER}${nraa_draw_menu_items_nm_states["${MDKEY_STATE_VIEW_CURRENT}"]}"

  # extract non-option menu-items
  declare -A views
  declare -A items
  getArrayByNamespace "${cur_view_ns}" nraa_draw_menu_items_core_data views
  getArrayByNamespace "${NS_MENU_ITEMS}" nraa_draw_menu_items_items items
  readonly views
  readonly items

  local tmp_item_rows=()
  for key in "${!items[@]}"; do
    tmp_item_rows["${key}"]=""
  done

  local current_column=()
  local column_width=0

  for v_cmd in "${views[@]}"; do
    current_column=()
    column_width=0

    # shellcheck disable=SC2034
    for key in $(tr " " "\n" <<<"${!items[@]}" | sort -u ); do
      local menu_item="${items["${key}"]}"
      if [ -n "${pre_cmd}" ]; then
        eval "${pre_cmd}"
      fi

      menu_txt="$(eval "${v_cmd}")"

      if [ -n "${post_cmd}" ]; then
        eval "${post_cmd}"
      fi

      current_column["${key}"]="${menu_txt}"
      column_width=$(("${#menu_txt}" > "${column_width}" ? "${#menu_txt}" : "${column_width}"))
    done

    ((++column_width))
    for key in "${!current_column[@]}"; do
      tmp_item_rows["${key}"]+="$(printf '%-'"${column_width}"'s' "${current_column[${key}]}")"
    done
  done

  if [ -z "${nraa_draw_menu_items_nm_states["${MDKEY_STATE_VIEW_CAPTION}"]+true}" ]; then
    echo -e "${ERROR} (${0##*/} - ${FUNCNAME[*]}): '${FUNCNAME[0]}' navi-men state '${MDKEY_STATE_VIEW_CAPTION}' not set!" 1>&2
    exit "${ERR_DRAW_ITEMS_VIEW_CAPTION_UNDEFINED}"
  fi
  local -r items_file_path="${nrstr_draw_menu_items_tmp_dir}/${FN_MENU_ITEMS}"
  printf "%s\n" "${nraa_draw_menu_items_nm_states["${MDKEY_STATE_VIEW_CAPTION}"]}" >"${items_file_path}"
  for menu_item in $(tr " " "\n" <<<"${!tmp_item_rows[@]}" | sort -u ); do
    printf "%3s) %-s\n" "${menu_item}" "${tmp_item_rows[${menu_item}]}" >>"${items_file_path}"
  done
  printf "\n" >>"${items_file_path}"
}

## @fn
##
## @brief draw menu
##
## @param1[in]: : with current navi-men items and options
##
drawMenuOpts() {
  if [[ $# -ne 3 ]]; then
    echo -e "${ERROR} (${0##*/} - ${FUNCNAME[*]}): '${FUNCNAME[0]}' requires three arguments but got '$#'!" 1>&2
    exit "${ERR_WRONG_NUM_OF_INPUTS}"
  fi

  # shellcheck disable=SC2034
  local -nr nraa_draw_menu_opts_nm_states="$1"
  # shellcheck disable=SC2034
  local -nr nraa_draw_menu_opts_items="$2"
  local -nr nraa_draw_menu_opts_tmp_dir="$3"

  # extract option menu-items
  declare -A options
  getArrayByNamespace "${NS_MENU_OPTIONS}" nraa_draw_menu_opts_items options
  readonly options


  # create output-file path
  local -r opts_file_path="${nraa_draw_menu_opts_tmp_dir}/${FN_MENU_OPTIONS}"

  if [ -z "${nraa_draw_menu_opts_nm_states["${MDKEY_STATE_VIEW_SHOW_OPTIONS}"]}" ]; then
    printf "Press '%s' to display menu options.\n" "${MK_OPT_SHOW_OPTS}" >"${opts_file_path}"
  else
    printf "Navi-Men Options:\n" >"${opts_file_path}"
    for opt in $(tr " " "\n" <<<"${!options[@]}" | sort -u ); do
      printf "%3s) %-s\n" "${opt}" "${options[${opt}]}" >>"${opts_file_path}"
    done
  fi
}


getCursorPos() {
  if [[ $# -ne 1 ]]; then
    echo -e "${ERROR} (${0##*/} - ${FUNCNAME[*]}): '${FUNCNAME[0]}' requires one argument but got '$#'!" 1>&2
    exit "${ERR_WRONG_NUM_OF_INPUTS}"
  fi

  local -n nraa_get_cursor_pos_nm_states="$1"

  local curpos
  read -rsdR -p $'\E[6n' curpos
  curpos=${curpos#*[} # Strip decoration characters <ESC>[

  nraa_get_cursor_pos_nm_states["${MDKEY_STATE_TERM_CURS_Y}"]="$( echo "${curpos}" | cut -d ";" -f 1 )"
  # shellcheck disable=SC2034
  nraa_get_cursor_pos_nm_states["${MDKEY_STATE_TERM_CURS_X}"]="$( echo "${curpos}" | cut -d ";" -f 2 )"
}

drawMenuPreClear() {
  local -n nraa_draw_menu_pre_clear_nm_states="$1"

  output_line_no="${nraa_draw_menu_pre_clear_nm_states["${MDKEY_STATE_OUTPUT_HEIGHT}"]}"
  ((++output_line_no))

  getCursorPos nraa_draw_menu_nm_states

  local -r init_row="${nraa_draw_menu_pre_clear_nm_states["${MDKEY_STATE_TERM_INIT_CURS_Y}"]}"
  local -r cur_row="${nraa_draw_menu_pre_clear_nm_states["${MDKEY_STATE_TERM_CURS_Y}"]}"
  local -r rows="$((cur_row - init_row))"

  local blank_no=0
  if [[ "${rows}" -gt "${output_line_no}" ]]; then
    blank_no="$((rows - output_line_no))"
  fi

  #seq "${output_line_no}" | xargs -I{} tput -T xterm-256color el1 cuu1
  #tput -T xterm-256color rc
  # shellcheck disable=SC2034
  for whocares in $(seq 0 "${rows}"); do
    tput -T xterm-256color el
    tput -T xterm-256color cuu1
  done
  # shellcheck disable=SC2034
  for whocares in $(seq 0 "${blank_no}"); do
    tput -T xterm-256color cud1
    tput -T xterm-256color el
  done
}

## @fn
##
## @brief draw menu
##
## @param1[in]: : with current navi-men items and options
##
drawMenu() {
  if [[ $# -ne 4 ]]; then
    echo -e "${ERROR} (${0##*/} - ${FUNCNAME[*]}): '${FUNCNAME[0]}' requires four arguments but got '$#'!" 1>&2
    exit "${ERR_WRONG_NUM_OF_INPUTS}"
  fi

  # shellcheck disable=SC2034
  local -nr nraa_draw_menu_core_data="$1"
  local -n nraa_draw_menu_nm_states="$2"
  # shellcheck disable=SC2034
  local -nr nraa_draw_menu_items="$3"
  local -nr nraa_draw_menu_tmp_dir="$4"

  drawMenuItems nraa_draw_menu_core_data nraa_draw_menu_nm_states nraa_draw_menu_items nraa_draw_menu_tmp_dir
  drawMenuOpts nraa_draw_menu_nm_states nraa_draw_menu_items nraa_draw_menu_tmp_dir


  local use_boxes="yes"
  if [ -z "${nraa_draw_menu_nm_states["${MDKEY_STATE_SYS_SUPPORT_BOXES}"]}" ]; then
    use_boxes=""
  elif [ -z "${nraa_draw_menu_nm_states["${MDKEY_STATE_VIEW_DRAW_BOXES}"]}" ]; then
    use_boxes=""
  fi

  local use_color="yes"
  if [ -z "${nraa_draw_menu_nm_states["${MDKEY_STATE_SYS_SUPPORT_COLOR}"]}" ]; then
    use_color=""
  elif [ -z "${nraa_draw_menu_nm_states["${MDKEY_STATE_VIEW_HAS_COLOR}"]}" ]; then
    use_color=""
  fi


  local -r items_file_path="${nraa_draw_menu_tmp_dir}/${FN_MENU_ITEMS}"
  local -r opts_file_path="${nraa_draw_menu_tmp_dir}/${FN_MENU_OPTIONS}"

  local output_line_no=0

  if [ "${nraa_draw_menu_nm_states["${MDKEY_STATE_OUTPUT_HEIGHT}"]+true}" ]; then
    nraa_draw_menu_nm_states["${MDKEY_STATE_OUTPUT_PREV_HEIGHT}"]="${nraa_draw_menu_nm_states["${MDKEY_STATE_OUTPUT_HEIGHT}"]}"
    if [ -z "${nraa_draw_menu_nm_states["${MDKEY_STATE_OUTPUT_MAX_HEIGHT}"]+true}" ]; then
      nraa_draw_menu_nm_states["${MDKEY_STATE_OUTPUT_MAX_HEIGHT}"]="${nraa_draw_menu_nm_states["${MDKEY_STATE_OUTPUT_HEIGHT}"]}"
    fi
  else
    nraa_draw_menu_nm_states["${MDKEY_STATE_OUTPUT_PREV_HEIGHT}"]="${output_line_no}"
    nraa_draw_menu_nm_states["${MDKEY_STATE_OUTPUT_MAX_HEIGHT}"]="${output_line_no}"
  fi



  if [ -z "${use_boxes}" ]; then
    output_line_no="$(wc -l "${items_file_path}" "${opts_file_path}" | tail -1 | awk '{print $1;}')"
    nraa_draw_menu_nm_states["${MDKEY_STATE_OUTPUT_HEIGHT}"]="${output_line_no}"
    drawMenuPreClear nraa_draw_menu_nm_states
    if [ -z "${use_color}" ]; then
      cat "${items_file_path}" "${opts_file_path}"
    else
      lolcat -f "${items_file_path}" "${opts_file_path}"
    fi
  else
    output_line_no="$(cat "${items_file_path}" "${opts_file_path}" | boxes -d columns -p a2v1 | wc -l | awk '{print $1;}' )"
    nraa_draw_menu_nm_states["${MDKEY_STATE_OUTPUT_HEIGHT}"]="${output_line_no}"
    drawMenuPreClear nraa_draw_menu_nm_states
    if [ -z "${use_color}" ]; then
      cat "${items_file_path}" "${opts_file_path}" | boxes -d columns -p a2v1
    else
      lolcat -f "${items_file_path}" | cat - "${opts_file_path}" | boxes -d columns -p a2v1
    fi
  fi
  nraa_draw_menu_nm_states["${MDKEY_STATE_OUTPUT_HEIGHT}"]="${output_line_no}"
}
