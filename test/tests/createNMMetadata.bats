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
## @brief: BATS based test environment for navi_men::createNMMetadata
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

  echo "{" > "${TMP_TEST_CONFIG}"
  echo "    \"${JKEY_CORE_OBJECT_CONFIG}\": {" >> "${TMP_TEST_CONFIG}"
  echo "        \"${JKEY_CONFIG_ATTR_CMD_GET_LIST}\": \"ls\"," >> "${TMP_TEST_CONFIG}"
  echo "        \"${JKEY_SHARED_OBJECT_METADATA}\": {" >> "${TMP_TEST_CONFIG}"
  echo "            \"${JKEY_METADATA_ATTR_CAPTION}\": \"Captain_Ion\"," >> "${TMP_TEST_CONFIG}"
  echo "            \"who_the_fuck\": \"is_alice\"" >> "${TMP_TEST_CONFIG}"
  echo "        }" >> "${TMP_TEST_CONFIG}"
  echo "    }," >> "${TMP_TEST_CONFIG}"

  echo "    \"${JKEY_CORE_OBJECT_MODES}\": {" >> "${TMP_TEST_CONFIG}"
  echo "        \"mode_one\": {" >> "${TMP_TEST_CONFIG}"
  echo "            \"${JKEY_MODE_ATTR_CMD}\": \"ls\"," >> "${TMP_TEST_CONFIG}"
  echo "            \"${JKEY_SHARED_OBJECT_METADATA}\": {" >> "${TMP_TEST_CONFIG}"
  echo "                \"${JKEY_METADATA_ATTR_CAPTION}\": \"Captain_Ion\"," >> "${TMP_TEST_CONFIG}"
  echo "                \"who_the_fuck\": \"is_alice\"" >> "${TMP_TEST_CONFIG}"
  echo "            }" >> "${TMP_TEST_CONFIG}"
  echo "        }," >> "${TMP_TEST_CONFIG}"
  echo "        \"mode_two\": {" >> "${TMP_TEST_CONFIG}"
  echo "            \"${JKEY_MODE_ATTR_CMD}\": \"cd\"," >> "${TMP_TEST_CONFIG}"
  echo "            \"${JKEY_MODE_ATTR_ENABLE_ALL}\": true" >> "${TMP_TEST_CONFIG}"
  echo "        }" >> "${TMP_TEST_CONFIG}"
  echo "    }," >> "${TMP_TEST_CONFIG}"

  echo "    \"${JKEY_CORE_OBJECT_VIEWS}\": {" >> "${TMP_TEST_CONFIG}"
  echo "        \"view_one\": {" >> "${TMP_TEST_CONFIG}"
  echo "            \"column_one\": \"ls\"," >> "${TMP_TEST_CONFIG}"
  echo "            \"column_two\": \"df -h\"," >> "${TMP_TEST_CONFIG}"
  echo "            \"${JKEY_SHARED_OBJECT_METADATA}\": {" >> "${TMP_TEST_CONFIG}"
  echo "                \"who_the_fuck\": \"is_alice\"" >> "${TMP_TEST_CONFIG}"
  echo "            }" >> "${TMP_TEST_CONFIG}"
  echo "        }," >> "${TMP_TEST_CONFIG}"
  echo "        \"view_two\": {" >> "${TMP_TEST_CONFIG}"
  echo "            \"column_one\": \"df -h\"" >> "${TMP_TEST_CONFIG}"
  echo "        }" >> "${TMP_TEST_CONFIG}"
  echo "    }" >> "${TMP_TEST_CONFIG}"
  echo "}" >> "${TMP_TEST_CONFIG}"

  chmod 777 "${TMP_TEST_CONFIG}"
}

teardown() {
  rm -rf "${TMP_TEST_CONFIG}"
}


#########################################################
# STANDARD ERRORS
#########################################################

@test "navi_men::createNMMetadata fail_no_args" {
  run createNMMetadata
  assert_failure
  assert_equal "$status" "${ERR_WRONG_NUM_OF_INPUTS}"
  assert_output --partial "'createNMMetadata' requires"
  assert_output --partial "got '0'!"
}
@test "navi_men::createNMMetadata fail_only_single_arg" {
  run createNMMetadata "petty"
  assert_failure
  assert_equal "$status" "${ERR_WRONG_NUM_OF_INPUTS}"
  assert_output --partial "'createNMMetadata' requires"
  assert_output --partial "got '1'!"
}
@test "navi_men::createNMMetadata fail_too_many_args" {
  run createNMMetadata "petty" "petty" "petty"
  assert_failure
  assert_equal "$status" "${ERR_WRONG_NUM_OF_INPUTS}"
  assert_output --partial "'createNMMetadata' requires"
  assert_output --partial "got '3'!"
}
@test "navi_men::createNMMetadata fail_config_json_not_found" {
  tmp_one="who_cares"
  run createNMMetadata /tmp/does_not_exist.json tmp_one
  assert_failure
  assert_equal "$status" "${ERR_FILE_NOT_FOUND}"
  assert_output --partial "does not exist!"
}


# #########################################################
# # FUNCTIONALITY
# #########################################################

@test "navi_men::createNMMetadata create_nm_metadata" {
  local -A md_metadata=()
  run createNMMetadata "${TMP_TEST_CONFIG}" md_metadata
  createNMMetadata "${TMP_TEST_CONFIG}" md_metadata
  assert_equal "$?" 0
  assert_equal "${#md_metadata[@]}" 5

  local -r meta_prefix=${JKEY_SHARED_OBJECT_METADATA}${MULTI_DIM_ARRAY_DELIMITER}
  assert_equal "${md_metadata[${meta_prefix}config::caption]}" "Captain_Ion"
  assert_equal "${md_metadata[${meta_prefix}modes::mode_one::caption]}" "Captain_Ion"

  assert_equal "${md_metadata[${meta_prefix}config::who_the_fuck]}" "is_alice"
  assert_equal "${md_metadata[${meta_prefix}modes::mode_one::who_the_fuck]}" "is_alice"
  assert_equal "${md_metadata[${meta_prefix}views::view_one::who_the_fuck]}" "is_alice"
}


