# Style & Conventions

## Commit Messages
Use Conventional Commits format:
- `fix:` for bug fixes
- `feat:` for new features
- `chore:` for maintenance (version bumps, etc.)
- `docs:` for documentation

## Bash Style
- Use `readonly` for constants
- Use `local` for function variables
- Log/debug output goes to stderr (`>&2`)
- Use shellcheck for linting

## Naming
- Use full descriptive names (not abbreviations)
- Example: `sunrise_time` not `sr_time`

## File Organization
- Scripts in `scripts/`
- Homebrew formula in `Formula/`
- LaunchAgent templates in `LaunchAgents/`
- Example config in `config/`
