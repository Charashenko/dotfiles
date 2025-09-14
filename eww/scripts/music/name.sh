#!/bin/bash
player=$(scripts/music/get_player.sh)
playerctl -p $player metadata -f '{{artist}} - {{title}}'
exit 0