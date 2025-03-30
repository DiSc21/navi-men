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
## @brief: BATS based test environment for navi_men::readObjectMetadataFromJson
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
  echo "    \"main_node_no_metadata\": {" >> "${TMP_TEST_CONFIG}"
  echo "        \"string\": \"str\"" >> "${TMP_TEST_CONFIG}"
  echo "    }," >> "${TMP_TEST_CONFIG}"
  echo "    \"main_node_metadata_no_object\": {" >> "${TMP_TEST_CONFIG}"
  echo "        \"string\": \"str\"," >> "${TMP_TEST_CONFIG}"
  echo "        \"metadata\": null" >> "${TMP_TEST_CONFIG}"
  echo "    }," >> "${TMP_TEST_CONFIG}"
  echo "    \"main_node_nested_metadata\": {" >> "${TMP_TEST_CONFIG}"
  echo "        \"string\": \"str\"," >> "${TMP_TEST_CONFIG}"
  echo "        \"metadata\": {" >> "${TMP_TEST_CONFIG}"
  echo "            \"metadata\": {" >> "${TMP_TEST_CONFIG}"
  echo "                \"string\": \"str\"" >> "${TMP_TEST_CONFIG}"
  echo "            }" >> "${TMP_TEST_CONFIG}"
  echo "        }" >> "${TMP_TEST_CONFIG}"
  echo "    }," >> "${TMP_TEST_CONFIG}"
  echo "    \"main_node_metadata_empty\": {" >> "${TMP_TEST_CONFIG}"
  echo "        \"string\": \"str\"," >> "${TMP_TEST_CONFIG}"
  echo "        \"metadata\": {}" >> "${TMP_TEST_CONFIG}"
  echo "    }," >> "${TMP_TEST_CONFIG}"
  echo "    \"main_node_metadata_string\": {" >> "${TMP_TEST_CONFIG}"
  echo "        \"string\": \"str\"," >> "${TMP_TEST_CONFIG}"
  echo "        \"metadata\": {" >> "${TMP_TEST_CONFIG}"
  echo "            \"caption\": \"text\"" >> "${TMP_TEST_CONFIG}"
  echo "        }" >> "${TMP_TEST_CONFIG}"
  echo "    }" >> "${TMP_TEST_CONFIG}"
  echo "}" >> "${TMP_TEST_CONFIG}"

  chmod 777 "${TMP_TEST_CONFIG}"
}

teardown() {
  rm -f "${TMP_TEST_CONFIG}"
}

#########################################################
# STANDARD ERRORS
#########################################################

@test "navi_men::readObjectMetadataFromJson fail_no_args" {
  run readObjectMetadataFromJson
  assert_failure
  assert_equal "$status" "${ERR_WRONG_NUM_OF_INPUTS}"
  assert_output --partial "'readObjectMetadataFromJson' requires"
  assert_output --partial "got '0'!"
}
@test "navi_men::readObjectMetadataFromJson fail_only_single_arg" {
  run readObjectMetadataFromJson "${TMP_TEST_CONFIG}"
  assert_failure
  assert_equal "$status" "${ERR_WRONG_NUM_OF_INPUTS}"
  assert_output --partial "'readObjectMetadataFromJson' requires"
  assert_output --partial "got '1'!"
}
@test "navi_men::readObjectMetadataFromJson fail_only_two_args" {
  run readObjectMetadataFromJson "${TMP_TEST_CONFIG}" "petty"
  assert_failure
  assert_equal "$status" "${ERR_WRONG_NUM_OF_INPUTS}"
  assert_output --partial "'readObjectMetadataFromJson' requires"
  assert_output --partial "got '2'!"
}
@test "navi_men::readObjectMetadataFromJson fail_too_many_args" {
  run readObjectMetadataFromJson "${TMP_TEST_CONFIG}" "petty" "petty" "petty" "petty"
  assert_failure
  assert_equal "$status" "${ERR_WRONG_NUM_OF_INPUTS}"
  assert_output --partial "'readObjectMetadataFromJson' requires"
  assert_output --partial "got '5'!"
}
@test "navi_men::readObjectMetadataFromJson fail_on_node_not_found" {
  local -A obj=()
  run readObjectMetadataFromJson "${TMP_TEST_CONFIG}" "not_a_node" obj
  assert_failure
  assert_equal "$status" "${ERR_JSON_NODE_NOT_FOUND}"
}

# #########################################################
# # FUNCTIONALITY: ERRORS FOR NON SCALARS
# #########################################################

@test "navi_men::readObjectMetadataFromJson fail_on_null_metadata" {
  local -A obj=()
  run readObjectMetadataFromJson "${TMP_TEST_CONFIG}" "main_node_metadata_no_object" obj
  assert_failure
  assert_equal "$status" "${ERR_JSON_NODE_WRONG_TYPE}"
}
@test "navi_men::readObjectMetadataFromJson fail_on_nested_metadata" {
  local -A obj=()
  run readObjectMetadataFromJson "${TMP_TEST_CONFIG}" "main_node_nested_metadata" obj
  assert_failure
  assert_equal "$status" "${ERR_NM_OBJECT_NESTED_METADATA}"
}

##########################################################
## FUNCTIONALITY
##########################################################
@test "navi_men::readObjectMetadataFromJson read_empty_metadata" {
  local -A obj=()
  readObjectMetadataFromJson "${TMP_TEST_CONFIG}" "main_node_metadata_empty" obj
  assert_equal "$?" 0
  assert_equal "${#obj[@]}" 0
}
@test "navi_men::readObjectMetadataFromJson read_simple_metadata" {
  local -A obj=()
  readObjectMetadataFromJson "${TMP_TEST_CONFIG}" "main_node_metadata_string" obj
  assert_equal "$?" 0
  assert_equal "${#obj[@]}" 1
  assert_equal "${obj[${JKEY_SHARED_OBJECT_METADATA}${MULTI_DIM_ARRAY_DELIMITER}main_node_metadata_string::caption]}" "text"
}


