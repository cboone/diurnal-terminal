# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

diurnal-terminal automatically switches macOS Terminal themes at sunrise and sunset. It uses heliocron to calculate sun times based on geographic coordinates, then schedules a LaunchAgent to run at those times.

## Architecture

The project consists of:

- **scripts/diurnal-terminal** - Main bash script that calculates sunrise/sunset times using heliocron, determines which theme should be active, and manages the LaunchAgent plist
- **scripts/diurnal-terminal-switch-theme.applescript** - AppleScript that actually changes Terminal.app themes (both default settings and existing windows/tabs)
- **Formula/diurnal-terminal.rb** - Homebrew formula for installation
- **LaunchAgents/homebrew.mxcl.diurnal-terminal.template.plist** - Template plist processed by m4 to schedule the next theme switch

## How It Works

1. The main script reads config from `~/.config/diurnal-terminal.conf` (LATITUDE, LONGITUDE, DAY_THEME, NIGHT_THEME)
2. Calls heliocron to get today's sunrise/sunset times
3. Determines the next event (sunrise or sunset) and schedules the LaunchAgent to run at that time
4. When triggered, the script updates the Terminal theme via AppleScript and reschedules itself for the next event

## Testing Locally

Run the main script directly with flags:

```bash
./scripts/diurnal-terminal --print-plist    # Preview generated plist
./scripts/diurnal-terminal --update-theme   # Apply current theme
./scripts/diurnal-terminal --debug --print-plist  # Verbose output
```

## Dependencies

- heliocron (installed via Homebrew)
- m4 (macOS built-in)

## Releasing

Update version in `Formula/diurnal-terminal.rb`, create a git tag matching the version, then update the sha256 hash after pushing the tag.
