cask "keyhac" do
  version "2.10.0"
  sha256 "4b15e8b895138dfa7d4002ea0a8ca14a2887ae1bd6723421a62bf5e162f6c403"

  url "https://github.com/crftwr/keyhac/releases/download/v#{version}/Keyhac-#{version}-macos.dmg"
  name "Keyhac"
  desc "Keyboard customization and UI automation in Python"
  homepage "https://github.com/crftwr/keyhac"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :monterey

  app "Keyhac.app"

  # A running Keyhac holds the keyboard; quit it before the app is replaced.
  uninstall quit: "crftwr.Keyhac2"

  # ~/.keyhac holds the user's config.py and is left alone.
  zap trash: "~/Library/Preferences/crftwr.Keyhac2.plist"
end
