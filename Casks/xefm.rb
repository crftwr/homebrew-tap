cask "xefm" do
  version "1.8.0"
  sha256 "663c6653808211e905dcdefdfda547228e09821742804d6e4cacf798419eb703"

  url "https://github.com/crftwr/xefm/releases/download/v#{version}/XeFM-#{version}-macos.dmg"
  name "XeFM"
  desc "Dual-pane file manager"
  homepage "https://github.com/crftwr/xefm"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on :macos

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
