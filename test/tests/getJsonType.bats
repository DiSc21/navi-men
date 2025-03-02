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
## @brief: BATS based test environment for navi_men::getJsonType
##
## @usage: 'bats -p <this_bats_file>'
##
## @dependencies:
## - bats (-support/assert)
## - bash 4.3
## - jq
##

setup() {
  declare -gr TMP_TEST_CONFIG="/tmp/bats_navi_men_test_config.json"

  load '/usr/lib/bats/bats-support/load'
  load '/usr/lib/bats/bats-assert/load'

  load '../../src/navi_men.sh'

  echo "{" > "${TMP_TEST_CONFIG}"
  echo "  \"main_node_one\": {" >> "${TMP_TEST_CONFIG}"
  echo "    \"sub_object\": {" >> "${TMP_TEST_CONFIG}"
  echo "      \"sub_sub_null\": null," >> "${TMP_TEST_CONFIG}"
  echo "      \"sub_sub_string\": \"klaus\"," >> "${TMP_TEST_CONFIG}"
  echo "      \"sub_sub_number\": 1," >> "${TMP_TEST_CONFIG}"
  echo "      \"sub_sub_bool\": true," >> "${TMP_TEST_CONFIG}"
  echo "      \"sub_sub_array\": [1, 2, 3, 4]" >> "${TMP_TEST_CONFIG}"
  echo "    }" >> "${TMP_TEST_CONFIG}"
  echo "  }" >> "${TMP_TEST_CONFIG}"
  echo "}" >> "${TMP_TEST_CONFIG}"

  chmod 777 "${TMP_TEST_CONFIG}"
}

teardown() {
  rm -rf "${TMP_TEST_CONFIG}"
}


#########################################################
# STANDARD ERRORS
#########################################################

@test "navi_men::getJsonType fail_no_args" {
  run getJsonType
  assert_failure
  assert_equal "$status" "${ERR_WRONG_NUM_OF_INPUTS}"
  assert_output --partial "'getJsonType' requires"
  assert_output --partial "got '0'!"
}
@test "navi_men::getJsonType fail_only_single_arg" {
  run getJsonType "${TMP_TEST_CONFIG}"
  assert_failure
  assert_equal "$status" "${ERR_WRONG_NUM_OF_INPUTS}"
  assert_output --partial "'getJsonType' requires"
  assert_output --partial "got '1'!"
}
@test "navi_men::getJsonType fail_too_many_args" {
  run getJsonType "${TMP_TEST_CONFIG}" "petty" "petty" "petty"
  assert_failure
  assert_equal "$status" "${ERR_WRONG_NUM_OF_INPUTS}"
  assert_output --partial "'getJsonType' requires"
  assert_output --partial "got '4'!"
}
@test "navi_men::getJsonType fail_config_json_not_found" {
  tmp="who_cares"
  run getJsonType /tmp/does_not_exist.json "node_name" tmp
  assert_failure
  assert_equal "$status" "${ERR_FILE_NOT_FOUND}"
  assert_output --partial "does not exist!"
}
@test "navi_men::getJsonType fail_json_node_not_found" {
  tmp="klaus"
  run getJsonType "${TMP_TEST_CONFIG}" "not_a_node_name" tmp
  assert_failure
  assert_equal "$status" "${ERR_JSON_NODE_NOT_FOUND}"
  assert_output --partial "does not contain a node"
  assert_output --partial "'not_a_node_name'"
}


#########################################################
# FUNCTIONALITY
#########################################################

@test "navi_men::getJsonType json_main_node_type_object" {
  tmp="klaus"
  getJsonType "${TMP_TEST_CONFIG}" "main_node_one" tmp
  assert_equal "${tmp}" "object"
}
@test "navi_men::getJsonType json_sub_node_type_object" {
  tmp="klaus"
  getJsonType "${TMP_TEST_CONFIG}" "main_node_one.sub_object" tmp
  assert_equal "${tmp}" "object"
}
@test "navi_men::getJsonType json_sub_sub_node_type_null" {
  tmp="klaus"
  getJsonType "${TMP_TEST_CONFIG}" "main_node_one.sub_object.sub_sub_null" tmp
  assert_equal "${tmp}" "null"
}
@test "navi_men::getJsonType json_sub_sub_node_type_string" {
  tmp="klaus"
  getJsonType "${TMP_TEST_CONFIG}" "main_node_one.sub_object.sub_sub_string" tmp
  assert_equal "${tmp}" "string"
}
@test "navi_men::getJsonType json_sub_sub_node_type_number" {
  tmp="klaus"
  getJsonType "${TMP_TEST_CONFIG}" "main_node_one.sub_object.sub_sub_number" tmp
  assert_equal "${tmp}" "number"
}
@test "navi_men::getJsonType json_sub_sub_node_type_bool" {
  tmp="klaus"
  getJsonType "${TMP_TEST_CONFIG}" "main_node_one.sub_object.sub_sub_bool" tmp
  assert_equal "${tmp}" "boolean"
}
@test "navi_men::getJsonType json_sub_sub_node_type_array" {
  tmp="klaus"
  getJsonType "${TMP_TEST_CONFIG}" "main_node_one.sub_object.sub_sub_array" tmp
  assert_equal "${tmp}" "array"
}



