# diurnal-terminal

Automatically switch macOS Terminal.app theme at sunrise and sunset.

## Installation

Install the command:

```bash
brew tap cboone/diurnal-terminal https://github.com/cboone/diurnal-terminal.git
brew install diurnal-terminal
```

Create `~/.config/diurnal-terminal.conf` and put something like this in it:

```bash
LATITUDE=37.783N
LONGITUDE=122.417W
NIGHT_THEME=GitHub Dark
DAY_THEME=GitHub Light
```

Start the service:

```bash
brew services start diurnal-terminal
```

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
