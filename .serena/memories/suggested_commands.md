# Suggested Commands

## Development & Testing
```bash
# Preview generated plist without writing
./scripts/diurnal-terminal --print-plist

# Apply current theme manually
./scripts/diurnal-terminal --update-theme

# Debug mode with verbose output
./scripts/diurnal-terminal --debug --print-plist

# Check heliocron output for coordinates
heliocron --latitude 43.6722N --longitude 72.3813W report
```

## Installation (Local Development)
```bash
# Tap local repo
brew tap cboone/diurnal-terminal /path/to/diurnal-terminal

# Install HEAD version (latest commits)
brew install diurnal-terminal --HEAD

# Reinstall after changes
brew reinstall diurnal-terminal --HEAD

# Start the service
brew services start diurnal-terminal
```

## LaunchAgent Management
```bash
# Check agent status
launchctl print gui/$(id -u)/homebrew.mxcl.diurnal-terminal

# Load agent manually
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.diurnal-terminal.plist

# Unload agent
launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.diurnal-terminal.plist

# View agent log
cat /tmp/homebrew.mxcl.diurnal-terminal.log
```

## Git Workflow
```bash
# Conventional commits format
git commit -m "fix: description"
git commit -m "feat: description"
git commit -m "chore: description"
```
