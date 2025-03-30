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
## @brief: BATS based test environment for navi_men::setObjectDefaultValues
##
## @usage: 'bats -p <this_bats_file>'
##
## @dependencies:
## - bats (-support/assert)
## - bash 4.3
## - jq
##


setup() {
  declare -Ag TEST_OBJECT=()
  TEST_OBJECT["bool"]="false"
  TEST_OBJECT["number"]="0"
  TEST_OBJECT["string"]="zero"
  readonly TEST_OBJECT

  load '/usr/lib/bats/bats-support/load'
  load '/usr/lib/bats/bats-assert/load'

  load '../../src/navi_men_core_data.bash'
}


#########################################################
# STANDARD ERRORS
#########################################################

@test "navi_men::setObjectDefaultValues fail_no_args" {
  run setObjectDefaultValues
  assert_failure
  assert_equal "$status" "${ERR_WRONG_NUM_OF_INPUTS}"
  assert_output --partial "'setObjectDefaultValues' requires"
  assert_output --partial "got '0'!"
}
@test "navi_men::setObjectDefaultValues fail_only_single_arg" {
  run setObjectDefaultValues "petty"
  assert_failure
  assert_equal "$status" "${ERR_WRONG_NUM_OF_INPUTS}"
  assert_output --partial "'setObjectDefaultValues' requires"
  assert_output --partial "got '1'!"
}
@test "navi_men::setObjectDefaultValues fail_too_many_args" {
  run setObjectDefaultValues "petty" "petty" "petty"
  assert_failure
  assert_equal "$status" "${ERR_WRONG_NUM_OF_INPUTS}"
  assert_output --partial "'setObjectDefaultValues' requires"
  assert_output --partial "got '3'!"
}


##########################################################
## FUNCTIONALITY
##########################################################
@test "navi_men::setObjectDefaultValues set_defaults_for_empty_object" {
  local -A obj=()
  setObjectDefaultValues TEST_OBJECT obj
  assert_equal "$?" 0
  assert_equal "${#obj[@]}" 3
  assert_equal "${obj[bool]}" "false"
  assert_equal "${obj[number]}" "0"
  assert_equal "${obj[string]}" "zero"
}
@test "navi_men::setObjectDefaultValues do_not_override" {
  local -A obj=()
  obj["bool"]="true"
  obj["number"]="1"
  obj["string"]="one"

  setObjectDefaultValues TEST_OBJECT obj
  assert_equal "$?" 0
  assert_equal "${#obj[@]}" 3
  assert_equal "${obj[bool]}" "true"
  assert_equal "${obj[number]}" "1"
  assert_equal "${obj[string]}" "one"
}
@test "navi_men::setObjectDefaultValues mixed_martial_members" {
  local -A obj=()
  obj["bool"]="true"
  obj["string"]="one"

  setObjectDefaultValues TEST_OBJECT obj
  assert_equal "$?" 0
  assert_equal "${#obj[@]}" 3
  assert_equal "${obj[bool]}" "true"
  assert_equal "${obj[number]}" "0"
  assert_equal "${obj[string]}" "one"
}
@test "navi_men::setObjectDefaultValues ignore_extra_data_but_add_missing" {
  local -A obj=()
  obj["gina"]="wild"
  obj["ivana"]="fukalot"
  obj["string"]="one"
  assert_equal "${#obj[@]}" 3

  setObjectDefaultValues TEST_OBJECT obj
  assert_equal "$?" 0
  assert_equal "${#obj[@]}" 5
  assert_equal "${obj[bool]}" "false"
  assert_equal "${obj[number]}" "0"
  assert_equal "${obj[string]}" "one"
}

