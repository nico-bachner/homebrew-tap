# Homebrew Tap

Homebrew formulae by [nico-bachner](https://github.com/nico-bachner). See [`Formula/`](Formula) for what's available.

## Installation

```sh
brew install nico-bachner/tap/<formula>
```

Installing by full name taps the repository and trusts that formula. See [Tap Trust](https://docs.brew.sh/Tap-Trust) for other options.

## Contributing

Each formula's source repository bumps `url`, `version`, and `sha256` on release, so don't edit those lines by hand.

Commits follow Homebrew's style: `mdpaper 0.1.0 (new formula)` for a new formula, `mdpaper 0.1.0` for a version update, and `mdpaper: allow Linux` for other formula changes. Changes that are not about one formula use a plain sentence, such as `Document installation`.
