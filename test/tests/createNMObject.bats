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
## @brief: BATS based test environment for navi_men::createNMObject
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
  load '../../src/navi_men_core_data.bash'

  declare -r TEST_PID="$BASHPID"
  declare -gr TMP_TEST_CONFIG="/tmp/bats_navi_men_test_${TEST_PID}_config.json"

  declare -Ag TEST_OBJECT_DEF=()
  TEST_OBJECT_DEF["bool"]="false"
  TEST_OBJECT_DEF["number"]="0"
  TEST_OBJECT_DEF["string"]="zero"
  readonly TEST_OBJECT_DEF

  declare -agr TEST_ESSENTIALS=("bool")

  echo "{" > "${TMP_TEST_CONFIG}"
  echo "  \"main_node\": {" >> "${TMP_TEST_CONFIG}"
  echo "    \"sub_object_all\": {" >> "${TMP_TEST_CONFIG}"
  echo "      \"string\": \"one\"," >> "${TMP_TEST_CONFIG}"
  echo "      \"number\": 1," >> "${TMP_TEST_CONFIG}"
  echo "      \"bool\": true" >> "${TMP_TEST_CONFIG}"
  echo "    }," >> "${TMP_TEST_CONFIG}"
  echo "    \"sub_only_essential\": {" >> "${TMP_TEST_CONFIG}"
  echo "      \"bool\": true" >> "${TMP_TEST_CONFIG}"
  echo "    }," >> "${TMP_TEST_CONFIG}"
  echo "    \"sub_unknown_element\": {" >> "${TMP_TEST_CONFIG}"
  echo "      \"unknown\": \"element\"," >> "${TMP_TEST_CONFIG}"
  echo "      \"bool\": false" >> "${TMP_TEST_CONFIG}"
  echo "    }," >> "${TMP_TEST_CONFIG}"
  echo "    \"sub_missing_essential\": {" >> "${TMP_TEST_CONFIG}"
  echo "      \"string\": \"zero\"," >> "${TMP_TEST_CONFIG}"
  echo "      \"number\": 0" >> "${TMP_TEST_CONFIG}"
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

@test "navi_men::createNMObject fail_no_args" {
  run createNMObject
  assert_failure
  assert_equal "$status" "${ERR_WRONG_NUM_OF_INPUTS}"
  assert_output --partial "'createNMObject' requires"
  assert_output --partial "got '0'!"
}
@test "navi_men::createNMObject fail_only_single_arg" {
  run createNMObject "petty"
  assert_failure
  assert_equal "$status" "${ERR_WRONG_NUM_OF_INPUTS}"
  assert_output --partial "'createNMObject' requires"
  assert_output --partial "got '1'!"
}
@test "navi_men::createNMObject fail_only_two_args" {
  run createNMObject "petty" "petty"
  assert_failure
  assert_equal "$status" "${ERR_WRONG_NUM_OF_INPUTS}"
  assert_output --partial "'createNMObject' requires"
  assert_output --partial "got '2'!"
}
@test "navi_men::createNMObject fail_only_three_args" {
  run createNMObject "petty" "petty" "petty"
  assert_failure
  assert_equal "$status" "${ERR_WRONG_NUM_OF_INPUTS}"
  assert_output --partial "'createNMObject' requires"
  assert_output --partial "got '3'!"
}
@test "navi_men::createNMObject fail_only_four_args" {
  run createNMObject "petty" "petty" "petty" "petty"
  assert_failure
  assert_equal "$status" "${ERR_WRONG_NUM_OF_INPUTS}"
  assert_output --partial "'createNMObject' requires"
  assert_output --partial "got '4'!"
}
@test "navi_men::createNMObject fail_too_many_args" {
  run createNMObject "petty" "petty" "petty" "petty" "petty" "petty"
  assert_failure
  assert_equal "$status" "${ERR_WRONG_NUM_OF_INPUTS}"
  assert_output --partial "'createNMObject' requires"
  assert_output --partial "got '6'!"
}
@test "navi_men::createNMObject fail_config_json_not_found" {
  tmp="who_cares"
  run createNMObject /tmp/does_not_exist.json "node_name" "petty" "petty" tmp
  assert_failure
  assert_equal "$status" "${ERR_FILE_NOT_FOUND}"
  assert_output --partial "does not exist!"
}
@test "navi_men::createNMObject fail_json_node_not_found" {
  tmp="klaus"
  run createNMObject "${TMP_TEST_CONFIG}" "not_a_node" "petty" "petty" tmp
  assert_failure
  assert_equal "$status" "${ERR_JSON_NODE_NOT_FOUND}"
  assert_output --partial "does not contain a node"
  assert_output --partial "'not_a_node'"
}


#########################################################
# FUNCTIONALITY: ERRORS CHECKS
#########################################################

@test "navi_men::createNMObject fail_missing_essential" {
  local -A obj=()
  run createNMObject "${TMP_TEST_CONFIG}" \
                     "main_node.sub_missing_essential" \
                     TEST_ESSENTIALS \
                     TEST_OBJECT_DEF \
                     obj
  assert_failure
  assert_equal "$status" "${ERR_NM_OBJECT_ESSENTIAL_NODE_NOT_FOUND}"
}
@test "navi_men::createNMObject fail_unkown_element" {
  local -A obj=()
  run createNMObject "${TMP_TEST_CONFIG}" \
                     "main_node.sub_unknown_element" \
                     TEST_ESSENTIALS \
                     TEST_OBJECT_DEF \
                     obj
  assert_failure
  assert_equal "$status" "${ERR_NM_OBJECT_UNKNOWN_NODE}"
}

#########################################################
# FUNCTIONALITY
#########################################################
@test "navi_men::createNMObject create_object_full_spec" {
  local -A obj=()
  createNMObject "${TMP_TEST_CONFIG}" \
                  "main_node.sub_object_all" \
                  TEST_ESSENTIALS \
                  TEST_OBJECT_DEF \
                  obj
  assert_equal "$?" 0
  assert_equal "${#obj[@]}" 3
  assert_equal "${obj[bool]}" "true"
  assert_equal "${obj[number]}" "1"
  assert_equal "${obj[string]}" "one"
}
@test "navi_men::createNMObject create_object_min_spec" {
  local -A obj=()
  createNMObject "${TMP_TEST_CONFIG}" \
                  "main_node.sub_only_essential" \
                  TEST_ESSENTIALS \
                  TEST_OBJECT_DEF \
                  obj
  assert_equal "$?" 0
  assert_equal "${#obj[@]}" 3
  assert_equal "${obj[bool]}" "true"
  assert_equal "${obj[number]}" "0"
  assert_equal "${obj[string]}" "zero"
}
@test "navi_men::createNMObject create_object_spec_less" {
  local -A obj=()
  local -A empty_def=()
  createNMObject "${TMP_TEST_CONFIG}" \
                  "main_node.sub_only_essential" \
                  TEST_ESSENTIALS \
                  empty_def \
                  obj
  assert_equal "$?" 0
  assert_equal "${#obj[@]}" 1
  assert_equal "${obj[bool]}" "true"
}

