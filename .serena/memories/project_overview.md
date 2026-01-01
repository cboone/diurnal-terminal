# diurnal-terminal

## Purpose
Automatically switches macOS Terminal.app themes at sunrise and sunset based on geographic coordinates.

## How It Works
1. User configures coordinates and themes in `~/.config/diurnal-terminal.conf`
2. Main script uses heliocron to calculate sunrise/sunset times
3. Generates a LaunchAgent plist scheduled for the next sun event
4. At the scheduled time, switches Terminal theme via AppleScript and reschedules for the next event

## Tech Stack
- **Bash**: Main script (`scripts/diurnal-terminal`)
- **AppleScript**: Theme switching (`scripts/diurnal-terminal-switch-theme.applescript`)
- **Ruby**: Homebrew formula (`Formula/diurnal-terminal.rb`)
- **m4**: Template processing for plist generation
- **heliocron**: External dependency for sun calculations

## Project Structure
```
.
├── Formula/diurnal-terminal.rb          # Homebrew formula
├── LaunchAgents/...template.plist       # m4 template for LaunchAgent
├── config/diurnal-terminal.conf         # Example config
├── scripts/diurnal-terminal             # Main bash script
└── scripts/...-switch-theme.applescript # AppleScript for theme changes
```

## Dependencies
- heliocron (Homebrew)
- m4 (macOS built-in)
