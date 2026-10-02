# abhskyd/tap

Homebrew tap for [finder](https://github.com/abhskyd/finder) — a fast, modern TUI file manager in Rust.

## Install

```bash
brew tap abhskyd/tap
brew trust abhskyd/tap   # Homebrew 7+ requires trusting third-party taps
brew install finder
```

Or in one line:

```bash
brew install abhskyd/tap/finder
```

The formula builds from source with `cargo` (Homebrew installs Rust as a build dependency automatically).
