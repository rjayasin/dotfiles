# Rex

Settings and custom themes for the [Rex](https://rex.superlogical.com) terminal
app (Solarized Dark, matching my Ghostty config). Key bindings live separately
in `.config/rex/init.lua`, which `make sync` symlinks into `~/.config/rex`.

Rex stores its app settings in the `com.superlogical.rex` macOS defaults domain
(`~/Library/Preferences/com.superlogical.rex.plist`). This folder keeps the
parts worth carrying between machines; window positions, sessions, update
state, and server info are left out. This repo is public, so check anything
new from the plist before committing it.

## Contents

- `themes.json` — custom themes (Rex stores these as a JSON blob in `Workspace.customThemes`)
- `settings.sh` — writes the settings and themes back into Rex

## Restore

Requires `jq`. Quits Rex if it's running, since Rex overwrites its settings when
it quits.

```sh
rex/settings.sh
```

Then reopen Rex.

## Backup

After changing themes in Rex, export them:

```sh
/usr/libexec/PlistBuddy -c "Print :Workspace.customThemes" ~/Library/Preferences/com.superlogical.rex.plist | jq -S . > rex/themes.json
```

After changing other settings, find the new value and update the matching
`defaults write` line in `rex/settings.sh`:

```sh
defaults read com.superlogical.rex | grep Workspace
```

Then commit and push.
