#!/usr/bin/env bats

##         _______       __  ___________  ________
##        |   _  "\     /""\("     _   ")/"       )
##        (. |_)  :)   /    \)__/  \\__/(:   \___/
##        |:     \/   /' /\  \  \\_ /    \___  \ 
##        (|  _  \\  //  __'  \ |.  |     __/  \\ 
##        |: |_)  :)/   /  \\  \\:  |    /" \   :)
##        (_______/(___/    \___)\__|   (_______/
##   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡆⠀⠀⠀⠀⠀⠀⠀⣆
##   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⡇⠀⠀⠀⠀⠀⠀⠀⣿⡇
##   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⠀⠀⠀⠀⠀⠀⠀⠃⣿⡄
##   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣷⣼⣿⡇
##   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
##   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣼⣿⣿⣿⣿⣿⣿⣿⣿⡏
##   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢙⡻⢿⣿⡿⡟⣿⡿⠟⣛⠁
##   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⣴⡾⠛⠉⠀⠀⠀⠉⠓⠂ ⡀ ⠐⠛⠁⠀⠀⠀⣸⣿⣦⣄⡀
##   ⠀⠀⠀⠀⠀⢀⣀⣀⣤⣤⣶⣿⣿⣿⣿⣿⣷⣆⠀⠀⠀⠀⠀⠀⢠⡇⠀⠀⠀⠀⠀⠀⠀⠈⣻⣿⣿⣿⣷⣶⣤⣤⣤⣄⣀
##   ⠀⠀⢀⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠁⠀⠀⠀⠀ ⣀⣀  ⠀⠀⠀⠀⠀⠀⠀⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⡄
##   ⠀⡾⣿⣿⣿⣿⠿⠋⢁⣿⣿⣿⣿⣿⣿⣟⣥⣶⢿⡛⠉⠀⠀⠈⠀⠀⠁⠀⠀⠀⠈⢙⡻⢷⣿⣿⣿⣿⣿⣿⣿⡟⠿⠿⣿⣿⣿⣿
##   ⠀⠀⣿⣿⠟⠁⠀⢠⣿⣿⣿⣿⣿⣿⡿⢟⣭⣶⣿⣷⣄⠀⠀⠀⣄⣀⡄⠀⠀⢀⣴⣿⣿⣷⣝⡻⣿⣿⣿⣿⣿⣿⣦⡀⠀⠉⠛⢿
##   ⠀⠀⠿⠁⠀⠀⠀⠋⠁⣿⣿⣿⡿⢋⣴⣿⣿⣿⣿⣿⣿⣿⣶⣾⣿⣿⣿⣶⣿⣿⣿⣿⣿⣿⣿⣿⣮⡻⣿⣿⣿⠯⠉⠙
##   ⠀⠀⠀⠀⠀⠀⠀⠀⠘⠁⠽⠋⠠⠿⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠷⠌⠻⠟
##   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⠿⠿⠿⣿⣿⣿⣿⣿⣿⡿⠿⠿⠿⠟⠁
##   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⠋
##
## @brief: BATS based test environment for navi_men::drawMenu
##
## @usage: 'bats -p <this_bats_file>'
##
## @dependencies:
## - bats (-support/assert)
## - bash 4.3
## - jq
##


setup() {
  load '/usr/lib/bats/bats-support/load'
  load '/usr/lib/bats/bats-assert/load'

  load '../../src/navi_men.conf'
  load '../../src/navi_men_states.conf'

  load '../../src/navi_men_draw.bash'
}


#########################################################
# STANDARD ERRORS
#########################################################

@test "navi_men::drawMenu fail_no_args" {
  run drawMenu
  assert_failure
  assert_equal "$status" "${ERR_WRONG_NUM_OF_INPUTS}"
  assert_output --partial "'drawMenu' requires"
  assert_output --partial "got '0'!"
}
@test "navi_men::drawMenu fail_only_single_arg" {
  run drawMenu "petty"
  assert_failure
  assert_equal "$status" "${ERR_WRONG_NUM_OF_INPUTS}"
  assert_output --partial "'drawMenu' requires"
  assert_output --partial "got '1'!"
}
@test "navi_men::drawMenu fail_only_two_args" {
  run drawMenu "petty" "petty"
  assert_failure
  assert_equal "$status" "${ERR_WRONG_NUM_OF_INPUTS}"
  assert_output --partial "'drawMenu' requires"
  assert_output --partial "got '2'!"
}
@test "navi_men::drawMenu fail_only_three_args" {
  run drawMenu "petty" "petty" "petty"
  assert_failure
  assert_equal "$status" "${ERR_WRONG_NUM_OF_INPUTS}"
  assert_output --partial "'drawMenu' requires"
  assert_output --partial "got '3'!"
}
@test "navi_men::drawMenu fail_too_many_args" {
  run drawMenu "petty" "petty" "petty" "petty" "petty"
  assert_failure
  assert_equal "$status" "${ERR_WRONG_NUM_OF_INPUTS}"
  assert_output --partial "'drawMenu' requires"
  assert_output --partial "got '5'!"
}


# #########################################################
# # FUNCTIONALITY
# #########################################################

@test "navi_men::drawMenu mocked_smoketest_no_fancy_styles" {
  local -A core_data=()
  local -A nm_states=()
  local -A menu_items=()
  local -r file_path="/tmp/navi_men_test_drawMenu$BASHPID"

  nm_states["${MDKEY_STATE_SYS_SUPPORT_BOXES}"]=""
  nm_states["${MDKEY_STATE_SYS_SUPPORT_COLOR}"]=""
  nm_states["${MDKEY_STATE_VIEW_DRAW_BOXES}"]=""
  nm_states["${MDKEY_STATE_VIEW_HAS_COLOR}"]=""

  # create some simple mocks
  drawMenuItems() {
    true
  }
  drawMenuOpts() {
    true
  }
  lolcat() {
    echo "lolcat"
  }
  boxes() {
    echo "boxes"
  }

  export -f drawMenuItems
  export -f drawMenuOpts
  export -f boxes
  export -f lolcat

  mkdir -p "${file_path}"
  echo "Items" > "${file_path}/${FN_MENU_ITEMS}"
  echo "Options" > "${file_path}/${FN_MENU_OPTIONS}"

  run drawMenu core_data nm_states menu_items file_path
  assert_success

  assert_output --partial "Items"
  assert_output --partial "Options"

  rm -rf "${file_path}"
}
@test "navi_men::drawMenu mocked_smoketest_fancy_boxes" {
  local -A core_data=()
  local -A nm_states=()
  local -A menu_items=()
  local -r file_path="/tmp/navi_men_test_drawMenu$BASHPID"

  nm_states["${MDKEY_STATE_SYS_SUPPORT_BOXES}"]="yes"
  nm_states["${MDKEY_STATE_SYS_SUPPORT_COLOR}"]=""
  nm_states["${MDKEY_STATE_VIEW_DRAW_BOXES}"]=""
  nm_states["${MDKEY_STATE_VIEW_HAS_COLOR}"]=""

  # create some simple mocks
  drawMenuItems() {
    true
  }
  drawMenuOpts() {
    true
  }
  lolcat() {
    echo "lolcat"
  }
  boxes() {
    # note: read is required to process piped input ( echo "whatever" | boxes -d ...)
    read foo
    echo "boxes"
  }

  export -f drawMenuItems
  export -f drawMenuOpts
  export -f boxes
  export -f lolcat

  mkdir -p "${file_path}"
  echo "Items" > "${file_path}/${FN_MENU_ITEMS}"
  echo "Options" > "${file_path}/${FN_MENU_OPTIONS}"

  run drawMenu core_data nm_states menu_items file_path
  assert_success

  assert_output --partial "Items"
  assert_output --partial "Options"

  nm_states["${MDKEY_STATE_VIEW_DRAW_BOXES}"]="yes"
  run drawMenu core_data nm_states menu_items file_path
  assert_success
  assert_output --partial "boxes"
  refute_output --partial "Items"
  refute_output --partial "Options"

  rm -rf "${file_path}"
}
@test "navi_men::drawMenu mocked_smoketest_fancy_colors" {
  local -A core_data=()
  local -A nm_states=()
  local -A menu_items=()
  local -r file_path="/tmp/navi_men_test_drawMenu$BASHPID"

  nm_states["${MDKEY_STATE_SYS_SUPPORT_BOXES}"]="yes"
  nm_states["${MDKEY_STATE_SYS_SUPPORT_COLOR}"]="yes"
  nm_states["${MDKEY_STATE_VIEW_DRAW_BOXES}"]=""
  nm_states["${MDKEY_STATE_VIEW_HAS_COLOR}"]=""

  # create some simple mocks
  drawMenuItems() {
    true
  }
  drawMenuOpts() {
    true
  }
  lolcat() {
    echo "lolcat"
  }
  boxes() {
    echo "boxes"
  }

  export -f drawMenuItems
  export -f drawMenuOpts
  export -f boxes
  export -f lolcat

  mkdir -p "${file_path}"
  echo "Items" > "${file_path}/${FN_MENU_ITEMS}"
  echo "Options" > "${file_path}/${FN_MENU_OPTIONS}"

  run drawMenu core_data nm_states menu_items file_path
  assert_success

  assert_output --partial "Items"
  assert_output --partial "Options"

  nm_states["${MDKEY_STATE_VIEW_HAS_COLOR}"]="yes"
  run drawMenu core_data nm_states menu_items file_path
  assert_success
  assert_output --partial "lolcat"
  refute_output --partial "boxes"
  refute_output --partial "Items"
  refute_output --partial "Options"

  rm -rf "${file_path}"
}
@test "navi_men::drawMenu mocked_smoketest_fancy_colors_and_boxes" {
  local -A core_data=()
  local -A nm_states=()
  local -A menu_items=()
  local -r file_path="/tmp/navi_men_test_drawMenu$BASHPID"

  nm_states["${MDKEY_STATE_SYS_SUPPORT_BOXES}"]="yes"
  nm_states["${MDKEY_STATE_SYS_SUPPORT_COLOR}"]="yes"
  nm_states["${MDKEY_STATE_VIEW_DRAW_BOXES}"]=""
  nm_states["${MDKEY_STATE_VIEW_HAS_COLOR}"]=""

  # create some simple mocks
  drawMenuItems() {
    true
  }
  drawMenuOpts() {
    true
  }
  lolcat() {
    echo "lolcat"
  }
  boxes() {
    # note: read is required to process piped input ( echo "whatever" | boxes -d ...)
    read foo
    echo "boxes"
    echo "${foo}"
  }

  export -f drawMenuItems
  export -f drawMenuOpts
  export -f boxes
  export -f lolcat

  mkdir -p "${file_path}"
  echo "Items" > "${file_path}/${FN_MENU_ITEMS}"
  echo "Options" > "${file_path}/${FN_MENU_OPTIONS}"

  run drawMenu core_data nm_states menu_items file_path
  assert_success

  assert_output --partial "Items"
  assert_output --partial "Options"

  nm_states["${MDKEY_STATE_VIEW_DRAW_BOXES}"]="yes"
  nm_states["${MDKEY_STATE_VIEW_HAS_COLOR}"]="yes"
  run drawMenu core_data nm_states menu_items file_path
  assert_success
  assert_output --partial "boxes"
  assert_output --partial "lolcat"
  refute_output --partial "Options"

  rm -rf "${file_path}"
}

