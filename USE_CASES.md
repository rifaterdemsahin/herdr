# 💡 Use cases: commanding Claude Code to use herdr

Claude Code can drive herdr for you. Type the prompts below into Claude Code and it will run the `herdr` CLI inside your current herdr pane. 🪟

## 🚦 Before you start

- 🔐 Claude only controls herdr when it runs **inside a herdr pane**. Check with:
  ```bash
  test "${HERDR_ENV:-}" = 1 && echo "inside herdr"
  ```
- 🏷️ Say the word **herdr** in your prompt. The herdr skill is only loaded when you mention it.
- 🧭 Run `herdr --help` or `herdr pane --help` to see the exact flags on your install.
- 🧪 Don't ask Claude to "demo" a split on your live session. Ask for a real layout you actually want.

## 🎯 Prompts you can give Claude Code

| 🎯 Goal | 💬 Prompt to type | 🔧 What Claude typically runs |
|---------|-------------------|-------------------------------|
| 🟦 2×2 grid | "Use herdr to split my current pane into a 2x2 grid." | `herdr pane split --current --direction right --no-focus`, then `down` on each side |
| 📜 Logs beside you | "Use herdr to open a pane on the right and run `npm run dev` there." | `herdr pane split` + `herdr pane run` |
| 🔎 Read another pane | "Use herdr to read the pane to my right and summarise any errors." | `herdr pane list` + `herdr pane read <id> --source recent-unwrapped` |
| ⏳ Wait for tests | "Split down, run the tests there, and tell me when they finish." | `herdr pane run` + `herdr pane wait-output --match "test result"` |
| 🤖 Helper agent | "Use herdr to start a Claude agent named `reviewer` in a pane below you and ask it to review the diff." | `herdr agent start reviewer --kind claude --pane <id>` + `herdr agent prompt --wait` |
| 🚧 Unstick an agent | "Check whether the reviewer agent is blocked and show me the prompt before answering." | `herdr agent get reviewer` + `herdr agent read reviewer` |
| 🗺️ Map the layout | "Use herdr to show me the current layout and which panes are free." | `herdr pane layout` + `herdr pane list` |
| 🔍 Focus one pane | "Zoom my current herdr pane so I can read it, then unzoom." | `herdr pane zoom` |
| 🧹 Tidy up | "Close only the panes you created in this tab." | `herdr pane close <id>` |
| 🗂️ New workspace | "Create a herdr workspace called `api-work` with a tab for the server and one for tests." | `herdr workspace create`, `herdr tab create` |

## 🧠 Make Claude use herdr by default

Add a section like this to your project's `CLAUDE.md` or `AGENTS.md`, so Claude follows the same rules every session:

```markdown
## 🪟 herdr
- 🏷️ Only use herdr when I mention it.
- 🔐 Before controlling panes, run `test "${HERDR_ENV:-}" = 1`.
- ✂️ Split with `herdr pane split --current --direction right|down --cwd "$PWD" --no-focus`.
- 🆔 Read new pane IDs from `.result.pane.pane_id` in the JSON output. Never guess them.
- 🤖 For agents, use `herdr agent prompt <name> "<task>" --wait`.
- ⌨️ For plain commands, use `herdr pane run` and then `herdr pane wait-output`.
- 🛡️ Never close or refocus panes I did not ask you to touch.
```

## 🧩 Recipes

### 🧑‍💻 Dev loop: server, tests, Claude

1. 🪟 Ask Claude: "Use herdr to make a layout with the server on the right and tests below it."
2. ▶️ Claude runs the dev server on the right and the tests below.
3. 👀 Ask: "Read both panes and tell me if anything is failing."

### 🔬 Parallel review with two agents

1. 🤖 Ask: "Use herdr to start agents named `security` and `style` in new panes beside you."
2. 💬 Ask: "Prompt `security` to review the diff for security issues, and `style` for naming and formatting. Use `--wait`."
3. 📋 Ask: "Collect both answers and merge them into one list."

### 🧭 Keep focus where it is

1. 🎯 Ask: "Split my pane but keep my focus here."
2. 🧷 Claude uses `--no-focus` and `--cwd "$PWD"`, so your working folder and cursor stay put.

## ⚠️ Gotchas

- 🆔 **IDs are opaque.** Claude should read them from the JSON, like `w1:p1`, rather than guess.
- 📬 **`pane run` means queued, not done.** Use `pane wait-output` to see the command finish.
- 🚧 **`agent_blocked` means stop.** An agent is waiting at an approval dialog. Inspect it before answering.
- 🔁 **Timeouts don't mean failure.** A timed-out prompt may still have been delivered. Check with `agent read` before sending it again.
- 📏 **Long commands can be refused on macOS** if they exceed the terminal's line limit. Shorten them or put them in a script.

## 🔗 See also

- 🪟 [SPLIT_PANES.md](SPLIT_PANES.md) – the split commands and flags
- 🤖 [AGENTS.md](AGENTS.md) – conventions for AI agents in this repo
- 📖 [README.md](README.md) – overview and links
