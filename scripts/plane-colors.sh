#!/usr/bin/env bash
# 🎨 Name and color the 8 planes in the current herdr workspace.
# Safe to re-run: renames and metadata are overwritten, and the config block is added only once.
set -euo pipefail

TAB="${HERDR_TAB_ID:-w1:t1}"
CFG="${HERDR_CONFIG_PATH:-$HOME/.config/herdr/config.toml}"

# pane  name                    token              label
PLANES=(
  "w1:p1|real-claude|plane_real|real → claude"
  "w1:p2|environment-antigravity|plane_environment|environment → antigravity"
  "w1:p3|simulation-kilo|plane_simulation|simulation → kilo"
  "w1:p4|ui-mimo|plane_ui|ui → mimo"
  "w1:p5|symbols-claude|plane_symbols|symbols → claude"
  "w1:p6|semblance-antigravity|plane_semblance|semblance → antigravity"
  "w1:p7|test-kilo|plane_test|test → kilo"
  "w1:p8|orchestrator-mimo|plane_orchestrator|orchestrator → mimo"
)

for entry in "${PLANES[@]}"; do
  IFS='|' read -r pane name token label <<<"$entry"
  herdr pane rename "$pane" "$name" >/dev/null
  herdr pane report-metadata "$pane" --source plane --token "$token=$label" >/dev/null
  echo "✅ $pane → $name"
done

# 🌈 Sidebar styling: add the plane row once.
if ! grep -q "# Plane colors" "$CFG" 2>/dev/null; then
  cat >> "$CFG" <<'EOF'

# Plane colors: each plane's pane reports its own plane_* token; these style them.
[ui.sidebar.agents]
rows = [["state_icon", "machine", "workspace", "tab"], ["agent"], [{ token = "$plane_real", fg = "#f38ba8", bold = true }, { token = "$plane_environment", fg = "#a6e3a1", bold = true }, { token = "$plane_simulation", fg = "#89b4fa", bold = true }, { token = "$plane_ui", fg = "#f9e2af", bold = true }, { token = "$plane_symbols", fg = "#cba6f7", bold = true }, { token = "$plane_semblance", fg = "#94e2d5", bold = true }, { token = "$plane_test", fg = "#fab387", bold = true }, { token = "$plane_orchestrator", fg = "#f5c2e7", bold = true }]]
EOF
  echo "🧩 Added plane colors to $CFG"
fi

herdr config check
herdr server reload-config
echo "🎉 Done. Check the herdr sidebar."
