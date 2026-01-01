#!/usr/bin/env osascript

on run argv
	set new_theme to item 1 of argv

	tell application "Terminal"
		-- Update default settings (for new windows/tabs)
		set default settings to settings set new_theme

		-- Update settings for existing windows/tabs
		repeat with i from 1 to count of windows
			try
				set current settings of tabs of window i to settings set new_theme
			end try
		end repeat
	end tell
end run
