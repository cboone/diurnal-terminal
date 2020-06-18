# diurnal-terminal

Automatically switch macOS Terminal theme at sunrise and sunset.

## Installation

Install the command:

```bash
brew tap --force-auto-update cboone/diurnal-terminal https://github.com/cboone/diurnal-terminal.git
brew install diurnal-terminal
```

Create `~/.config/diurnal-terminal.conf` and put something like this in it:

```bash
LATITUDE=37.783N
LONGITUDE=122.417W
NIGHT_THEME=Nord
DAY_THEME=Atom One Light
```

Start the service:

```bash
brew services start diurnal-terminal
```
