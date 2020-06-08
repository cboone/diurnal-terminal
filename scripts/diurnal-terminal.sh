#!/bin/bash

# https://stackoverflow.com/questions/10929453/read-a-file-line-by-line-assigning-the-value-to-a-variable
while IFS='' read -r LINE || [[ -n "$LINE" ]]
    do declare "$LINE"
done < ~/.config/diurnal-terminal.conf

HOUR=$(date '+%H')
if [ "$HOUR" -ge 12 ]; then
    EVENT=sunset
    OFFSET=$SUNSET_OFFSET
    THEME=$NIGHT_THEME
elif [ "$HOUR" -lt 12 ]; then
    EVENT=sunrise
    OFFSET=$SUNRISE_OFFSET
    THEME=$DAY_THEME
fi

echo "Waiting for $EVENT $OFFSET to switch to $THEME."

"$(brew --prefix)"/bin/heliocron --latitude "$LATITUDE" --longitude "$LONGITUDE" wait --event "$EVENT" --offset "$OFFSET"; osascript "$(brew --prefix)"/bin/diurnal-terminal-switch-theme "$THEME"
