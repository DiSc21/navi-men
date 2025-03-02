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
## @brief: BATS based test environment for navi_men::hasValue
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
  echo "    \"sub_one\": {" >> "${TMP_TEST_CONFIG}"
  echo "      \"sub_sub_one\": {}," >> "${TMP_TEST_CONFIG}"
  echo "      \"sub_sub_two\": \"klaus\"," >> "${TMP_TEST_CONFIG}"
  echo "      \"sub_sub_three\": \"jobs\"" >> "${TMP_TEST_CONFIG}"
  echo "    }," >> "${TMP_TEST_CONFIG}"
  echo "    \"empty\": {}" >> "${TMP_TEST_CONFIG}"
  echo "  }," >> "${TMP_TEST_CONFIG}"
  echo "  \"some_int\": \"2\"" >> "${TMP_TEST_CONFIG}"
  echo "}" >> "${TMP_TEST_CONFIG}"

  chmod 777 "${TMP_TEST_CONFIG}"
}

teardown() {
  rm -rf "${TMP_TEST_CONFIG}"
}


#########################################################
# STANDARD ERRORS
#########################################################

@test "navi_men::hasNode fail_no_args" {
  run hasNode
  assert_failure
  assert_equal "$status" "${ERR_WRONG_NUM_OF_INPUTS}"
  assert_output --partial "'hasNode' requires"
  assert_output --partial "got '0'!"
}
@test "navi_men::hasNode fail_only_single_arg" {
  run hasNode "${TMP_TEST_CONFIG}"
  assert_failure
  assert_equal "$status" "${ERR_WRONG_NUM_OF_INPUTS}"
  assert_output --partial "'hasNode' requires"
  assert_output --partial "got '1'!"
}
@test "navi_men::hasNode fail_too_many_args" {
  run hasNode "${TMP_TEST_CONFIG}" "petty" "petty" "petty"
  assert_failure
  assert_equal "$status" "${ERR_WRONG_NUM_OF_INPUTS}"
  assert_output --partial "'hasNode' requires"
  assert_output --partial "got '4'!"
}
@test "navi_men::hasNode fail_config_json_not_found" {
  declare -i tmp=0
  run hasNode /tmp/does_not_exist.json "node_name" tmp
  assert_failure
  assert_equal "$status" "${ERR_FILE_NOT_FOUND}"
  assert_output --partial "does not exist!"
}


#########################################################
# FUNCTIONALITY
#########################################################

@test "navi_men::hasNode json_node_not_found" {
  tmp=-1
  hasNode "${TMP_TEST_CONFIG}" "node_not_in_json" tmp
  assert_equal "${tmp}" 0
}
@test "navi_men::hasNode json_main_node_found" {
  tmp=-1
  hasNode "${TMP_TEST_CONFIG}" "main_node_one" tmp
  assert_equal "${tmp}" 1
}
@test "navi_men::hasNode json_sub_node_found" {
  tmp=-1
  hasNode "${TMP_TEST_CONFIG}" "main_node_one.sub_one" tmp
  assert_equal "${tmp}" 1
}


