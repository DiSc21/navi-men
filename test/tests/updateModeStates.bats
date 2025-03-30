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
## @brief: BATS based test environment for navi_men::updateModeStates
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

  load '../../src/navi_men_state_setter.bash'
}


#########################################################
# STANDARD ERRORS
#########################################################

@test "navi_men::updateModeStates fail_no_args" {
  run updateModeStates
  assert_failure
  assert_equal "$status" "${ERR_WRONG_NUM_OF_INPUTS}"
  assert_output --partial "'updateModeStates' requires"
  assert_output --partial "got '0'!"
}
@test "navi_men::updateModeStates fail_only_single_arg" {
  run updateModeStates "petty"
  assert_failure
  assert_equal "$status" "${ERR_WRONG_NUM_OF_INPUTS}"
  assert_output --partial "'updateModeStates' requires"
  assert_output --partial "got '1'!"
}
@test "navi_men::updateModeStates fail_too_many_args" {
  run updateModeStates "petty" "petty" "petty"
  assert_failure
  assert_equal "$status" "${ERR_WRONG_NUM_OF_INPUTS}"
  assert_output --partial "'updateModeStates' requires"
  assert_output --partial "got '3'!"
}
@test "navi_men::updateModeStates fail_no_mode_command" {
  local -r pre_mode="${JKEY_CORE_OBJECT_MODES}${MULTI_DIM_ARRAY_DELIMITER}"
  local -r mode_one="${pre_mode}one"

  local -A test_core_data=()
  test_core_data["${mode_one}${MULTI_DIM_ARRAY_DELIMITER}${JKEY_MODE_ATTR_ENABLE_ALL}"]=""
  local -A test_mode_states=()
  test_mode_states["${MDKEY_STATE_MODE_CURRENT}"]="one"

  run updateModeStates test_core_data test_mode_states
  assert_failure
  assert_equal "$status" "${ERR_MULTI_DIM_NAMESPACE_ELEMENT_NOT_FOUND}"
}

# #########################################################
# # FUNCTIONALITY
# #########################################################

@test "navi_men::updateModeStates mode_command" {
  local -r pre_mode="${JKEY_CORE_OBJECT_MODES}${MULTI_DIM_ARRAY_DELIMITER}"
  local -r mode_one="${pre_mode}one"

  local -A test_core_data=()
  test_core_data["${mode_one}${MULTI_DIM_ARRAY_DELIMITER}${JKEY_MODE_ATTR_CMD}"]="cmd"

  local -A test_mode_states=()
  test_mode_states["${MDKEY_STATE_MODE_CURRENT}"]="one"

  updateModeStates test_core_data test_mode_states
  assert_equal "$?" 0
  assert_equal "${test_mode_states[${MDKEY_STATE_MODE_CMD}]}" "cmd"
  assert_equal "${test_mode_states[${JKEY_MODE_ATTR_CONTINUE}]}" ""
  assert_equal "${test_mode_states[${MDKEY_STATE_MODE_ENABLE_ALL}]}" ""
  assert_equal "${test_mode_states[${MDKEY_STATE_MODE_REFRESH}]}" ""
  assert_equal "${test_mode_states[${MDKEY_STATE_MODE_LIST_FILTER}]}" ""

  run updateModeStates test_core_data test_mode_states
  assert_success
}
@test "navi_men::updateModeStates mode_continue" {
  local -r pre_mode="${JKEY_CORE_OBJECT_MODES}${MULTI_DIM_ARRAY_DELIMITER}"
  local -r mode_one="${pre_mode}one"

  local -A test_core_data=()
  test_core_data["${mode_one}${MULTI_DIM_ARRAY_DELIMITER}${JKEY_MODE_ATTR_CMD}"]="cmd"
  test_core_data["${mode_one}${MULTI_DIM_ARRAY_DELIMITER}${JKEY_MODE_ATTR_CONTINUE}"]="continue"

  local -A test_mode_states=()
  test_mode_states["${MDKEY_STATE_MODE_CURRENT}"]="one"

  updateModeStates test_core_data test_mode_states
  assert_equal "$?" 0
  assert_equal "${test_mode_states[${JKEY_MODE_ATTR_CONTINUE}]}" "continue"

  run updateModeStates test_core_data test_mode_states
  assert_success
}
@test "navi_men::updateModeStates mode_enable_all" {
  local -r pre_mode="${JKEY_CORE_OBJECT_MODES}${MULTI_DIM_ARRAY_DELIMITER}"
  local -r mode_one="${pre_mode}one"

  local -A test_core_data=()
  test_core_data["${mode_one}${MULTI_DIM_ARRAY_DELIMITER}${JKEY_MODE_ATTR_CMD}"]="cmd"
  test_core_data["${mode_one}${MULTI_DIM_ARRAY_DELIMITER}${JKEY_MODE_ATTR_ENABLE_ALL}"]="ea"

  local -A test_mode_states=()
  test_mode_states["${MDKEY_STATE_MODE_CURRENT}"]="one"

  updateModeStates test_core_data test_mode_states
  assert_equal "$?" 0
  assert_equal "${test_mode_states[${MDKEY_STATE_MODE_ENABLE_ALL}]}" "ea"

  run updateModeStates test_core_data test_mode_states
  assert_success
}
@test "navi_men::updateModeStates mode_refresh" {
  local -r pre_mode="${JKEY_CORE_OBJECT_MODES}${MULTI_DIM_ARRAY_DELIMITER}"
  local -r mode_one="${pre_mode}one"

  local -A test_core_data=()
  test_core_data["${mode_one}${MULTI_DIM_ARRAY_DELIMITER}${JKEY_MODE_ATTR_CMD}"]="cmd"
  test_core_data["${mode_one}${MULTI_DIM_ARRAY_DELIMITER}${JKEY_MODE_ATTR_REFRESH}"]="refresh"

  local -A test_mode_states=()
  test_mode_states["${MDKEY_STATE_MODE_CURRENT}"]="one"

  updateModeStates test_core_data test_mode_states
  assert_equal "$?" 0
  assert_equal "${test_mode_states[${MDKEY_STATE_MODE_REFRESH}]}" "refresh"

  run updateModeStates test_core_data test_mode_states
  assert_success
}
@test "navi_men::updateModeStates mode_list_filter" {
  local -r pre_mode="${JKEY_CORE_OBJECT_MODES}${MULTI_DIM_ARRAY_DELIMITER}"
  local -r mode_one="${pre_mode}one"

  local -A test_core_data=()
  test_core_data["${mode_one}${MULTI_DIM_ARRAY_DELIMITER}${JKEY_MODE_ATTR_CMD}"]="cmd"
  test_core_data["${mode_one}${MULTI_DIM_ARRAY_DELIMITER}${JKEY_MODE_ATTR_LIST_FILTER}"]="filter"

  local -A test_mode_states=()
  test_mode_states["${MDKEY_STATE_MODE_CURRENT}"]="one"

  updateModeStates test_core_data test_mode_states
  assert_equal "$?" 0
  assert_equal "${test_mode_states[${MDKEY_STATE_MODE_LIST_FILTER}]}" "filter"

  run updateModeStates test_core_data test_mode_states
  assert_success
}

