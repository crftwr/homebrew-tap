cask "keyhac" do
  version "2.6.0"
  sha256 "d16a0530a69b859c0fce60abd49d701e4dc1f6f0d573931f13fdf46d06347d5d"

  url "https://github.com/crftwr/keyhac/releases/download/v#{version}/Keyhac-#{version}-macos.dmg"
  name "Keyhac"
  desc "Keyboard customization and UI automation in Python"
  homepage "https://github.com/crftwr/keyhac"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on :macos

  app "Keyhac.app"

  # A running Keyhac holds the keyboard; quit it before the app is replaced.
  uninstall quit: "crftwr.Keyhac2"

  # ~/.keyhac holds the user's config.py and is left alone.
  zap trash: "~/Library/Preferences/crftwr.Keyhac2.plist"
end
