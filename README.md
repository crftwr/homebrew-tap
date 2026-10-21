# crftwr/tap

Homebrew tap for [XeFM](https://github.com/crftwr/xefm), a dual-pane file manager.

## XeFM

| You want | Install with |
|---|---|
| The desktop app (macOS, Apple silicon) | `brew install --cask crftwr/tap/xefm` |
| The terminal app (macOS, Linux) | `brew install crftwr/tap/xefm` |
| The terminal app, plus Python libraries of your own | `uv tool install xefm` or `pipx install xefm` |

The cask installs `XeFM.app`, the notarized build from the
[GitHub Releases](https://github.com/crftwr/xefm/releases). It does not put an
`xefm` command on your PATH.

The formula installs the `xefm` command in an environment Homebrew owns and
rebuilds on every upgrade, so anything added to it by hand is lost. If your
`config.py` imports a library XeFM doesn't ship, or you want a Pillow plugin
such as `pillow-heif`, install with uv or pipx instead:

```bash
uv tool install xefm --with pillow-heif
pipx install xefm && pipx inject xefm pillow-heif
```

Both apps read the same `~/.xefm` configuration.
