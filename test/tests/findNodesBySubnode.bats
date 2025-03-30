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
## @brief: BATS based test environment for navi_men::findNodesBySubnode
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
  load '../../src/navi_men_aux_jq.bash'

  declare -r TEST_PID="$BASHPID"
  declare -gr TMP_TEST_CONFIG="/tmp/bats_navi_men_test_${TEST_PID}_config.json"

  echo "{" > "${TMP_TEST_CONFIG}"
  echo "  \"main_node_one\": {" >> "${TMP_TEST_CONFIG}"
  echo "    \"object_one\": {" >> "${TMP_TEST_CONFIG}"
  echo "      \"null\": null," >> "${TMP_TEST_CONFIG}"
  echo "      \"string\": \"klaus\"," >> "${TMP_TEST_CONFIG}"
  echo "      \"number\": 1," >> "${TMP_TEST_CONFIG}"
  echo "      \"bool\": true," >> "${TMP_TEST_CONFIG}"
  echo "      \"array\": [1, 2, 3, 4]" >> "${TMP_TEST_CONFIG}"
  echo "    }," >> "${TMP_TEST_CONFIG}"
  echo "    \"object_two\": {" >> "${TMP_TEST_CONFIG}"
  echo "      \"string\": \"klaus\"," >> "${TMP_TEST_CONFIG}"
  echo "      \"number\": 1," >> "${TMP_TEST_CONFIG}"
  echo "      \"bool\": true," >> "${TMP_TEST_CONFIG}"
  echo "      \"array\": [1, 2, 3, 4]" >> "${TMP_TEST_CONFIG}"
  echo "    }" >> "${TMP_TEST_CONFIG}"
  echo "  }," >> "${TMP_TEST_CONFIG}"
  echo "  \"main_node_two\": {" >> "${TMP_TEST_CONFIG}"
  echo "    \"object_two\": {" >> "${TMP_TEST_CONFIG}"
  echo "      \"string\": \"klaus\"," >> "${TMP_TEST_CONFIG}"
  echo "      \"number\": 1," >> "${TMP_TEST_CONFIG}"
  echo "      \"bool\": true" >> "${TMP_TEST_CONFIG}"
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

@test "navi_men::findNodesBySubnode fail_no_args" {
  run findNodesBySubnode
  assert_failure
  assert_equal "$status" "${ERR_WRONG_NUM_OF_INPUTS}"
  assert_output --partial "'findNodesBySubnode' requires"
  assert_output --partial "got '0'!"
}
@test "navi_men::findNodesBySubnode fail_only_single_arg" {
  run findNodesBySubnode "petty"
  assert_failure
  assert_equal "$status" "${ERR_WRONG_NUM_OF_INPUTS}"
  assert_output --partial "'findNodesBySubnode' requires"
  assert_output --partial "got '1'!"
}
@test "navi_men::findNodesBySubnode fail_only_two_args" {
  run findNodesBySubnode "petty" "petty"
  assert_failure
  assert_equal "$status" "${ERR_WRONG_NUM_OF_INPUTS}"
  assert_output --partial "'findNodesBySubnode' requires"
  assert_output --partial "got '2'!"
}
@test "navi_men::findNodesBySubnode fail_too_many_args" {
  run findNodesBySubnode "petty" "petty" "petty" "petty"
  assert_failure
  assert_equal "$status" "${ERR_WRONG_NUM_OF_INPUTS}"
  assert_output --partial "'findNodesBySubnode' requires"
  assert_output --partial "got '4'!"
}


#########################################################
# FUNCTIONALITY
#########################################################

@test "navi_men::findNodesBySubnode subnode_not_found" {
  declare -a return_list=()
  findNodesBySubnode "${TMP_TEST_CONFIG}" "not_a_subnode" return_list
  assert_equal "$?" 0
  assert_equal "${#return_list[@]}" 0
}
@test "navi_men::findNodesBySubnode ignore_null_elements" {
  findNodesBySubnode "${TMP_TEST_CONFIG}" "null" return_list
  assert_equal "$?" 0
  assert_equal "${#return_list[@]}" 0
}
@test "navi_men::findNodesBySubnode main_nodes_empty_due_to_ignored_search_node" {
  declare -a return_list=()
  findNodesBySubnode "${TMP_TEST_CONFIG}" "main_node_one" return_list
  assert_equal "$?" 0
  assert_equal "${#return_list[@]}" 0
}
@test "navi_men::findNodesBySubnode sublevel_nodes" {
  declare -a return_list=()
  findNodesBySubnode "${TMP_TEST_CONFIG}" "object_one" return_list
  assert_equal "$?" 0
  assert_equal "${#return_list[@]}" 1

  return_list=()
  findNodesBySubnode "${TMP_TEST_CONFIG}" "object_two" return_list
  assert_equal "$?" 0
  assert_equal "${#return_list[@]}" 2

  return_list=()
  findNodesBySubnode "${TMP_TEST_CONFIG}" "string" return_list
  assert_equal "$?" 0
  assert_equal "${#return_list[@]}" 3

  return_list=()
  findNodesBySubnode "${TMP_TEST_CONFIG}" "array" return_list
  assert_equal "$?" 0
  assert_equal "${#return_list[@]}" 2
}
