---
title: uvpip
homepage: https://github.com/yv3000/uvpip
tagline: |
  uvpip: Ultra-fast pip wrapper powered by uv.
---

To update or switch versions, run `webi uvpip@stable` (or `@v1.1.0`, `@beta`,
etc).

### Files

These are the files / directories that are created and/or modified with this
install:

```text
~/.config/envman/PATH.env
~/.local/bin/uvpip
~/.local/opt/uvpip/
```

## Cheat Sheet

> `uvpip` transparently translates common `pip` commands to `uv` for 10-100x
> faster package installs, resolution, and caching without replacing system
> Python or pip.

### Verify Installation:

```sh
uvpip doctor
```

### Transparent Usage:

Use standard pip workflows through `uvpip`:

```sh
uvpip install requests
uvpip install -r requirements.txt
uvpip list
uvpip freeze
uvpip uninstall requests
```

### Health & Diagnostic Checks:

Run diagnostics to verify Python and uv toolchain environment:

```sh
uvpip health
uvpip doctor
```

### Prerequisites:

`uvpip` requires [uv](https://webinstall.dev/uv) and a supported Python
interpreter.
