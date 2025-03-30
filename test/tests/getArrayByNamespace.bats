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
## @brief: BATS based test environment for navi_men::getArrayByNamespace
##
## @usage: 'bats -p <this_bats_file>'
##
## @dependencies:
## - bats (-support/assert)
## - bash 4.3
##

setup() {
  load '/usr/lib/bats/bats-support/load'
  load '/usr/lib/bats/bats-assert/load'

  load '../../src/navi_men.conf'
  load '../../src/navi_men_aux_array.bash'

  declare -gA TEST_OBJECT_DEF=()
  TEST_OBJECT_DEF["bool"]="false"
  TEST_OBJECT_DEF["number"]="0"
  TEST_OBJECT_DEF["string"]="zero"
  readonly TEST_OBJECT_DEF
}


#########################################################
# STANDARD ERRORS
#########################################################

@test "navi_men::getArrayByNamespace fail_no_args" {
  run getArrayByNamespace
  assert_failure
  assert_equal "$status" "${ERR_WRONG_NUM_OF_INPUTS}"
  assert_output --partial "'getArrayByNamespace' requires"
  assert_output --partial "got '0'!"
}
@test "navi_men::getArrayByNamespace fail_only_single_arg" {
  run getArrayByNamespace "petty"
  assert_failure
  assert_equal "$status" "${ERR_WRONG_NUM_OF_INPUTS}"
  assert_output --partial "'getArrayByNamespace' requires"
  assert_output --partial "got '1'!"
}
@test "navi_men::getArrayByNamespace fail_only_two_args" {
  run getArrayByNamespace "petty" "petty"
  assert_failure
  assert_equal "$status" "${ERR_WRONG_NUM_OF_INPUTS}"
  assert_output --partial "'getArrayByNamespace' requires"
  assert_output --partial "got '2'!"
}
@test "navi_men::getArrayByNamespace fail_too_many_args" {
  run getArrayByNamespace "petty" "petty" "petty" "petty" "petty" "petty"
  assert_failure
  assert_equal "$status" "${ERR_WRONG_NUM_OF_INPUTS}"
  assert_output --partial "'getArrayByNamespace' requires"
  assert_output --partial "got '6'!"
}


#########################################################
# FUNCTIONALITY: ERRORS FOR NON SCALARS
#########################################################

@test "navi_men::getArrayByNamespace fail_empty_array_ns_not_found" {
  local -A obj=()
  run getArrayByNamespace "ns1" \
                  TEST_OBJECT_DEF \
                  obj
  assert_failure
  assert_equal "$status" "${ERR_MULTI_DIM_NAMESPACE_NOT_FOUND}"
}
@test "navi_men::getArrayByNamespace fail_ns_not_found" {
  local -A ns_obj=()
  addNamespacedArray "ns1" \
                  TEST_OBJECT_DEF \
                  ns_obj
  assert_equal "$?" 0
  assert_equal "${#ns_obj[@]}" 3
  assert_equal "${ns_obj[ns1::bool]}" "false"

  local -A obj=()
  run getArrayByNamespace "nons" \
                  TEST_OBJECT_DEF \
                  obj
  assert_failure
  assert_equal "$status" "${ERR_MULTI_DIM_NAMESPACE_NOT_FOUND}"
}

#########################################################
# FUNCTIONALITY
#########################################################

@test "navi_men::getArrayByNamespace get_single_array" {
  local -A ns_obj=()
  addNamespacedArray "ns1" \
                  TEST_OBJECT_DEF \
                  ns_obj
  assert_equal "$?" 0
  assert_equal "${#ns_obj[@]}" 3
  assert_equal "${ns_obj[ns1::bool]}" "false"

  local -A obj=()
  getArrayByNamespace "ns1" \
                  ns_obj \
                  obj
  assert_equal "$?" 0
  assert_equal "${#obj[@]}" 3
  assert_equal "${obj[bool]}" "false"
  echo "${obj[*]}"
}
@test "navi_men::getArrayByNamespace add_multiple_arrays" {
  local -A ns_obj=()
  addNamespacedArray "ns1" \
                     TEST_OBJECT_DEF \
                     ns_obj
  assert_equal "$?" 0
  assert_equal "${#ns_obj[@]}" 3
  assert_equal "${ns_obj[ns1::bool]}" "false"

  addNamespacedArray "ns2" \
                     TEST_OBJECT_DEF \
                     ns_obj
  assert_equal "$?" 0
  assert_equal "${#ns_obj[@]}" 6

  local -A obj=()
  getArrayByNamespace "ns2" \
                      ns_obj \
                      obj
  assert_equal "$?" 0
  assert_equal "${#obj[@]}" 3
  assert_equal "${obj[bool]}" "false"
}

