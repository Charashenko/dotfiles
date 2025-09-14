#!/bin/bash
player=$(scripts/music/get_player.sh)
playerctl -p $player play-pause
exit 0