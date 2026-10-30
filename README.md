# backup

Backups of app settings that don't belong in dotfiles.

## Rex

- `rex/themes.json` — custom themes
- `rex/settings.sh` — restores the settings and themes (quits Rex first)

Restore:

```sh
rex/settings.sh
```

Back up themes after changing them in Rex:

```sh
/usr/libexec/PlistBuddy -c "Print :Workspace.customThemes" ~/Library/Preferences/com.superlogical.rex.plist | jq -S . > rex/themes.json
```

Settings are backed up by hand: update the matching `defaults write` line in `rex/settings.sh`.
