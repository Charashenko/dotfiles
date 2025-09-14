#!/bin/bash
player=$(scripts/music/get_player.sh)
playerctl -p $player previous
exit 0