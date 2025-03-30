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
## @brief: BATS based test environment for navi_men::initNMStates
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

  load '../../src/navi_men_menu.bash'
  load '../../src/navi_men_state_setter.bash'
}


#########################################################
# STANDARD ERRORS
#########################################################

@test "navi_men::initNMStates fail_no_args" {
  run initNMStates
  assert_failure
  assert_equal "$status" "${ERR_WRONG_NUM_OF_INPUTS}"
  assert_output --partial "'initNMStates' requires"
  assert_output --partial "got '0'!"
}
@test "navi_men::initNMStates fail_only_single_arg" {
  run initNMStates "petty"
  assert_failure
  assert_equal "$status" "${ERR_WRONG_NUM_OF_INPUTS}"
  assert_output --partial "'initNMStates' requires"
  assert_output --partial "got '1'!"
}
@test "navi_men::initNMStates fail_too_many_args" {
  run initNMStates "petty" "petty" "petty"
  assert_failure
  assert_equal "$status" "${ERR_WRONG_NUM_OF_INPUTS}"
  assert_output --partial "'initNMStates' requires"
  assert_output --partial "got '3'!"
}

# #########################################################
# # FUNCTIONAL ERRORS
# #########################################################

@test "navi_men::initNMStates fail_missing_list_cmd" {
  local -A test_core_data=()
  local -A test_nm_states=()

  run initNMStates test_core_data test_nm_states
  assert_failure
  assert_equal "$status" "${ERR_MULTI_DIM_NAMESPACE_ELEMENT_NOT_FOUND}"
}

# #########################################################
# # FUNCTIONALITY
# #########################################################

# note: this are some late night brute-force tests ... needs some rework same es tested function
@test "navi_men::initNMStates list_commands_set" {
  local -r pre_view="${JKEY_CORE_OBJECT_VIEWS}${MULTI_DIM_ARRAY_DELIMITER}"
  local -r pre_mode="${JKEY_CORE_OBJECT_MODES}${MULTI_DIM_ARRAY_DELIMITER}"

  local -A test_nm_states=()
  local -A test_core_data=()
  test_core_data["${pre_mode}mode_one${MULTI_DIM_ARRAY_DELIMITER}${JKEY_MODE_ATTR_CMD}"]="cmd_one"
  test_core_data["${pre_mode}mode_two${MULTI_DIM_ARRAY_DELIMITER}${JKEY_MODE_ATTR_CMD}"]="cmd_two"
  test_core_data["${pre_mode}mode_three${MULTI_DIM_ARRAY_DELIMITER}${JKEY_MODE_ATTR_CMD}"]="cmd_three"
  test_core_data["${pre_view}view_one${MULTI_DIM_ARRAY_DELIMITER}wtf"]="wtf_one"
  test_core_data["${pre_view}view_one${MULTI_DIM_ARRAY_DELIMITER}wtf2"]="wtf_two"
  test_core_data["${pre_view}view_one${MULTI_DIM_ARRAY_DELIMITER}wtf3"]="wtf_three"
  test_core_data["${pre_view}view_two${MULTI_DIM_ARRAY_DELIMITER}wtf"]="wtf_one_two"

  local -r list_cmd="${JKEY_CORE_OBJECT_CONFIG}${MULTI_DIM_ARRAY_DELIMITER}${JKEY_CONFIG_ATTR_CMD_GET_LIST}"
  test_core_data["${list_cmd}"]="list_cmd"
  #local -r def_view="${JKEY_CORE_OBJECT_CONFIG}${MULTI_DIM_ARRAY_DELIMITER}${JKEY_CONFIG_ATTR_DEFAULT_VIEW}"
  #test_core_data["${def_view}"]="view_one"
  #local -r def_mode="${JKEY_CORE_OBJECT_CONFIG}${MULTI_DIM_ARRAY_DELIMITER}${JKEY_CONFIG_ATTR_DEFAULT_MODE}"
  #test_core_data["${def_mode}"]="mode_one"

  # create some simple mocks
  countModesAndViews() {
    true
  }
  updateNMStates() {
    true
  }
  export -f countModesAndViews
  export -f updateNMStates


  run initNMStates test_core_data test_nm_states
  assert_success
  initNMStates test_core_data test_nm_states
  assert_equal "$?" 0
  assert_equal "${test_nm_states[${MDKEY_STATE_LIST_CMD}]}" "list_cmd"
  assert_equal "${test_nm_states[${MDKEY_STATE_LIST_CMD_POST_PROC}]}" ""
  assert_equal "${test_nm_states[${MDKEY_STATE_VIEW_CMD_PRE}]}" ""
  assert_equal "${test_nm_states[${MDKEY_STATE_VIEW_CMD_POST}]}" ""
  assert_equal "${test_nm_states[${MDKEY_STATE_VIEW_SHOW_OPTIONS}]}" ""
  assert_equal "${test_nm_states[${MDKEY_STATE_VIEW_HAS_COLOR}]}" ""
  assert_equal "${test_nm_states[${MDKEY_STATE_VIEW_DRAW_BOXES}]}" ""

  test_core_data["${JKEY_CORE_OBJECT_CONFIG}${MULTI_DIM_ARRAY_DELIMITER}${JKEY_CONFIG_ATTR_CMD_POST_PROC_LIST}"]="list_cmd_post"
  initNMStates test_core_data test_nm_states
  assert_equal "$?" 0
  assert_equal "${test_nm_states[${MDKEY_STATE_LIST_CMD_POST_PROC}]}" "list_cmd_post"
  assert_equal "${test_nm_states[${MDKEY_STATE_VIEW_CURRENT}]:0:5}" "view_"
  assert_equal "${test_nm_states[${MDKEY_STATE_MODE_CURRENT}]:0:5}" "mode_"

  run initNMStates test_core_data test_nm_states
  assert_success
}

@test "navi_men::initNMStates view_cmd_and_options_set" {
  local -r pre_view="${JKEY_CORE_OBJECT_VIEWS}${MULTI_DIM_ARRAY_DELIMITER}"
  local -r pre_mode="${JKEY_CORE_OBJECT_MODES}${MULTI_DIM_ARRAY_DELIMITER}"

  local -A test_nm_states=()
  local -A test_core_data=()
  test_core_data["${pre_mode}mode_one${MULTI_DIM_ARRAY_DELIMITER}${JKEY_MODE_ATTR_CMD}"]="cmd_one"
  test_core_data["${pre_mode}mode_two${MULTI_DIM_ARRAY_DELIMITER}${JKEY_MODE_ATTR_CMD}"]="cmd_two"
  test_core_data["${pre_mode}mode_three${MULTI_DIM_ARRAY_DELIMITER}${JKEY_MODE_ATTR_CMD}"]="cmd_three"
  test_core_data["${pre_view}view_one${MULTI_DIM_ARRAY_DELIMITER}wtf"]="wtf_one"
  test_core_data["${pre_view}view_one${MULTI_DIM_ARRAY_DELIMITER}wtf2"]="wtf_two"
  test_core_data["${pre_view}view_one${MULTI_DIM_ARRAY_DELIMITER}wtf3"]="wtf_three"
  test_core_data["${pre_view}view_two${MULTI_DIM_ARRAY_DELIMITER}wtf"]="wtf_one"
  test_core_data["${pre_view}view_two${MULTI_DIM_ARRAY_DELIMITER}wtf2"]="wtf_two"
  test_core_data["${pre_view}view_two${MULTI_DIM_ARRAY_DELIMITER}wtf3"]="wtf_three"

  local -r list_cmd="${JKEY_CORE_OBJECT_CONFIG}${MULTI_DIM_ARRAY_DELIMITER}${JKEY_CONFIG_ATTR_CMD_GET_LIST}"
  test_core_data["${list_cmd}"]="list_cmd"
  local -r def_view="${JKEY_CORE_OBJECT_CONFIG}${MULTI_DIM_ARRAY_DELIMITER}${JKEY_CONFIG_ATTR_DEFAULT_VIEW}"
  test_core_data["${def_view}"]="view_one"
  local -r def_mode="${JKEY_CORE_OBJECT_CONFIG}${MULTI_DIM_ARRAY_DELIMITER}${JKEY_CONFIG_ATTR_DEFAULT_MODE}"
  test_core_data["${def_mode}"]="mode_one"

  # create some simple mocks
  countModesAndViews() {
    true
  }
  updateNMStates() {
    true
  }
  export -f countModesAndViews
  export -f updateNMStates


  test_core_data["${JKEY_CORE_OBJECT_CONFIG}${MULTI_DIM_ARRAY_DELIMITER}${JKEY_CONFIG_ATTR_VIEW_CMD_PRE}"]="view_pre"
  test_core_data["${JKEY_CORE_OBJECT_CONFIG}${MULTI_DIM_ARRAY_DELIMITER}${JKEY_CONFIG_ATTR_VIEW_CMD_POST}"]="view_post"
  test_core_data["${JKEY_CORE_OBJECT_CONFIG}${MULTI_DIM_ARRAY_DELIMITER}${JKEY_CONFIG_ATTR_SHOW_OPTIONS}"]="show_options"
  initNMStates test_core_data test_nm_states
  assert_equal "$?" 0
  assert_equal "${test_nm_states[${MDKEY_STATE_VIEW_CMD_PRE}]}" "view_pre"
  assert_equal "${test_nm_states[${MDKEY_STATE_VIEW_CMD_POST}]}" "view_post"
  assert_equal "${test_nm_states[${MDKEY_STATE_VIEW_SHOW_OPTIONS}]}" "yes"

  run initNMStates test_core_data test_nm_states
  assert_success
}

@test "navi_men::initNMStates color_options" {
  local -r pre_view="${JKEY_CORE_OBJECT_VIEWS}${MULTI_DIM_ARRAY_DELIMITER}"
  local -r pre_mode="${JKEY_CORE_OBJECT_MODES}${MULTI_DIM_ARRAY_DELIMITER}"

  local -A test_nm_states=()
  local -A test_core_data=()
  test_core_data["${pre_mode}mode_one${MULTI_DIM_ARRAY_DELIMITER}${JKEY_MODE_ATTR_CMD}"]="cmd_one"
  test_core_data["${pre_mode}mode_two${MULTI_DIM_ARRAY_DELIMITER}${JKEY_MODE_ATTR_CMD}"]="cmd_two"
  test_core_data["${pre_mode}mode_three${MULTI_DIM_ARRAY_DELIMITER}${JKEY_MODE_ATTR_CMD}"]="cmd_three"
  test_core_data["${pre_view}view_one${MULTI_DIM_ARRAY_DELIMITER}wtf"]="wtf_one"
  test_core_data["${pre_view}view_one${MULTI_DIM_ARRAY_DELIMITER}wtf2"]="wtf_two"
  test_core_data["${pre_view}view_one${MULTI_DIM_ARRAY_DELIMITER}wtf3"]="wtf_three"
  test_core_data["${pre_view}view_two${MULTI_DIM_ARRAY_DELIMITER}wtf"]="wtf_one"
  test_core_data["${pre_view}view_two${MULTI_DIM_ARRAY_DELIMITER}wtf2"]="wtf_two"
  test_core_data["${pre_view}view_two${MULTI_DIM_ARRAY_DELIMITER}wtf3"]="wtf_three"

  local -r list_cmd="${JKEY_CORE_OBJECT_CONFIG}${MULTI_DIM_ARRAY_DELIMITER}${JKEY_CONFIG_ATTR_CMD_GET_LIST}"
  test_core_data["${list_cmd}"]="list_cmd"
  local -r def_view="${JKEY_CORE_OBJECT_CONFIG}${MULTI_DIM_ARRAY_DELIMITER}${JKEY_CONFIG_ATTR_DEFAULT_VIEW}"
  test_core_data["${def_view}"]="view_one"
  local -r def_mode="${JKEY_CORE_OBJECT_CONFIG}${MULTI_DIM_ARRAY_DELIMITER}${JKEY_CONFIG_ATTR_DEFAULT_MODE}"
  test_core_data["${def_mode}"]="mode_one"

  # create some simple mocks
  countModesAndViews() {
    true
  }
  updateNMStates() {
    true
  }
  export -f countModesAndViews
  export -f updateNMStates


  lolcat() {
    true
  }
  export -f lolcat

  test_core_data["${JKEY_CORE_OBJECT_CONFIG}${MULTI_DIM_ARRAY_DELIMITER}${JKEY_CONFIG_ATTR_HAS_COLOR}"]="yes"
  run initNMStates test_core_data test_nm_states
  assert_success
  initNMStates test_core_data test_nm_states
  assert_equal "$?" 0
  assert_equal "${test_nm_states[${MDKEY_STATE_VIEW_HAS_COLOR}]}" "yes"
  assert_equal "${test_nm_states[${MDKEY_STATE_SYS_SUPPORT_COLOR}]}" "yes"

  unset -f lolcat
  run initNMStates test_core_data test_nm_states
  assert_success
  initNMStates test_core_data test_nm_states
  assert_equal "$?" 0
  assert_equal "${test_nm_states[${MDKEY_STATE_VIEW_HAS_COLOR}]}" ""
  assert_equal "${test_nm_states[${MDKEY_STATE_SYS_SUPPORT_COLOR}]}" ""
}

@test "navi_men::initNMStates box_options" {
  local -r pre_view="${JKEY_CORE_OBJECT_VIEWS}${MULTI_DIM_ARRAY_DELIMITER}"
  local -r pre_mode="${JKEY_CORE_OBJECT_MODES}${MULTI_DIM_ARRAY_DELIMITER}"

  local -A test_nm_states=()
  local -A test_core_data=()
  test_core_data["${pre_mode}mode_one${MULTI_DIM_ARRAY_DELIMITER}${JKEY_MODE_ATTR_CMD}"]="cmd_one"
  test_core_data["${pre_mode}mode_two${MULTI_DIM_ARRAY_DELIMITER}${JKEY_MODE_ATTR_CMD}"]="cmd_two"
  test_core_data["${pre_mode}mode_three${MULTI_DIM_ARRAY_DELIMITER}${JKEY_MODE_ATTR_CMD}"]="cmd_three"
  test_core_data["${pre_view}view_one${MULTI_DIM_ARRAY_DELIMITER}wtf"]="wtf_one"
  test_core_data["${pre_view}view_one${MULTI_DIM_ARRAY_DELIMITER}wtf2"]="wtf_two"
  test_core_data["${pre_view}view_one${MULTI_DIM_ARRAY_DELIMITER}wtf3"]="wtf_three"
  test_core_data["${pre_view}view_two${MULTI_DIM_ARRAY_DELIMITER}wtf"]="wtf_one"
  test_core_data["${pre_view}view_two${MULTI_DIM_ARRAY_DELIMITER}wtf2"]="wtf_two"
  test_core_data["${pre_view}view_two${MULTI_DIM_ARRAY_DELIMITER}wtf3"]="wtf_three"

  local -r list_cmd="${JKEY_CORE_OBJECT_CONFIG}${MULTI_DIM_ARRAY_DELIMITER}${JKEY_CONFIG_ATTR_CMD_GET_LIST}"
  test_core_data["${list_cmd}"]="list_cmd"
  local -r def_view="${JKEY_CORE_OBJECT_CONFIG}${MULTI_DIM_ARRAY_DELIMITER}${JKEY_CONFIG_ATTR_DEFAULT_VIEW}"
  test_core_data["${def_view}"]="view_one"
  local -r def_mode="${JKEY_CORE_OBJECT_CONFIG}${MULTI_DIM_ARRAY_DELIMITER}${JKEY_CONFIG_ATTR_DEFAULT_MODE}"
  test_core_data["${def_mode}"]="mode_one"

  # create some simple mocks
  countModesAndViews() {
    true
  }
  updateNMStates() {
    true
  }
  export -f countModesAndViews
  export -f updateNMStates


  boxes() {
    true
  }
  export -f boxes

  test_core_data["${JKEY_CORE_OBJECT_CONFIG}${MULTI_DIM_ARRAY_DELIMITER}${JKEY_CONFIG_ATTR_DRAW_BOXES}"]="yes"
  run initNMStates test_core_data test_nm_states
  assert_success
  initNMStates test_core_data test_nm_states
  assert_equal "$?" 0
  assert_equal "${test_nm_states[${MDKEY_STATE_VIEW_DRAW_BOXES}]}" "yes"
  assert_equal "${test_nm_states[${MDKEY_STATE_SYS_SUPPORT_BOXES}]}" "yes"


  unset -f boxes

  run initNMStates test_core_data test_nm_states
  assert_success
  initNMStates test_core_data test_nm_states
  assert_equal "$?" 0

  # note: `unset -f boxes` somehow doesn't work ... need to find other way to test
  #assert_equal "${test_nm_states[${MDKEY_STATE_VIEW_DRAW_BOXES}]}" ""
  #assert_equal "${test_nm_states[${MDKEY_STATE_SYS_SUPPORT_BOXES}]}" ""

  run initNMStates test_core_data test_nm_states
  assert_success
}
#  local -A test_core_data=()
#  local -A test_result=()
#
#  # create some simple mocks
#  updateModeStates() {
#    declare -n umode_return_menu="$2"
#    umode_return_menu["mode"]="updateModeStates"
#  }
#  updateMetaStates() {
#    declare -n umeta_return_menu="$2"
#    umeta_return_menu["meta"]="updateMetaStates"
#  }
#  export -f updateModeStates
#  export -f updateMetaStates
#
#  run initNMStates test_core_data test_result
#  assert_success
#  initNMStates test_core_data test_result
#  assert_equal "${test_result[mode]}" "updateModeStates"
#  assert_equal "${test_result[meta]}" "updateMetaStates"
#}

