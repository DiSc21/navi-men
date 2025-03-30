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
## @brief: BATS based test environment for navi_men::createNMObjectList
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

  echo "    \"constraint\": {" >> "${TMP_TEST_CONFIG}"
  echo "      \"object1\": {" >> "${TMP_TEST_CONFIG}"
  echo "        \"string\": \"one\"," >> "${TMP_TEST_CONFIG}"
  echo "        \"number\": 1," >> "${TMP_TEST_CONFIG}"
  echo "        \"bool\": true" >> "${TMP_TEST_CONFIG}"
  echo "      }," >> "${TMP_TEST_CONFIG}"
  echo "      \"object2\": {" >> "${TMP_TEST_CONFIG}"
  echo "        \"string\": \"one\"," >> "${TMP_TEST_CONFIG}"
  echo "        \"number\": 1," >> "${TMP_TEST_CONFIG}"
  echo "        \"bool\": true" >> "${TMP_TEST_CONFIG}"
  echo "      }," >> "${TMP_TEST_CONFIG}"
  echo "      \"object3\": {" >> "${TMP_TEST_CONFIG}"
  echo "        \"string\": \"one\"," >> "${TMP_TEST_CONFIG}"
  echo "        \"number\": 1," >> "${TMP_TEST_CONFIG}"
  echo "        \"bool\": true" >> "${TMP_TEST_CONFIG}"
  echo "      }" >> "${TMP_TEST_CONFIG}"
  echo "    }," >> "${TMP_TEST_CONFIG}"

  echo "    \"free_bird\": {" >> "${TMP_TEST_CONFIG}"
  echo "      \"ps\": {" >> "${TMP_TEST_CONFIG}"
  echo "        \"gina\": \"wild\"," >> "${TMP_TEST_CONFIG}"
  echo "        \"ivana\": \"fukalot\"" >> "${TMP_TEST_CONFIG}"
  echo "      }," >> "${TMP_TEST_CONFIG}"
  echo "      \"marvel\": {" >> "${TMP_TEST_CONFIG}"
  echo "        \"tony\": \"stark\"," >> "${TMP_TEST_CONFIG}"
  echo "        \"steve\": \"rogers\"," >> "${TMP_TEST_CONFIG}"
  echo "        \"peter\": \"parker\"," >> "${TMP_TEST_CONFIG}"
  echo "        \"bruce\": \"banner\"" >> "${TMP_TEST_CONFIG}"
  echo "      }" >> "${TMP_TEST_CONFIG}"
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

@test "navi_men::createNMObjectList fail_no_args" {
  run createNMObjectList
  assert_failure
  assert_equal "$status" "${ERR_WRONG_NUM_OF_INPUTS}"
  assert_output --partial "'createNMObjectList' requires"
  assert_output --partial "got '0'!"
}
@test "navi_men::createNMObjectList fail_only_single_arg" {
  run createNMObjectList "petty"
  assert_failure
  assert_equal "$status" "${ERR_WRONG_NUM_OF_INPUTS}"
  assert_output --partial "'createNMObjectList' requires"
  assert_output --partial "got '1'!"
}
@test "navi_men::createNMObjectList fail_only_two_args" {
  run createNMObjectList "petty" "petty"
  assert_failure
  assert_equal "$status" "${ERR_WRONG_NUM_OF_INPUTS}"
  assert_output --partial "'createNMObjectList' requires"
  assert_output --partial "got '2'!"
}
@test "navi_men::createNMObjectList fail_only_three_args" {
  run createNMObjectList "petty" "petty" "petty"
  assert_failure
  assert_equal "$status" "${ERR_WRONG_NUM_OF_INPUTS}"
  assert_output --partial "'createNMObjectList' requires"
  assert_output --partial "got '3'!"
}
@test "navi_men::createNMObjectList fail_only_four_args" {
  run createNMObjectList "petty" "petty" "petty" "petty"
  assert_failure
  assert_equal "$status" "${ERR_WRONG_NUM_OF_INPUTS}"
  assert_output --partial "'createNMObjectList' requires"
  assert_output --partial "got '4'!"
}
@test "navi_men::createNMObjectList fail_too_many_args" {
  run createNMObjectList "petty" "petty" "petty" "petty" "petty" "petty"
  assert_failure
  assert_equal "$status" "${ERR_WRONG_NUM_OF_INPUTS}"
  assert_output --partial "'createNMObjectList' requires"
  assert_output --partial "got '6'!"
}
@test "navi_men::createNMObjectList fail_config_json_not_found" {
  tmp="who_cares"
  run createNMObjectList /tmp/does_not_exist.json "node_name" "petty" "petty" tmp
  assert_failure
  assert_equal "$status" "${ERR_FILE_NOT_FOUND}"
  assert_output --partial "does not exist!"
}
@test "navi_men::createNMObjectList fail_json_node_not_found" {
  tmp="klaus"
  run createNMObjectList "${TMP_TEST_CONFIG}" "not_a_node" "petty" "petty" tmp
  assert_failure
  assert_equal "$status" "${ERR_JSON_NODE_NOT_FOUND}"
  assert_output --partial "does not contain a node"
  assert_output --partial "'not_a_node'"
}


# #########################################################
# # FUNCTIONALITY
# #########################################################

@test "navi_men::createNMObjectList read_constraint_object_list" {
  local -A md_obj_list=()
  createNMObjectList "${TMP_TEST_CONFIG}" \
                  "main_node.constraint" \
                  TEST_ESSENTIALS \
                  TEST_OBJECT_DEF \
                  md_obj_list
  assert_equal "$?" 0
  assert_equal "${#md_obj_list[@]}" 9

  assert_equal "${md_obj_list[main_node::constraint::object1::bool]}" "true"
  assert_equal "${md_obj_list[main_node::constraint::object1::number]}" "1"
  assert_equal "${md_obj_list[main_node::constraint::object1::string]}" "one"

  assert_equal "${md_obj_list[main_node::constraint::object2::bool]}" "true"
  assert_equal "${md_obj_list[main_node::constraint::object2::number]}" "1"
  assert_equal "${md_obj_list[main_node::constraint::object2::string]}" "one"

  assert_equal "${md_obj_list[main_node::constraint::object3::bool]}" "true"
  assert_equal "${md_obj_list[main_node::constraint::object3::number]}" "1"
  assert_equal "${md_obj_list[main_node::constraint::object3::string]}" "one"

}

@test "navi_men::createNMObjectList read_free_object_list" {
  local -A md_obj_list=()
  local -a empty_essentials=()
  local -A empty_defaults=()

  createNMObjectList "${TMP_TEST_CONFIG}" \
                  "main_node.free_bird" \
                  empty_essentials \
                  empty_defaults \
                  md_obj_list
  assert_equal "$?" 0
  assert_equal "${#md_obj_list[@]}" 6

  assert_equal "${md_obj_list[main_node::free_bird::ps::gina]}" "wild"
  assert_equal "${md_obj_list[main_node::free_bird::ps::ivana]}" "fukalot"

  assert_equal "${md_obj_list[main_node::free_bird::marvel::tony]}" "stark"
  assert_equal "${md_obj_list[main_node::free_bird::marvel::steve]}" "rogers"
  assert_equal "${md_obj_list[main_node::free_bird::marvel::bruce]}" "banner"
  assert_equal "${md_obj_list[main_node::free_bird::marvel::peter]}" "parker"
}


