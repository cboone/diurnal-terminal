#!/usr/bin/env osascript

on run argv
	# Get the specified theme
	set new_theme to item 1 of argv

	# Update default settings (for new windows/tabs)
	tell application "Terminal"
		set default settings to settings set new_theme
	end tell

	# Update settings for exsting windows/tabs
	tell application "Terminal"
		set current settings of tabs of windows to settings set new_theme
	end tell
end run
