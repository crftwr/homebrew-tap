# crftwr/tap

Homebrew tap for [XeFM](https://github.com/crftwr/xefm), a dual-pane file manager,
and [Keyhac](https://github.com/crftwr/keyhac), keyboard customization and UI
automation in Python.

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

## Keyhac

```bash
brew install --cask crftwr/tap/keyhac
```

Installs `Keyhac.app`, the notarized build from the
[GitHub Releases](https://github.com/crftwr/keyhac/releases), for Apple silicon.
A running Keyhac is quit before an upgrade replaces it. If you already have
`Keyhac.app` in `/Applications` from the DMG, add `--adopt` to hand it over to
Homebrew. `~/.keyhac` is never touched, not even by `--zap`.
