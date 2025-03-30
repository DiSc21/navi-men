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
## @brief: BATS based test environment for navi_men::findMissingKeys
##
## @usage: 'bats -p <this_bats_file>'
##
## @dependencies:
## - bats (-support/assert)
## - bash 4.3
##


setup() {
  load '/usr/lib/bats/bats-support/load'
  load '/usr/lib/bats/bats-assert/load'

  load '../../src/navi_men.conf'
  load '../../src/navi_men_aux_array.bash'
}


#########################################################
# STANDARD ERRORS
#########################################################

@test "navi_men::findMissingKeys fail_no_args" {
  run findMissingKeys
  assert_failure
  assert_equal "$status" "${ERR_WRONG_NUM_OF_INPUTS}"
  assert_output --partial "'findMissingKeys' requires"
  assert_output --partial "got '0'!"
}
@test "navi_men::findMissingKeys fail_only_single_arg" {
  run findMissingKeys "petty"
  assert_failure
  assert_equal "$status" "${ERR_WRONG_NUM_OF_INPUTS}"
  assert_output --partial "'findMissingKeys' requires"
  assert_output --partial "got '1'!"
}
@test "navi_men::findMissingKeys fail_only_two_args" {
  run findMissingKeys "petty" "petty"
  assert_failure
  assert_equal "$status" "${ERR_WRONG_NUM_OF_INPUTS}"
  assert_output --partial "'findMissingKeys' requires"
  assert_output --partial "got '2'!"
}
@test "navi_men::findMissingKeys fail_too_many_args" {
  run findMissingKeys "petty" "petty" "petty" "petty"
  assert_failure
  assert_equal "$status" "${ERR_WRONG_NUM_OF_INPUTS}"
  assert_output --partial "'findMissingKeys' requires"
  assert_output --partial "got '4'!"
}


#########################################################
# FUNCTIONALITY
#########################################################

@test "navi_men::findMissingKeys empty_inputs" {
  declare -ra string_list=()
  declare -rA assi_arry=()
  declare -a return_list=()
  findMissingKeys string_list assi_arry return_list
  assert_equal "$?" 0
  assert_equal "${#return_list[@]}" 0
}

@test "navi_men::findMissingKeys full_check_list" {
  declare -ra string_list=("Natascha" "Lovecock" "Ivana" "Fuckalot" "Wild" )
  declare -A assi_arry=()
  declare -a return_list=()

  run findMissingKeys string_list assi_arry return_list
  assert_success
  findMissingKeys string_list assi_arry return_list
  assert_equal "$?" 0
  assert_equal "${#return_list[@]}" 5

  assi_arry["Ivana"]="Fuckalot"
  findMissingKeys string_list assi_arry return_list
  assert_equal "$?" 0
  assert_equal "${#return_list[@]}" 4

  assi_arry["Nancy"]="A"
  assi_arry["Natascha"]="Lovecock"
  findMissingKeys string_list assi_arry return_list
  assert_equal "$?" 0
  assert_equal "${#return_list[@]}" 3
}

@test "navi_men::findMissingKeys empty_check_map" {
  declare -ra string_list=()
  declare -A assi_arry=( ["Gina"]="Wild" )
  declare -a return_list=()

  findMissingKeys string_list assi_arry return_list
  assert_equal "$?" 0
  assert_equal "${#return_list[@]}" 0

  assi_arry["Ivana"]="Fuckalot"
  findMissingKeys string_list assi_arry return_list
  assert_equal "$?" 0
  assert_equal "${#return_list[@]}" 0

  assi_arry["Nancy"]="A"
  assi_arry["Natascha"]="Lovecock"
  findMissingKeys string_list assi_arry return_list
  assert_equal "$?" 0
  assert_equal "${#return_list[@]}" 0
}

@test "navi_men::findMissingKeys check_matching_elements" {
  declare -a string_list=()
  declare -A assi_arry=( ["Gina"]="Wild" \
                         ["Ivana"]="Fuckalot" \
                         ["Nancy"]="A" \
                         ["Natascha"]="Lovecock" )
  declare -a return_list=()

  findMissingKeys string_list assi_arry return_list
  assert_equal "$?" 0
  assert_equal "${#return_list[@]}" 0

  string_list+=("Gina")
  findMissingKeys string_list assi_arry return_list
  assert_equal "$?" 0
  assert_equal "${#return_list[@]}" 0

  string_list+=("Ivana")
  findMissingKeys string_list assi_arry return_list
  assert_equal "$?" 0
  assert_equal "${#return_list[@]}" 0

  string_list+=("Missed")
  findMissingKeys string_list assi_arry return_list
  assert_equal "$?" 0
  assert_equal "${#return_list[@]}" 1
  assert_equal "${return_list[0]}" "Missed"
}

