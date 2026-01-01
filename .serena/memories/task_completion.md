# Task Completion Checklist

When completing a task:

1. **Test locally**
   ```bash
   ./scripts/diurnal-terminal --debug --print-plist
   ./scripts/diurnal-terminal --update-theme
   ```

2. **Reinstall and verify**
   ```bash
   brew reinstall diurnal-terminal --HEAD
   ```

3. **Commit with conventional format**
   ```bash
   git commit -m "type: short description"
   ```

4. **Bump version if needed**
   - Edit `version` in `Formula/diurnal-terminal.rb`
   - Commit: `chore: bump version to X.Y.Z`

5. **Push changes**
   ```bash
   git push
   ```
