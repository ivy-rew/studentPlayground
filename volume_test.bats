#!/usr/bin/env bats

setup(){
  . ./volume.sh "TEST"
}

@test "controlVol" {
  set_volume 30
  [ "$(get_volume)" == 30 ]
}
