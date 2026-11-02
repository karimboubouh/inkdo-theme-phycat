#!/usr/bin/env bash
# Builds one complete InkDo theme per palette: themes/<Name>/theme.css = palette + chrome +
# blocks (+ neon for the dark series). Each folder zips into an importable theme (README.md).
set -euo pipefail
cd "$(dirname "$0")"
rm -rf themes
for palette in src/palettes/*.css; do
  slug=$(basename "$palette" .css)
  name="$(printf '%s' "${slug:0:1}" | tr '[:lower:]' '[:upper:]')${slug:1}"
  mkdir -p "themes/$name"
  {
    printf '/* %s, an InkDo theme ported from phycat by sumruler (MIT; LICENSE).\n' "$name"
    printf '   Built by build.sh from src/; edit there, not here. */\n\n'
    cat "$palette"
    printf '\n'
    cat src/chrome.css
    printf '\n'
    cat src/blocks.css
    if grep -q 'phycat-neon' "$palette"; then printf '\n'; cat src/neon.css; fi
  } >"themes/$name/theme.css"
done
echo "built $(ls themes | wc -l | tr -d ' ') themes"
