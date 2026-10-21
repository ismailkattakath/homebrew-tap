# ismailkattakath/homebrew-tap

Homebrew casks for apps that aren't in homebrew/cask.

```bash
brew tap ismailkattakath/tap
brew install --cask ismailkattakath/tap/<cask>
```

Non-official taps must be trusted before Homebrew loads their casks
(`HOMEBREW_REQUIRE_TAP_TRUST`).

| Cask | App | Notes |
|---|---|---|
| `civitai-live-wallpaper` | [CivitAI Live Wallpaper](https://gitlab.com/izzykatt/civitai-live-wallpaper) | Ad-hoc signed, not notarized: clear quarantine once (see the cask's caveats). |
| `escrcpy` | [Escrcpy](https://github.com/viarotel-org/escrcpy) | From [viarotel-org/homebrew-escrcpy](https://github.com/viarotel-org/homebrew-escrcpy) (Apache-2.0, see `LICENSE`), with `depends_on macos: :catalina` removed — that symbol is disabled in Homebrew 7. The upstream fix ([viarotel-org/homebrew-escrcpy#61](https://github.com/viarotel-org/homebrew-escrcpy/pull/61)) was closed unmerged. |

Each cask pins `version` + `sha256`; bump both together when the app releases.
