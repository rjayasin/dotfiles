#!/usr/bin/env bash
# Restore Rex settings and custom themes
set -e
set -o pipefail

cd "$(dirname "$0")"

# Rex writes its settings back when it quits, so it must be closed first
osascript -e 'quit app "Rex Beta"'
while pgrep -f "Rex Beta.app/Contents/MacOS/" > /dev/null; do
    sleep 0.5
done

# Keep keys alphabetized
defaults write com.superlogical.rex Workspace.appearance -string dark
defaults write com.superlogical.rex Workspace.customThemes -data "$(jq -c . themes.json | xxd -p | tr -d '\n')"
defaults write com.superlogical.rex Workspace.darkThemeID -string custom-7735C12C-BBE7-4616-B160-EA319A42B07A
defaults write com.superlogical.rex Workspace.inactivePaneFadeMode -string both
defaults write com.superlogical.rex Workspace.lightThemeID -string merino-light
defaults write com.superlogical.rex Workspace.tabIconTintMode -string off
defaults write com.superlogical.rex Workspace.terminalFallbackFontNames -array
defaults write com.superlogical.rex Workspace.terminalFontName -string "Meslo LG M DZ for Powerline"
defaults write com.superlogical.rex Workspace.terminalFontPointSize -float 14
defaults write com.superlogical.rex Workspace.usesStandardInactiveWindowPaneStyles -bool true

echo "Done! Reopen Rex to apply."
