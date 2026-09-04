# Directories where Claude Code is allowed to run (subdirectories included).

CLAUDE_ALLOWED_DIRS=(
  "$HOME/Documents/code"
  "$HOME/.local/share/chezmoi"
)

claude() {
  local dir
  for dir in "${CLAUDE_ALLOWED_DIRS[@]}"; do
    if [[ "$PWD" == "$dir" || "$PWD" == "$dir"/* ]]; then
      command claude "$@"
      return
    fi
  done
  echo "Claude Code is not allowed in: $PWD" >&2
  echo "Allowed roots: ${CLAUDE_ALLOWED_DIRS[*]}" >&2
  return 1
}
