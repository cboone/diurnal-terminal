# diurnal-terminal

Automatically switch macOS Terminal.app theme at sunrise and sunset.

## Installation

Install the command:

```bash
brew tap cboone/diurnal-terminal https://github.com/cboone/diurnal-terminal.git
brew install diurnal-terminal
```

Edit `~/.config/diurnal-terminal.conf` with your coordinates and themes:

```bash
LATITUDE=37.783N
LONGITUDE=122.417W
DAY_THEME=GitHub Light
NIGHT_THEME=GitHub Dark
```

Start the service:

```bash
brew services start diurnal-terminal
```

The config file is created automatically during installation with default values.

## Usage

The script supports several commands and options:

```
diurnal-terminal (-h|--help)          Show help
diurnal-terminal --overwrite-plist    Create new plist scheduled for the next event
diurnal-terminal --print-plist        Print plist scheduled for the next event
diurnal-terminal --restart-agent      Reload the LaunchAgent
diurnal-terminal --update-theme       Apply the correct theme for the current time

Options:
  -v|--verbose              Log output
  --debug                   Log more output
  --day-theme THEME         Override day theme from config
  --night-theme THEME       Override night theme from config
  --run-at-load             Run immediately when agent loads (for initial setup)
  --time HH:MM:SS           Override trigger time (for plist generation)
```

### Examples

Apply the correct theme for the current time of day:

```bash
diurnal-terminal --update-theme
```

Preview the plist that would be generated:

```bash
diurnal-terminal --print-plist
```

### Testing

Schedule a test trigger for a specific time with custom themes:

```bash
diurnal-terminal --time 14:30:00 --day-theme "Solarized Light" --night-theme "Nord" --overwrite-plist --restart-agent
```

Test with theme overrides (uses day or night based on current time):

```bash
diurnal-terminal --day-theme "Test Light" --night-theme "Test Dark" --update-theme
```

Watch the log to see when it triggers:

```bash
tail -f /tmp/homebrew.mxcl.diurnal-terminal.log
```

Check the LaunchAgent status:

```bash
launchctl print gui/$(id -u)/homebrew.mxcl.diurnal-terminal
```

## How It Works

1. The script reads your coordinates from `~/.config/diurnal-terminal.conf`
2. Uses [heliocron](https://github.com/mfreeborn/heliocron) to calculate sunrise/sunset times
3. Generates a LaunchAgent plist scheduled for the next sun event
4. When triggered, switches the Terminal theme and reschedules for the next event

## Development

Install from the local formula:

```bash
brew install --formula ./Formula/diurnal-terminal.rb
```

Reinstall after changes:

```bash
brew reinstall --formula ./Formula/diurnal-terminal.rb
```

Install from HEAD (uses git instead of tagged tarball):

```bash
brew install --HEAD --formula ./Formula/diurnal-terminal.rb
```

Test and audit the formula:

```bash
brew test ./Formula/diurnal-terminal.rb
brew audit --formula ./Formula/diurnal-terminal.rb
```

Test the scripts directly without installing:

```bash
./scripts/diurnal-terminal --print-plist
./scripts/diurnal-terminal --debug --print-plist
osascript ./scripts/diurnal-terminal-switch-theme.applescript "Nord"
```
