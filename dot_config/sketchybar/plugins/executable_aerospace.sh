#!/usr/bin/env bash
[ -z "$FOCUSED_WORKSPACE" ] && FOCUSED_WORKSPACE="$(aerospace list-workspaces --focused)"

declare -A icons
while IFS='|' read -r ws app; do
  [ -z "$app" ] && continue
  glyph="$("$CONFIG_DIR/plugins/icon_map.sh" "$app")"
  [[ "${icons[$ws]}" == *"$glyph"* ]] || icons[$ws]+="$glyph "
done < <(aerospace list-windows --all --format '%{workspace}|%{app-name}')

args=()
for sid in 1 2 3 4 5 6 7 8 9; do
  label="${icons[$sid]% }"
  if [ "$sid" = "$FOCUSED_WORKSPACE" ]; then
    args+=(--set space.$sid drawing=on label="$label" background.drawing=on)
  elif [ -n "$label" ]; then
    args+=(--set space.$sid drawing=on label="$label" background.drawing=off)
  else
    args+=(--set space.$sid drawing=off)
  fi
done
sketchybar "${args[@]}"
