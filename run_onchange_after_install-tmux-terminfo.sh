#!/bin/bash
# Compile a user-local tmux-256color terminfo entry that adds Setulc, so apps
# inside tmux (e.g. neovim) can set the underline colour for diagnostics.
# Uses Homebrew's ncurses since macOS's system ncurses is too old.

set -euo pipefail

ncurses="$(brew --prefix ncurses)"
src="$(mktemp)"
trap 'rm -f "$src"' EXIT

"$ncurses/bin/infocmp" -x -A "$ncurses/share/terminfo" tmux-256color | grep -v 'Setulc=' > "$src"
printf '\tSetulc=\\E[58\\:2\\:\\:%%p1%%{65536}%%/%%d\\:%%p1%%{256}%%/%%{255}%%&%%d\\:%%p1%%{255}%%&%%d%%;m,\n' >> "$src"

"$ncurses/bin/tic" -x -o "$HOME/.terminfo" "$src"
