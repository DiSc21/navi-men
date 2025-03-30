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
## @brief: BATS based test environment for navi_men::createMenuOptions
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
  load '../../src/navi_men_menu.bash'
  load '../../src/navi_men_states.conf'
}


#########################################################
# STANDARD ERRORS
#########################################################

@test "navi_men::createMenuOptions fail_no_args" {
  run createMenuOptions
  assert_failure
  assert_equal "$status" "${ERR_WRONG_NUM_OF_INPUTS}"
  assert_output --partial "'createMenuOptions' requires"
  assert_output --partial "got '0'!"
}
@test "navi_men::createMenuOptions fail_only_single_arg" {
  run createMenuOptions "petty"
  assert_failure
  assert_equal "$status" "${ERR_WRONG_NUM_OF_INPUTS}"
  assert_output --partial "'createMenuOptions' requires"
  assert_output --partial "got '1'!"
}
@test "navi_men::createMenuOptions fail_too_many_args" {
  run createMenuOptions "petty" "petty" "petty"
  assert_failure
  assert_equal "$status" "${ERR_WRONG_NUM_OF_INPUTS}"
  assert_output --partial "'createMenuOptions' requires"
  assert_output --partial "got '3'!"
}


# #########################################################
# # FUNCTIONALITY
# #########################################################

@test "navi_men::createMenuOptions test_only_default_opts" {
  local -A test_menu=()
  local -A test_states=()
  createDefaultStates test_states

  createMenuOptions test_states test_menu
  assert_equal "$?" 0

  assert_equal $( hasKey test_menu MK_OPT_MODE_NEXT ) "false"
  assert_equal $( hasKey test_menu MK_OPT_MODE_PREV ) "false"
  assert_equal $( hasKey test_menu MK_OPT_APPLY_ALL ) "false"
  assert_equal $( hasKey test_menu MK_OPT_VIEW_NEXT ) "false"
  assert_equal $( hasKey test_menu MK_OPT_VIEW_PREV ) "false"
  assert_equal $( hasKey test_menu MK_OPT_APPLY_ALL ) "false"
  assert_equal $( hasKey test_menu MK_OPT_COLORIZE ) "false"
  assert_equal $( hasKey test_menu MK_OPT_DRAW_BOXES ) "false"

  assert_equal $( hasKey test_menu MK_OPT_QUIT ) "true"
  assert_equal $( hasKey test_menu MK_OPT_SHOW_OPTS ) "true"
}

@test "navi_men::createMenuOptions test_mode_opts" {
  local -A test_menu=()
  local -A test_states=()
  run createDefaultStates test_states
  createDefaultStates test_states

  test_states["${MDKEY_STATE_MODE_NUMBER}"]="2"
  test_states["${MDKEY_STATE_MODE_ENABLE_ALL}"]="true"
  run createMenuOptions test_states test_menu
  createMenuOptions test_states test_menu
  assert_equal "$?" 0

  assert_equal $( hasKey test_menu MK_OPT_MODE_NEXT ) "true"
  assert_equal $( hasKey test_menu MK_OPT_MODE_PREV ) "true"
  assert_equal $( hasKey test_menu MK_OPT_APPLY_ALL ) "true"

  assert_equal $( hasKey test_menu MK_OPT_QUIT ) "true"
  assert_equal $( hasKey test_menu MK_OPT_SHOW_OPTS ) "true"
}

@test "navi_men::createMenuOptions test_view_opts" {
  declare -A test_menu=()
  local -A test_states=()
  run createDefaultStates test_states
  createDefaultStates test_states

  test_states["${MDKEY_STATE_VIEW_NUMBER}"]="2"
  run createMenuOptions test_states test_menu
  createMenuOptions test_states test_menu
  assert_equal "$?" 0

  assert_equal $( hasKey test_menu MK_OPT_VIEW_NEXT ) "true"
  assert_equal $( hasKey test_menu MK_OPT_VIEW_PREV ) "true"

  assert_equal $( hasKey test_menu MK_OPT_QUIT ) "true"
  assert_equal $( hasKey test_menu MK_OPT_SHOW_OPTS ) "true"
}

@test "navi_men::createMenuOptions test_sys_opts" {
  local -A test_menu=()
  local -A test_states=()
  run createDefaultStates test_states
  createDefaultStates test_states

  test_states["${MDKEY_STATE_SYS_SUPPORT_COLOR}"]="true"
  test_states["${MDKEY_STATE_SYS_SUPPORT_BOXES}"]="true"
  run createMenuOptions test_states test_menu
  createMenuOptions test_states test_menu
  assert_equal "$?" 0

  assert_equal $( hasKey test_menu MK_OPT_COLORIZE ) "true"
  assert_equal $( hasKey test_menu MK_OPT_DRAW_BOXES ) "true"

  assert_equal $( hasKey test_menu MK_OPT_QUIT ) "true"
  assert_equal $( hasKey test_menu MK_OPT_SHOW_OPTS ) "true"
}



