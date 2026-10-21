cask "civitai-live-wallpaper" do
  version "1.3.0"
  sha256 "e015a266f3f47f9415909e57b543d69a5a99c284783fa67e7f0354e3fc82f15f"

  url "https://gitlab.com/api/v4/projects/84910843/packages/generic/civitai-live-wallpaper/v#{version}/CivitAI-Live-Wallpaper.dmg"
  name "CivitAI Live Wallpaper"
  desc "Menu bar app that rotates CivitAI images and videos as live desktop wallpapers"
  homepage "https://gitlab.com/izzykatt/civitai-live-wallpaper"

  # The source project is private: its releases/tags APIs are not readable anonymously
  # (only the package registry holding the DMGs is public), so there is no version feed.
  livecheck do
    skip "No anonymous version source (private project; only release DMGs are public)"
  end

  depends_on macos: ">= :sonoma"

  app "CivitAI Live Wallpaper.app"

  uninstall quit: "ai.aloshy.civitai-live-wallpaper"

  zap trash: [
    "~/.cache/civitai-live-wallpaper",
    "~/.local/share/civitai-live-wallpaper",
    "~/Library/Caches/ai.aloshy.civitai-live-wallpaper",
    "~/Library/HTTPStorages/ai.aloshy.civitai-live-wallpaper",
    "~/Library/Preferences/ai.aloshy.civitai-live-wallpaper.plist",
  ]

  caveats <<~EOS
    CivitAI Live Wallpaper is ad-hoc signed (hardened runtime) but not notarized, so
    Gatekeeper blocks the first launch of a quarantined copy. Clear the flag once:
      xattr -dr com.apple.quarantine "/Applications/CivitAI Live Wallpaper.app"

    `brew uninstall --zap` does not remove the sign-in kept in the login Keychain
    (service "com.civitai.live-wallpaper"); delete it in Keychain Access if wanted.
  EOS
end
