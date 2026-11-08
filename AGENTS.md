# 🤖 AGENTS.md

Guidance for AI agents working in this repo.

## 📌 Project
- 🐴 `herdr` – terminal workspace manager for AI coding agents (`/opt/homebrew/bin/herdr`).
- 🌍 GitHub: public repo `rifaterdemsahin/herdr`, branch `main`.

## 📚 Files
- 📖 `README.md` – overview and links
- 🛠️ `HOW_I_DID_IT.md` – how the repo was created
- 🪟 `SPLIT_PANES.md` – how to split panes (`herdr pane split`)
- 💡 `USE_CASES.md` – prompts and recipes for commanding Claude Code to use herdr
- 🌐 `index.html` – the Pages site: top menu, client-side markdown renderer that loads the `.md` files above

## ✅ Conventions (remember these)
- 😀 **Use emojis** in markdown docs: in headings, table cells and list items.
- ✂️ **Splitting panes:** `herdr pane split --current --direction <right|down> [--ratio F] [--cwd PATH]`. Details in `SPLIT_PANES.md`.
- 🧪 Don't run `herdr pane split` just to demo it; it changes the user's live session. Document it instead.
- 💾 After doc changes: commit and push to `main`.
- 🌐 "Open local" means opening in Google Chrome: `open -a "Google Chrome" <url>`.
- 🔗 Commits end with the `Co-Authored-By` attribution line.
- 🗣️ Reply with emojis. Pages site: https://rifaterdemsahin.github.io/herdr/ (served from `main`, `/`).
