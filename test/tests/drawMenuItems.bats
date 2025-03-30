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
## @brief: BATS based test environment for navi_men::drawMenuItems
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

@test "navi_men::drawMenuItems fail_no_args" {
  run drawMenuItems
  assert_failure
  assert_equal "$status" "${ERR_WRONG_NUM_OF_INPUTS}"
  assert_output --partial "'drawMenuItems' requires"
  assert_output --partial "got '0'!"
}
@test "navi_men::drawMenuItems fail_only_single_arg" {
  run drawMenuItems "petty"
  assert_failure
  assert_equal "$status" "${ERR_WRONG_NUM_OF_INPUTS}"
  assert_output --partial "'drawMenuItems' requires"
  assert_output --partial "got '1'!"
}
@test "navi_men::drawMenuItems fail_only_two_args" {
  run drawMenuItems "petty" "petty"
  assert_failure
  assert_equal "$status" "${ERR_WRONG_NUM_OF_INPUTS}"
  assert_output --partial "'drawMenuItems' requires"
  assert_output --partial "got '2'!"
}
@test "navi_men::drawMenuItems fail_only_three_args" {
  run drawMenuItems "petty" "petty" "petty"
  assert_failure
  assert_equal "$status" "${ERR_WRONG_NUM_OF_INPUTS}"
  assert_output --partial "'drawMenuItems' requires"
  assert_output --partial "got '3'!"
}
@test "navi_men::drawMenuItems fail_too_many_args" {
  run drawMenuItems "petty" "petty" "petty" "petty" "petty"
  assert_failure
  assert_equal "$status" "${ERR_WRONG_NUM_OF_INPUTS}"
  assert_output --partial "'drawMenuItems' requires"
  assert_output --partial "got '5'!"
}


# #########################################################
# # FUNCTIONAL ERRORS
# #########################################################

@test "navi_men::drawMenuItems fail_current_view_not_set" {
  local -A core_data=()
  local -A nm_states=()
  local -A menu_items=()
  local -r file_path="/tmp/navi_men_test_drawMenuItems$BASHPID/"

  run drawMenuItems core_data nm_states menu_items file_path
  assert_failure
  assert_equal "$status" "${ERR_DRAW_ITEMS_CURRENT_VIEW_UNDEFINED}"
}
@test "navi_men::drawMenuItems fail_view_caption_not_set" {
  local -A core_data=()
  local -A nm_states=()
  local -A menu_items=()
  local -r file_path="/tmp/navi_men_test_drawMenuItems$BASHPID/"

  nm_states["${MDKEY_STATE_VIEW_CURRENT}"]="cview"

  # create some simple mocks
  getArrayByNamespace() {
    true
  }
  export -f getArrayByNamespace

  run drawMenuItems core_data nm_states menu_items file_path
  assert_failure
  assert_equal "$status" "${ERR_DRAW_ITEMS_VIEW_CAPTION_UNDEFINED}"
}


# #########################################################
# # FUNCTIONALITY
# #########################################################

@test "navi_men::drawMenuItems pass_empty_list" {
  local -A core_data=()
  local -A nm_states=()
  local -A menu_items=()
  local -r file_path="/tmp/navi_men_test_drawMenuItems$BASHPID"

  nm_states["${MDKEY_STATE_VIEW_CURRENT}"]="cview"
  nm_states["${MDKEY_STATE_VIEW_CAPTION}"]="test_caption"

  # create some simple mocks
  getArrayByNamespace() {
    true
  }
  export -f getArrayByNamespace

  mkdir -p "${file_path}"

  run drawMenuItems core_data nm_states menu_items file_path
  assert_success

  grep "${file_path}/${FN_MENU_ITEMS}" -e "test_caption"

  rm -rf "${file_path}"
}
@test "navi_men::drawMenuItems simple_list_wo_pre_post_cmd" {
  local -A core_data=()
  local -A nm_states=()
  local -A menu_items=()
  local -r file_path="/tmp/navi_men_test_drawMenuItems$BASHPID"

  core_data["${JKEY_CORE_OBJECT_VIEWS}${MULTI_DIM_ARRAY_DELIMITER}cview${MULTI_DIM_ARRAY_DELIMITER}id"]="echo \"\${menu_item}\""
  core_data["${JKEY_CORE_OBJECT_VIEWS}${MULTI_DIM_ARRAY_DELIMITER}cview${MULTI_DIM_ARRAY_DELIMITER}const"]="echo \"constVal\""

  nm_states["${MDKEY_STATE_VIEW_CURRENT}"]="cview"
  nm_states["${MDKEY_STATE_VIEW_CAPTION}"]="test_caption"

  menu_items["${NS_MENU_ITEMS}${MULTI_DIM_ARRAY_DELIMITER}0"]="item_zero"
  menu_items["${NS_MENU_ITEMS}${MULTI_DIM_ARRAY_DELIMITER}1"]="item_one"
  menu_items["${NS_MENU_OPTIONS}${MULTI_DIM_ARRAY_DELIMITER}q"]="quit"
  menu_items["${NS_MENU_OPTIONS}${MULTI_DIM_ARRAY_DELIMITER}o"]="options"

  mkdir -p "${file_path}"

  run drawMenuItems core_data nm_states menu_items file_path
  assert_success

  grep "${file_path}/${FN_MENU_ITEMS}" -e "test_caption"
  grep "${file_path}/${FN_MENU_ITEMS}" -e "constVal"
  grep "${file_path}/${FN_MENU_ITEMS}" -e "item_one"
  grep "${file_path}/${FN_MENU_ITEMS}" -e "item_zero"

  rm -rf "${file_path}"
}
@test "navi_men::drawMenuItems simple_list_with_pre_post_cmd" {
  local -A core_data=()
  local -A nm_states=()
  local -A menu_items=()
  local -r file_path="/tmp/navi_men_test_drawMenuItems$BASHPID"

  core_data["${JKEY_CORE_OBJECT_VIEWS}${MULTI_DIM_ARRAY_DELIMITER}cview${MULTI_DIM_ARRAY_DELIMITER}id"]="echo \"\${menu_item}\""
  core_data["${JKEY_CORE_OBJECT_VIEWS}${MULTI_DIM_ARRAY_DELIMITER}cview${MULTI_DIM_ARRAY_DELIMITER}const"]="echo \"constVal\""

  nm_states["${MDKEY_STATE_VIEW_CMD_PRE}"]="echo \"PRE-\${menu_item}\""
  nm_states["${MDKEY_STATE_VIEW_CMD_POST}"]="echo \"POST-\${menu_item}\""
  nm_states["${MDKEY_STATE_VIEW_CURRENT}"]="cview"
  nm_states["${MDKEY_STATE_VIEW_CAPTION}"]="test_caption"

  menu_items["${NS_MENU_ITEMS}${MULTI_DIM_ARRAY_DELIMITER}0"]="item_zero"
  menu_items["${NS_MENU_ITEMS}${MULTI_DIM_ARRAY_DELIMITER}1"]="item_one"
  menu_items["${NS_MENU_OPTIONS}${MULTI_DIM_ARRAY_DELIMITER}q"]="quit"
  menu_items["${NS_MENU_OPTIONS}${MULTI_DIM_ARRAY_DELIMITER}o"]="options"

  mkdir -p "${file_path}"

  run drawMenuItems core_data nm_states menu_items file_path
  assert_success

  assert_output --partial "PRE-item_zero"
  assert_output --partial "PRE-item_one"
  assert_output --partial "POST-item_zero"
  assert_output --partial "POST-item_one"

  rm -rf "${file_path}"
}

