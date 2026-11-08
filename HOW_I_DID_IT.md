# How this repo was created

1. Checked the folder was empty and that `rifaterdemsahin/herdr` did not exist on GitHub:
   ```bash
   gh repo view rifaterdemsahin/herdr
   ```
2. Initialised a standalone git repo (the parent `projects/` folder is itself a repo, so a new one was needed):
   ```bash
   git init -b main
   echo "# herdr" > README.md
   git add README.md && git commit -m "Initial commit"
   ```
3. Created the private GitHub repo and pushed in one step:
   ```bash
   gh repo create rifaterdemsahin/herdr --private --source=. --push
   ```
4. Added this guide, a fuller README and `SPLIT_PANES.md`, then committed and pushed.
