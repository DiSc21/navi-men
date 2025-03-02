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
## @brief: BATS based test environment for navi_men::getValueByKey
##
## @usage: 'bats -p <this_bats_file>'
##
## @dependencies:
## - bats (-support/assert)
## - bash 4.3
## - jq
##


setup() {
  export TMP_TEST_CONFIG="/tmp/bats_navi_men_test_01.json"

  load '/usr/lib/bats/bats-support/load'
  load '/usr/lib/bats/bats-assert/load'

  load '../../src/navi_men.sh'

  echo "{" > "${TMP_TEST_CONFIG}"
  echo "  \"main_node_one\": {" >> "${TMP_TEST_CONFIG}"
  echo "    \"sub_object\": {" >> "${TMP_TEST_CONFIG}"
  echo "      \"sub_sub_empty\": {}," >> "${TMP_TEST_CONFIG}"
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

@test "navi_men::getKeysByNode fail_no_args" {
  run getKeysByNode
  assert_failure
  assert_equal "$status" "${ERR_WRONG_NUM_OF_INPUTS}"
  assert_output --partial "'getKeysByNode' requires"
  assert_output --partial "got '0'!"
}
@test "navi_men::getKeysByNode fail_only_single_arg" {
  run getKeysByNode "${TMP_TEST_CONFIG}"
  assert_failure
  assert_equal "$status" "${ERR_WRONG_NUM_OF_INPUTS}"
  assert_output --partial "'getKeysByNode' requires"
  assert_output --partial "got '1'!"
}
@test "navi_men::getKeysByNode fail_too_many_args" {
  run getKeysByNode "${TMP_TEST_CONFIG}" "petty" "petty" "petty"
  assert_failure
  assert_equal "$status" "${ERR_WRONG_NUM_OF_INPUTS}"
  assert_output --partial "'getKeysByNode' requires"
  assert_output --partial "got '4'!"
}
@test "navi_men::getKeysByNode fail_config_json_not_found" {
  tmp="who_cares"
  run getKeysByNode /tmp/does_not_exist.json "node_name" tmp
  assert_failure
  assert_equal "$status" "${ERR_FILE_NOT_FOUND}"
  assert_output --partial "does not exist!"
}
@test "navi_men::getKeysByNode fail_json_node_not_found" {
  tmp="klaus"
  run getKeysByNode "${TMP_TEST_CONFIG}" "not_a_node_name" tmp
  assert_failure
  assert_equal "$status" "${ERR_JSON_NODE_NOT_FOUND}"
  assert_output --partial "does not contain a node"
  assert_output --partial "'not_a_node_name'"
}
@test "navi_men::getKeysByNode fail_config_json_node_not_found" {
  node_name="node_name"
  run getKeysByNode "${TMP_TEST_CONFIG}" "${node_name}" node_name
  assert_failure
  assert_equal "$status" "${ERR_JSON_NODE_NOT_FOUND}"
  assert_output --partial "does not contain a node with name '${node_name}'!"
}
@test "navi_men::getKeysByNode fail_config_json_sub_level_node_not_found" {
  sub_node_name="main_node_one.noview"
  run getKeysByNode "${TMP_TEST_CONFIG}" "${sub_node_name}" sub_node_name
  assert_equal "$status" "${ERR_JSON_NODE_NOT_FOUND}"
  assert_output --partial "does not contain a node with name '${sub_node_name}'!"
}


#########################################################
# FUNCTIONALITY: ERROR ON WRONG TYPE
#########################################################

@test "navi_men::getKeysByNode fail_on_null_node" {
  declare -a keys;
  run getKeysByNode /tmp/bats_navi_men_test_01.json "main_node_one.sub_object.sub_sub_null" keys
  assert_failure
  assert_equal "$status" "${ERR_JSON_NODE_WRONG_TYPE}"
}
@test "navi_men::getKeysByNode fail_on_null_string" {
  declare -a keys;
  run getKeysByNode /tmp/bats_navi_men_test_01.json "main_node_one.sub_object.sub_sub_string" keys
  assert_failure
  assert_equal "$status" "${ERR_JSON_NODE_WRONG_TYPE}"
}
@test "navi_men::getKeysByNode fail_on_number_node" {
  declare -a keys;
  run getKeysByNode /tmp/bats_navi_men_test_01.json "main_node_one.sub_object.sub_sub_number" keys
  assert_failure
  assert_equal "$status" "${ERR_JSON_NODE_WRONG_TYPE}"
}


#########################################################
# FUNCTIONALITY
#########################################################

@test "navi_men::getKeysByNode find_sub_level_node_without_keys" {
  declare -a keys;
  getKeysByNode /tmp/bats_navi_men_test_01.json "main_node_one.sub_object.sub_sub_empty" keys
  assert_equal "${#keys[@]}" 0
}
@test "navi_men::getKeysByNode find_top_level_node" {
  declare -a keys;
  getKeysByNode /tmp/bats_navi_men_test_01.json "main_node_one" keys
  assert_equal "${#keys[@]}" 1
  assert_equal "${keys[0]}" "sub_object"
}
@test "navi_men::getKeysByNode find_sub_level_node" {
  declare -a keys
  getKeysByNode /tmp/bats_navi_men_test_01.json "main_node_one.sub_object" keys
  assert_equal "${#keys[@]}" 6
}

