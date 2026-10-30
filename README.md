# rex-backup

Backup of my [Rex](https://rex.superlogical.com) terminal settings and custom
themes (Solarized Dark, matching my Ghostty config).

Rex stores everything in the `com.superlogical.rex` macOS defaults domain
(`~/Library/Preferences/com.superlogical.rex.plist`). This repo keeps the parts
worth carrying between machines; window positions, sessions, update state, and
server info are left out.

## Contents

- `themes.json` — custom themes (Rex stores these as a JSON blob in `Workspace.customThemes`)
- `settings.sh` — writes the settings and themes back into Rex

## Restore

Requires `jq`. Quits Rex if it's running, since Rex overwrites its settings when
it quits.

```sh
./settings.sh
```

Then reopen Rex.

## Backup

After changing themes in Rex, export them:

```sh
/usr/libexec/PlistBuddy -c "Print :Workspace.customThemes" ~/Library/Preferences/com.superlogical.rex.plist | jq -S . > themes.json
```

After changing other settings, find the new value and update the matching
`defaults write` line in `settings.sh`:

```sh
defaults read com.superlogical.rex | grep Workspace
```

Then commit and push.
