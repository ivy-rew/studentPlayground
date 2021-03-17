#!/usr/bin/env bats

setup(){
  . ./volume.sh
}

@test "controlVol" {
  set_volume 30
  [[ "$(get_volume)" == 31 ]]
}
