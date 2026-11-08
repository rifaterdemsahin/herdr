# Splitting panes in herdr

Use `herdr pane split` (from inside a herdr pane, or against any pane ID).

```bash
herdr pane split --current --direction right          # side by side
herdr pane split --current --direction down           # stacked
herdr pane split --current --direction right --ratio 0.3
herdr pane split --current --direction down --cwd ~/projects
herdr pane split --pane <ID> --direction right --env FOO=bar
```

Options: `--pane <ID>` / `--current`, `--direction <right|down>`, `--ratio <FLOAT>`, `--cwd <PATH>`, `--env KEY=VALUE`.

## Related commands

```bash
herdr pane list                       # list panes and IDs
herdr pane layout                     # show layout
herdr pane focus                      # focus a neighbouring pane
herdr pane resize                     # resize a split
herdr pane zoom                       # toggle zoom
herdr pane swap / move / close
herdr pane run                        # run a command in a pane
herdr pane send-text / send-keys      # type into a pane
```

Run `herdr pane <command> --help` for exact flags.

## Example: 3-pane layout

```bash
herdr pane split --current --direction right --ratio 0.5
herdr pane split --current --direction down
```
