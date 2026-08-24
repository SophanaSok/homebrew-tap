# homebrew-tap

Homebrew formulae for [SophanaSok](https://github.com/SophanaSok)'s projects.

## Install

```sh
brew install sophanasok/tap/ai-usage-tui
```

Or tap it first:

```sh
brew tap sophanasok/tap
brew install ai-usage-tui
```

Works on macOS (Apple Silicon and Intel) and on Linux (x86_64 and aarch64).

## Formulae

| Formula | What it is |
| --- | --- |
| `ai-usage-tui` | A btop-inspired terminal dashboard for AI token usage, cost, and model-routing analytics — [source](https://github.com/SophanaSok/ai-usage-tui) |

## How this is maintained

`Formula/ai-usage-tui.rb` is **generated, not hand-edited.** Every tagged release of
[ai-usage-tui](https://github.com/SophanaSok/ai-usage-tui) renders it from the real published
artifact names and their SHA-256 checksums and pushes it here.

Editing it by hand will be overwritten by the next release. It is generated precisely because
hand-maintained versions and checksums drifted from the published artifacts before — the formula
asked for `0.2.0` while the tarball was tagged `v0.2.0`, so every URL 404'd.
