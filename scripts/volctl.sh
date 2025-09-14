#!/bin/bash

# Volume control script
# Uses wpctl to set the volume by predefined value and returns the level of volume

# When action is missing, exit with err
if [[ -z $1 ]]; then
  exit 1
fi

step=5

function vol_get {
  echo "$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | cut -d ' ' -f 2)*100" | bc | cut -d '.' -f 1
}

function update_vol_state {
  vol=$(vol_get)
  if [[ $vol -eq 0 ]]; then
    eww update volume-state="none"
  elif [[ $vol -lt 33 ]]; then
    eww update volume-state="low"
  elif [[ $vol -lt 66 ]]; then
    eww update volume-state="mid"
  else
    eww update volume-state="high"
  fi
  eww update volume-level=$vol

  muted=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | cut -d ' ' -f 3)
  if [[ $muted == "[MUTED]" ]]; then
    vol_mute
  fi
}

function vol_up {
  wpctl set-volume @DEFAULT_AUDIO_SINK@ $step%+
  update_vol_state
}

function vol_down {
  wpctl set-volume @DEFAULT_AUDIO_SINK@ $step%-
  update_vol_state
}

function vol_mute {
  wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
  muted=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | cut -d ' ' -f 3)
  if [[ $muted == "[MUTED]" ]]; then
    eww update volume-state="mute"
  else
    update_vol_state
  fi
}

action=$1

case $action in
  "mute")
    vol_mute
    ;;
  "up")
    vol_up
    ;;
  "down")
    vol_down
    ;;
  *)
    vol_get
    ;;
esac
