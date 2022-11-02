#!/bin/sh

# Change this according to your setup
HDMI_STATUS="$(cat /sys/class/drm/card0/card0-HDMI-A-2/status)"

sleep 1

if [ "$HDMI_STATUS" = "connected" ]; then
    /usr/bin/notify-send "HDMI" "HDMI monitor connected!"
    /usr/bin/xrandr --output eDP-1 --auto --right-of HDMI-2
    $AUDIO_SETUP_SCRIPT
else
    /usr/bin/notify-send "HDMI" "HDMI monitor was disconnected!"
fi
