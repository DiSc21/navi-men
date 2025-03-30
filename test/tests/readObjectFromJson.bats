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
## @brief: BATS based test environment for navi_men::readObjectFromJson
##
## @usage: 'bats -p <this_bats_file>'
##
## @dependencies:
## - bats (-support/assert)
## - bash 4.3
## - jq
##


setup() {
  declare -r TEST_PID="$BASHPID"
  declare -gr TMP_TEST_CONFIG="/tmp/bats_navi_men_test_${TEST_PID}_config.json"

  load '/usr/lib/bats/bats-support/load'
  load '/usr/lib/bats/bats-assert/load'

  load '../../src/navi_men_aux_jq.bash'

  echo "{" > "${TMP_TEST_CONFIG}"
  echo "  \"main_node_empty\": {}," >> "${TMP_TEST_CONFIG}"
  echo "  \"main_node_metadata\": {" >> "${TMP_TEST_CONFIG}"
  echo "      \"metadata\": {}" >> "${TMP_TEST_CONFIG}"
  echo "  }," >> "${TMP_TEST_CONFIG}"
  echo "  \"main_node_null\": {" >> "${TMP_TEST_CONFIG}"
  echo "      \"sub_null\": null" >> "${TMP_TEST_CONFIG}"
  echo "  }," >> "${TMP_TEST_CONFIG}"
  echo "  \"main_node_array\": {" >> "${TMP_TEST_CONFIG}"
  echo "      \"sub_array\": [1, 2, 3, 4]" >> "${TMP_TEST_CONFIG}"
  echo "  }," >> "${TMP_TEST_CONFIG}"
  echo "  \"main_node_obj\": {" >> "${TMP_TEST_CONFIG}"
  echo "    \"sub_object\": {" >> "${TMP_TEST_CONFIG}"
  echo "      \"sub_sub_bool\": true," >> "${TMP_TEST_CONFIG}"
  echo "      \"sub_sub_number\": 2," >> "${TMP_TEST_CONFIG}"
  echo "      \"sub_sub_string\": \"three\"," >> "${TMP_TEST_CONFIG}"
  echo "      \"metadata\": {}" >> "${TMP_TEST_CONFIG}"
  echo "    }" >> "${TMP_TEST_CONFIG}"
  echo "  }" >> "${TMP_TEST_CONFIG}"
  echo "}" >> "${TMP_TEST_CONFIG}"

  chmod 777 "${TMP_TEST_CONFIG}"
}

teardown() {
  rm -f "${TMP_TEST_CONFIG}"
}

#########################################################
# STANDARD ERRORS
#########################################################

@test "navi_men::readObjectFromJson fail_no_args" {
  run readObjectFromJson
  assert_failure
  assert_equal "$status" "${ERR_WRONG_NUM_OF_INPUTS}"
  assert_output --partial "'readObjectFromJson' requires"
  assert_output --partial "got '0'!"
}
@test "navi_men::readObjectFromJson fail_only_single_arg" {
  run readObjectFromJson "${TMP_TEST_CONFIG}"
  assert_failure
  assert_equal "$status" "${ERR_WRONG_NUM_OF_INPUTS}"
  assert_output --partial "'readObjectFromJson' requires"
  assert_output --partial "got '1'!"
}
@test "navi_men::readObjectFromJson fail_only_two_args" {
  run readObjectFromJson "${TMP_TEST_CONFIG}" "petty"
  assert_failure
  assert_equal "$status" "${ERR_WRONG_NUM_OF_INPUTS}"
  assert_output --partial "'readObjectFromJson' requires"
  assert_output --partial "got '2'!"
}
@test "navi_men::readObjectFromJson fail_too_many_args" {
  run readObjectFromJson "${TMP_TEST_CONFIG}" "petty" "petty" "petty" "petty"
  assert_failure
  assert_equal "$status" "${ERR_WRONG_NUM_OF_INPUTS}"
  assert_output --partial "'readObjectFromJson' requires"
  assert_output --partial "got '5'!"
}
@test "navi_men::readObjectFromJson fail_on_node_not_found" {
  local -A obj=()
  run readObjectFromJson "${TMP_TEST_CONFIG}" "not_a_node" obj
  assert_failure
  assert_equal "$status" "${ERR_JSON_NODE_NOT_FOUND}"
}

#########################################################
# FUNCTIONALITY: ERRORS FOR NON SCALARS
#########################################################

@test "navi_men::readObjectFromJson fail_on_object_node" {
  local -A obj=()
  run readObjectFromJson "${TMP_TEST_CONFIG}" "main_node_obj" obj
  assert_failure
  assert_equal "$status" "${ERR_JSON_NODE_WRONG_TYPE}"
}
@test "navi_men::readObjectFromJson fail_on_null_node" {
  local -A obj=()
  run readObjectFromJson "${TMP_TEST_CONFIG}" "main_node_obj" obj
  assert_failure
  assert_equal "$status" "${ERR_JSON_NODE_WRONG_TYPE}"
}
@test "navi_men::readObjectFromJson fail_on_array_node" {
  local -A obj=()
  run readObjectFromJson "${TMP_TEST_CONFIG}" "main_node_array" obj
  assert_failure
  assert_equal "$status" "${ERR_JSON_NODE_WRONG_TYPE}"
}

##########################################################
## FUNCTIONALITY
##########################################################
@test "navi_men::readObjectFromJson read_sub_node" {
  local -A obj=()
  readObjectFromJson "${TMP_TEST_CONFIG}" "main_node_obj.sub_object" obj
  assert_equal "$?" 0
  assert_equal "${obj[sub_sub_bool]}" "true"
  assert_equal "${obj[sub_sub_number]}" "2"
  assert_equal "${obj[sub_sub_string]}" "three"

  # note: this also ensures metadata was ignored
  assert_equal "${#obj[@]}" 3
}
@test "navi_men::readObjectFromJson read_empty_node" {
  local -A obj=()
  readObjectFromJson "${TMP_TEST_CONFIG}" "main_node_empty" obj
  assert_equal "$?" 0
  assert_equal "${#obj[@]}" 0
}
@test "navi_men::readObjectFromJson read_metadata_only_node" {
  local -A obj=()
  readObjectFromJson "${TMP_TEST_CONFIG}" "main_node_metadata" obj
  assert_equal "$?" 0
  assert_equal "${#obj[@]}" 0
}


