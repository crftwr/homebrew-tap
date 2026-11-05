cask "xefm" do
  version "1.13.1"
  sha256 "6702d51c761ada3a9277ec495d2a35c8c1beb7ac142c717fb4cb2041a152ec57"

  url "https://github.com/crftwr/xefm/releases/download/v#{version}/XeFM-#{version}-macos.dmg"
  name "XeFM"
  desc "Dual-pane file manager"
  homepage "https://github.com/crftwr/xefm"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "XeFM.app"

  # ~/.xefm is left alone: the terminal app (the xefm formula, pip, uv) reads
  # the same config and state.
  zap trash: [
    "~/Library/Preferences/com.xefm.app.plist",
    "~/Library/Saved Application State/com.xefm.app.savedState",
  ]

  caveats <<~EOS
    This is the desktop app. For the terminal app, install the formula:
      brew install crftwr/tap/xefm
  EOS
end
