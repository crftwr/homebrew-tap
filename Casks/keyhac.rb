cask "keyhac" do
  version "2.7.0"
  sha256 "02d603fc7f87e5aba352d3f902fd60979199318c778caa98d72bcc61338d15b8"

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
