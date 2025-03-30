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
## @brief: BATS based test environment for navi_men::updateCurrentState
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

@test "navi_men::updateCurrentState fail_no_args" {
  run updateCurrentState
  assert_failure
  assert_equal "$status" "${ERR_WRONG_NUM_OF_INPUTS}"
  assert_output --partial "'updateCurrentState' requires"
  assert_output --partial "got '0'!"
}
@test "navi_men::updateCurrentState fail_only_single_arg" {
  run updateCurrentState "petty"
  assert_failure
  assert_equal "$status" "${ERR_WRONG_NUM_OF_INPUTS}"
  assert_output --partial "'updateCurrentState' requires"
  assert_output --partial "got '1'!"
}
@test "navi_men::updateCurrentState fail_only_two_args" {
  run updateCurrentState "petty" "petty"
  assert_failure
  assert_equal "$status" "${ERR_WRONG_NUM_OF_INPUTS}"
  assert_output --partial "'updateCurrentState' requires"
  assert_output --partial "got '2'!"
}
@test "navi_men::updateCurrentState fail_only_three_args" {
  run updateCurrentState "petty" "petty" "petty"
  assert_failure
  assert_equal "$status" "${ERR_WRONG_NUM_OF_INPUTS}"
  assert_output --partial "'updateCurrentState' requires"
  assert_output --partial "got '3'!"
}
@test "navi_men::updateCurrentState fail_too_many_args" {
  run updateCurrentState "petty" "petty" "petty" "petty" "petty"
  assert_failure
  assert_equal "$status" "${ERR_WRONG_NUM_OF_INPUTS}"
  assert_output --partial "'updateCurrentState' requires"
  assert_output --partial "got '5'!"
}

# #########################################################
# # FUNCTIONAL ERRORS
# #########################################################

# note: passing an empty list as first arg to updateCurrentState will cause first arg to be ignored
@test "navi_men::updateCurrentState fail_empty_list" {
  local -a valid_list=()
  local test_state="klaus"
  run updateCurrentState "${valid_list[@]}" "true" "whatever" test_state

  assert_failure
  assert_equal "$status" "${ERR_WRONG_NUM_OF_INPUTS}"
  assert_output --partial "'updateCurrentState' requires"
  assert_output --partial "got '3'!"
}

@test "navi_men::updateCurrentState fail_unknown_state" {
  local valid_list="kein kl aus"
  local -A test_states=()
  run updateCurrentState "${valid_list}" "true" "whatever" test_states

  assert_failure
  assert_equal "$status" "${ERR_MENU_UNKNOWN_STATE}"
}
@test "navi_men::updateCurrentState fail_current_state_not_in_list" {
  local valid_list="kein kl aus"
  local -A test_states=()
  test_states["${MDKEY_STATE_MODE_CURRENT}"]="klaus"
  run updateCurrentState "${valid_list}" "true" "${MDKEY_STATE_MODE_CURRENT}" test_states

  assert_failure
  assert_equal "$status" "${ERR_MENU_INVALID_CURRENT_STATE}"
}

# #########################################################
# # FUNCTIONALITY
# #########################################################

@test "navi_men::updateCurrentState single_element_list" {
  local valid_list="klaus"
  local -A test_states=()
  test_states["${MDKEY_STATE_MODE_CURRENT}"]="klaus"

  run updateCurrentState "${valid_list}" "true" "${MDKEY_STATE_MODE_CURRENT}" test_states
  assert_success
  updateCurrentState "${valid_list}" "true" "${MDKEY_STATE_MODE_CURRENT}" test_states
  assert_equal "${test_states["${MDKEY_STATE_MODE_CURRENT}"]}" "klaus"

  run updateCurrentState "${valid_list}" "false" "${MDKEY_STATE_MODE_CURRENT}" test_states
  assert_success
  updateCurrentState "${valid_list}" "false" "${MDKEY_STATE_MODE_CURRENT}" test_states
  assert_equal "$?" 0
  assert_equal "${test_states["${MDKEY_STATE_MODE_CURRENT}"]}" "klaus"
}
@test "navi_men::updateCurrentState select_next_state" {
  local valid_list="gina ivana natasha"
  local -A test_states=()
  test_states["${MDKEY_STATE_MODE_CURRENT}"]="gina"

  run updateCurrentState "${valid_list}" "true" "${MDKEY_STATE_MODE_CURRENT}" test_states
  assert_success

  updateCurrentState "${valid_list}" "true" "${MDKEY_STATE_MODE_CURRENT}" test_states
  assert_equal "$?" 0
  assert_equal "${test_states["${MDKEY_STATE_MODE_CURRENT}"]}" "ivana"
  updateCurrentState "${valid_list}" "true" "${MDKEY_STATE_MODE_CURRENT}" test_states
  assert_equal "$?" 0
  assert_equal "${test_states["${MDKEY_STATE_MODE_CURRENT}"]}" "natasha"
  updateCurrentState "${valid_list}" "true" "${MDKEY_STATE_MODE_CURRENT}" test_states
  assert_equal "$?" 0
  assert_equal "${test_states["${MDKEY_STATE_MODE_CURRENT}"]}" "gina"
}
@test "navi_men::updateCurrentState select_previous_state" {
  local valid_list="gina ivana natasha"
  local -A test_states=()
  test_states["${MDKEY_STATE_MODE_CURRENT}"]="gina"

  run updateCurrentState "${valid_list}" "false" "${MDKEY_STATE_MODE_CURRENT}" test_states
  assert_success

  updateCurrentState "${valid_list}" "false" "${MDKEY_STATE_MODE_CURRENT}" test_states
  assert_equal "$?" 0
  assert_equal "${test_states["${MDKEY_STATE_MODE_CURRENT}"]}" "natasha"
  updateCurrentState "${valid_list}" "false" "${MDKEY_STATE_MODE_CURRENT}" test_states
  assert_equal "$?" 0
  assert_equal "${test_states["${MDKEY_STATE_MODE_CURRENT}"]}" "ivana"
  updateCurrentState "${valid_list}" "false" "${MDKEY_STATE_MODE_CURRENT}" test_states
  assert_equal "$?" 0
  assert_equal "${test_states["${MDKEY_STATE_MODE_CURRENT}"]}" "gina"
}
