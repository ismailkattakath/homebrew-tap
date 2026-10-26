cask "escrcpy" do
  arch arm: "arm64", intel: "x64"

  version "3.3.1"
  sha256 arm:   "9f46fb7199c2666cc7ab73851a2dc5b7aa15942782f89d118eaffb906208eb0c",
         intel: "e14dcd10247f94671083dc74f520cff4e92d045244c41b609f9346fd04b1fec5"

  url "https://github.com/viarotel-org/escrcpy/releases/download/v#{version}/Escrcpy-#{version}-mac-#{arch}.dmg"
  name "Escrcpy"
  desc "Graphical Scrcpy to display and control Android, devices powered by Electron"
  homepage "https://github.com/viarotel-org/escrcpy"

  livecheck do
    url :homepage
    regex(/^v?(\d+(?:\.\d+)+)$/i)
    strategy :github_latest
  end

  auto_updates false
  depends_on :macos

  app "Escrcpy.app"

  uninstall quit: "org.viarotel.escrcpy"

  zap trash: [
    "~/Library/Application Support/escrcpy",
    "~/Library/Logs/escrcpy",
    "~/Library/Preferences/org.viarotel.escrcpy.plist",
    "~/Library/Saved Application State/org.viarotel.escrcpy.savedState",
  ]

  caveats <<~EOS
    1. Escrcpy includes built-in adb support.
    2. In some cases you may need to manually install scrcpy to resolve compatibility issues
    3. Make sure USB debugging is enabled on your Android device.
    4. For wireless connection, your device needs to be on the same network.
  EOS
end
