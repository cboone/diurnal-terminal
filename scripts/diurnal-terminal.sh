#!/bin/bash

if [ -z "$0" ]; then
    echo "USAGE: $0 [sunrise | sunset]"
    exit 1
fi

declare "$(env -i "$(cat ~/.config/diurnal-terminal.conf)")"

if [ "$1" = "sunset" ]; then
    EVENT=sunset
    OFFSET=SUNSET_OFFSET
    THEME=NIGHT_THEME
elif [ "$1" = "sunrise" ]; then
    EVENT=sunrise
    OFFSET=SUNRISE_OFFSET
    THEME=DAY_THEME
fi

"$(brew --prefix)"/bin/heliocron --latitude "$LATITUDE" --longitude "$LONGITUDE" wait --event "$EVENT" --offset "$OFFSET"; osascript ~/Library/Application\ Support/com.hypsometry.diurnal-terminal/scripts/switch-terminal-theme.scpt "$THEME"
