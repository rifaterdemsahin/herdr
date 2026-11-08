# 🪟 Splitting panes in herdr

Use `herdr pane split` from inside a herdr pane, or point it at any pane ID.

## ✂️ Basic splits

```bash
herdr pane split --current --direction right            # ➡️  side by side
herdr pane split --current --direction down             # ⬇️  stacked
herdr pane split --current --direction right --ratio 0.3   # 📏 30/70 split
herdr pane split --current --direction down --cwd ~/projects   # 📂 start in a folder
herdr pane split --pane <ID> --direction right --env FOO=bar   # 🔧 set an env var
```

## 🎛️ Options

| Flag | Meaning |
|------|---------|
| `--pane <ID>` / `--current` | 🎯 which pane to split |
| `--direction <right\|down>` | 🧭 split direction |
| `--ratio <FLOAT>` | 📏 size of the split |
| `--cwd <PATH>` | 📂 working directory of the new pane |
| `--env KEY=VALUE` | 🔧 environment variable for the new process |

## 🧰 Related commands

```bash
herdr pane list          # 📋 list panes and IDs
herdr pane layout        # 🗺️  show layout
herdr pane focus         # 👀 focus a neighbouring pane
herdr pane resize        # ↔️  resize a split
herdr pane zoom          # 🔍 toggle zoom
herdr pane swap / move / close   # 🔀 rearrange or ❌ close
herdr pane run           # ▶️  run a command in a pane
herdr pane send-text / send-keys # ⌨️  type into a pane
```

💡 Run `herdr pane <command> --help` for exact flags.

## 🧩 Example: 3-pane layout

```bash
herdr pane split --current --direction right --ratio 0.5   # 1️⃣ left | right
herdr pane split --current --direction down                # 2️⃣ split the new pane
```

```
┌──────────┬──────────┐
│          │  pane 2  │
│  pane 1  ├──────────┤
│          │  pane 3  │
└──────────┴──────────┘
```
