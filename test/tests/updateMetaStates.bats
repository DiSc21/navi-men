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
## @brief: BATS based test environment for navi_men::updateMetaStates
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
  load '../../src/navi_men_states.conf'

  load '../../src/navi_men_menu.bash'
  load '../../src/navi_men_state_setter.bash'
}


#########################################################
# STANDARD ERRORS
#########################################################

@test "navi_men::updateMetaStates fail_no_args" {
  run updateMetaStates
  assert_failure
  assert_equal "$status" "${ERR_WRONG_NUM_OF_INPUTS}"
  assert_output --partial "'updateMetaStates' requires"
  assert_output --partial "got '0'!"
}
@test "navi_men::updateMetaStates fail_only_single_arg" {
  run updateMetaStates "petty"
  assert_failure
  assert_equal "$status" "${ERR_WRONG_NUM_OF_INPUTS}"
  assert_output --partial "'updateMetaStates' requires"
  assert_output --partial "got '1'!"
}
@test "navi_men::updateMetaStates fail_too_many_args" {
  run updateMetaStates "petty" "petty" "petty"
  assert_failure
  assert_equal "$status" "${ERR_WRONG_NUM_OF_INPUTS}"
  assert_output --partial "'updateMetaStates' requires"
  assert_output --partial "got '3'!"
}


# #########################################################
# # FUNCTIONALITY
# #########################################################

@test "navi_men::updateMetaStates check_caption_sources_undefined" {
  local -r pre_view="${JKEY_CORE_OBJECT_VIEWS}${MULTI_DIM_ARRAY_DELIMITER}"
  local -r pre_mode="${JKEY_CORE_OBJECT_MODES}${MULTI_DIM_ARRAY_DELIMITER}"

  local -A test_core_data=()
  test_core_data["${JKEY_SHARED_OBJECT_METADATA}${MULTI_DIM_ARRAY_DELIMITER}${pre_mode}mode_one"]="moc"
  test_core_data["${JKEY_SHARED_OBJECT_METADATA}${MULTI_DIM_ARRAY_DELIMITER}${pre_view}view_one"]="voc"

  local -A test_meta_states=()
  test_meta_states["${MDKEY_STATE_MODE_CURRENT}"]="mo"
  test_meta_states["${MDKEY_STATE_VIEW_CURRENT}"]="vo"

  run updateMetaStates test_core_data test_meta_states
  assert_success
  updateMetaStates test_core_data test_meta_states
  assert_equal "$?" 0
  assert_equal "${test_meta_states[${MDKEY_STATE_VIEW_CAPTION}]}" ""
}

@test "navi_men::updateMetaStates check_view_caption_sources" {
  local -r pre_view="${JKEY_CORE_OBJECT_VIEWS}${MULTI_DIM_ARRAY_DELIMITER}"
  local -r pre_mode="${JKEY_CORE_OBJECT_MODES}${MULTI_DIM_ARRAY_DELIMITER}"

  local -A test_core_data=()
  test_core_data["${JKEY_SHARED_OBJECT_METADATA}${MULTI_DIM_ARRAY_DELIMITER}${MDKEY_STATE_MODE_CURRENT}"]="mode_one"
  test_core_data["${JKEY_SHARED_OBJECT_METADATA}${MULTI_DIM_ARRAY_DELIMITER}${MDKEY_STATE_VIEW_CURRENT}"]="view_one"

  local -r conf_view_cap="${JKEY_SHARED_OBJECT_METADATA}${MULTI_DIM_ARRAY_DELIMITER}${JKEY_CORE_OBJECT_CONFIG}${MULTI_DIM_ARRAY_DELIMITER}${JKEY_METADATA_ATTR_CAPTION}"
  test_core_data["${conf_view_cap}"]="voc1"

  local -A test_meta_states=()
  test_meta_states["${MDKEY_STATE_MODE_CURRENT}"]="mode_one"
  test_meta_states["${MDKEY_STATE_VIEW_CURRENT}"]="view_one"

  run updateMetaStates test_core_data test_meta_states
  assert_success
  updateMetaStates test_core_data test_meta_states
  assert_equal "$?" 0
  assert_equal "${test_meta_states[${MDKEY_STATE_VIEW_CAPTION}]}" "voc1"

  local -r view_cap="${pre_view}view_one${MULTI_DIM_ARRAY_DELIMITER}${JKEY_METADATA_ATTR_CAPTION}"
  test_core_data["${JKEY_SHARED_OBJECT_METADATA}${MULTI_DIM_ARRAY_DELIMITER}${view_cap}"]="voc2"
  run updateMetaStates test_core_data test_meta_states
  assert_success
  updateMetaStates test_core_data test_meta_states
  assert_equal "$?" 0
  assert_equal "${test_meta_states[${MDKEY_STATE_VIEW_CAPTION}]}" "voc2"
}
@test "navi_men::updateMetaStates check_mode_caption_sources" {
  local -r pre_view="${JKEY_CORE_OBJECT_VIEWS}${MULTI_DIM_ARRAY_DELIMITER}"
  local -r pre_mode="${JKEY_CORE_OBJECT_MODES}${MULTI_DIM_ARRAY_DELIMITER}"

  local -A test_core_data=()
  test_core_data["${JKEY_SHARED_OBJECT_METADATA}${MULTI_DIM_ARRAY_DELIMITER}${MDKEY_STATE_MODE_CURRENT}"]="mode_one"
  test_core_data["${JKEY_SHARED_OBJECT_METADATA}${MULTI_DIM_ARRAY_DELIMITER}${MDKEY_STATE_VIEW_CURRENT}"]="view_one"

  local -r mode_cap="${pre_mode}mode_one${MULTI_DIM_ARRAY_DELIMITER}${JKEY_METADATA_ATTR_CAPTION}"
  test_core_data["${JKEY_SHARED_OBJECT_METADATA}${MULTI_DIM_ARRAY_DELIMITER}${mode_cap}"]="moc"

  local -A test_meta_states=()
  test_meta_states["${MDKEY_STATE_MODE_CURRENT}"]="mode_one"
  test_meta_states["${MDKEY_STATE_VIEW_CURRENT}"]="view_one"

  run updateMetaStates test_core_data test_meta_states
  assert_success
  updateMetaStates test_core_data test_meta_states
  assert_equal "$?" 0
  assert_equal "${test_meta_states[${MDKEY_STATE_MODE_CAPTION}]}" "moc"
}
