#!/bin/sh
# Reference: https://askubuntu.com/questions/41858/shortcut-to-switch-between-analog-stereo-output-hdmi-audio-output

CURRENT_PROFILE=$(pacmd list-cards | grep "active profile" | cut -d ' ' -f 3-)

if [ "$CURRENT_PROFILE" = "<output:hdmi-stereo-extra1>" ] ; then
  pacmd set-card-profile 0 "output:analog-stereo+input:analog-stereo"
else
  pacmd set-card-profile 0 "output:hdmi-stereo-extra1"
fi
